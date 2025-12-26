create or replace view actual_retail_view as
 WITH online_currency AS (
         SELECT ranked.currency_code,
            ranked.rate_to_eur,
            ranked.rate_date
           FROM ( SELECT exchange_rates.currency_code,
                    exchange_rates.rate_to_eur,
                    exchange_rates.rate_date,
                    dense_rank() OVER (PARTITION BY exchange_rates.currency_code ORDER BY exchange_rates.rate_date DESC) AS rnk
                   FROM exchange_rates) ranked
          WHERE ranked.rnk = 1
        )

 SELECT r.invoice
    ,r.stockcode
    ,r.description
    ,r.quantity
    ,r.invoicedate
	,EXTRACT(year from r.invoicedate) AS year_sale
	,EXTRACT(month from r.invoicedate) AS month_sale
	,ROUND(SUM(r.quantity::numeric * r.price * e.rate_to_eur) over (partition by DATE_TRUNC('month', r.invoicedate)::date), 2) AS total_revenue_eur
	-- Statistical Forecast Formula (Holt’s Linear Trend)
	-- L_t = α * Y_t + (1 - α) * (L_{t-1} + T_{t-1})
	-- T_t = β * (L_t - L_{t-1}) + (1 - β) * T_{t-1}
	-- Forecast_{t+h} = L_t + h * T_t
	,ROUND(SUM(r.quantity::numeric * r.price * e.rate_to_eur) 
	      OVER (PARTITION BY DATE_TRUNC('month', r.invoicedate)::date
	            ORDER BY DATE_TRUNC('month', r.invoicedate)::date
	            ROWS BETWEEN 2 PRECEDING AND CURRENT ROW) / 3, 2) AS moving_avg_forecast
    ,r.price
    ,r.customerid
    ,r.country
    ,c.currency_code AS currency
    ----Controller
	--Revenue: the total money earned from selling products before any costs are deducted.
	,round(r.quantity::numeric * r.price * e.rate_to_eur, 2) AS revenue_eur
    ,r.quantity::numeric * r.price AS revenue
	--Cost of Goods Sold (COGS): the direct costs of buying or producing the goods that were sold.
	,(r.quantity::numeric * r.price) * 0.60 AS COGS
	-- Gross Margin: Gross Margin shows how much money remains after COGS, to cover operating costs and profit.
	,(r.quantity::numeric * r.price) * 0.40 AS "Gross Margin"
	,CASE
	  WHEN r.invoicedate >= (date_trunc('month', r.invoicedate) + interval '1 month' - interval '1 days')
	  THEN (r.quantity::numeric * r.price)
	  ELSE 0
	END AS ar_amount_assumed
	--
    ,lag(r.quantity::numeric * r.price) OVER (PARTITION BY r.invoice ORDER BY r.invoicedate) AS prev_invoicedate
    ,round((r.quantity::numeric * r.price - lag(r.quantity::numeric * r.price) OVER (PARTITION BY r.invoice ORDER BY r.invoicedate)) / 
	NULLIF(lag(r.quantity::numeric * r.price) OVER (PARTITION BY r.invoice ORDER BY r.invoicedate), 0::numeric) * 100::numeric, 2) AS growth_pct
	,CASE
		WHEN (r.customerid::numeric % 2) = 0 THEN 'A'
		ELSE 'B'
	END AS ab_group
    ,CASE
	   WHEN (r.customerid::numeric % 2) = 0  THEN price --'B'
	   ELSE price * 0.9 --'A'
    END AS new_price
	,ROUND(
        quantity::numeric *
        CASE
		   WHEN (r.customerid::numeric % 2) = 0  THEN price --'B'
		   ELSE price * 0.9 --'A'
	    END  * 
		rate_to_eur
		, 2 ) AS new_revenue_eur
	
   FROM retail_all r
     LEFT JOIN ( SELECT country_currency.country,
            COALESCE(country_currency.currency_code, 'EUR'::character varying) AS currency_code
           FROM country_currency) c ON r.country = c.country::text
     LEFT JOIN online_currency e ON c.currency_code::text = e.currency_code::text
  ORDER BY r.invoicedate;




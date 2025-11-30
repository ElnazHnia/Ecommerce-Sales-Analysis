import pandas as pd

# Path to your Excel file
excel_path = r"D:\Master\job\Data Analyst\Ecommerce-Sales-Analysis\DATA\online_retail_II.xlsx"

# Load the Excel file (the dataset has two sheets)
xls = pd.ExcelFile(excel_path)
print("Sheets:", xls.sheet_names)

# Load both sheets
for sheet in xls.sheet_names:
    df = pd.read_excel(xls, sheet_name=sheet)
    csv_path = fr"D:\Master\job\Data Analyst\Ecommerce-Sales-Analysis\DATA\{sheet}.csv"
    df.to_csv(csv_path, index=False)
    print(f"✅ Saved: {csv_path}")

import csv
import pandas as pd

def log_nutrition(product_name, nutriments):
    with open("nutrition_log.csv", "a", newline="") as file:
        writer = csv.writer(file)
        writer.writerow([
            product_name,
            nutriments.get("energy-kcal_100g", 0),
            nutriments.get("sugars_100g", 0),
            nutriments.get("fat_100g", 0)
        ])
    print(f"✅ {product_name} logged in your daily nutrition record!")

def show_daily_intake():
    try:
        df = pd.read_csv("nutrition_log.csv", names=["Product", "Calories", "Sugar", "Fat"])
        print("\n📅 Daily Nutrition Summary:")
        print(df.groupby("Product").sum())
    except FileNotFoundError:
        print("📁 No records found for today.")

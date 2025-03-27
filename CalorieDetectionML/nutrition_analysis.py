import requests

def get_nutrition_info(barcode):
    food_database = {
        "8904063252517": {"name": "Chiwda", "calories": 516, "sugar": 4, "allergens": ["milk"]},
        "1234567890123": {"name": "Oats", "calories": 389, "sugar": 1, "allergens": []}
    }
    
    if barcode in food_database:
        return food_database[barcode]
    
    api_url = f"https://world.openfoodfacts.org/api/v0/product/{barcode}.json"
    response = requests.get(api_url)
    
    if response.status_code != 200:
        return None
    
    try:
        data = response.json()
        product = data.get("product", {})
        return {
            "name": product.get("product_name", "Unknown Food"),
            "calories": product.get("nutriments", {}).get("energy-kcal", "N/A"),
            "sugar": product.get("nutriments", {}).get("sugars", "N/A"),
            "allergens": product.get("allergens_tags", [])
        }
    except:
        return None

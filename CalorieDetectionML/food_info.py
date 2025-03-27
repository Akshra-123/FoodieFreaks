import requests

def get_food_info(barcode):
    """Fetch food details using the Open Food Facts API."""
    url = f"https://world.openfoodfacts.org/api/v0/product/{barcode}.json"
    response = requests.get(url)
    data = response.json()

    if "product" in data:
        product_name = data["product"].get("product_name", "Unknown Product")
        nutriments = data["product"].get("nutriments", {})
        ingredients = data["product"].get("ingredients_text", "No ingredients listed")
        return product_name, nutriments, ingredients.lower()
    
    return None, None, None

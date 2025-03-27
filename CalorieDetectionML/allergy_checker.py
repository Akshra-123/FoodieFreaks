def check_allergies(ingredients, allergy_list):
    """Check if any allergens are present in the ingredients."""
    for allergen in allergy_list:
        if allergen in ingredients:
            return f"❌ WARNING: This product contains {allergen}, which you are allergic to!"
    return "✅ Safe to consume, no known allergens detected."

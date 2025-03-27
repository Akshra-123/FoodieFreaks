def check_allergens(allergens, user_allergies):
    found_allergens = [allergy for allergy in user_allergies if allergy in allergens.lower()]
    if found_allergens:
        return f"⚠️ WARNING: This product contains {', '.join(found_allergens)}!"
    return "✅ No allergens detected."

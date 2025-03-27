import tensorflow as tf

def recommend_intake(nutriments, calorie_limit, sugar_limit, fat_limit, health_conditions):

    """Recommend food intake based on user-defined health limits."""
    if not nutriments:
        return "❌ No nutrition data available."

    calories = nutriments.get("energy-kcal_100g", 0)
    sugar = nutriments.get("sugars_100g", 0)
    fat = nutriments.get("fat_100g", 0)

    calories_intake = tf.math.minimum((calorie_limit / (calories + 1e-5)) * 100, 300)
    sugar_intake = tf.math.minimum((sugar_limit / (sugar + 1e-5)) * 100, 300)
    fat_intake = tf.math.minimum((fat_limit / (fat + 1e-5)) * 100, 300)

    recommended_intake = tf.math.minimum(tf.math.minimum(calories_intake, sugar_intake), fat_intake)
    return f"✅ Based on your preferences, you should eat around {recommended_intake.numpy():.2f} grams of this food item."

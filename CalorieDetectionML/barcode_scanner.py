import cv2
from pyzbar.pyzbar import decode
from food_info import get_food_info
from allergen_checker import check_allergens
from intake_recommender import recommend_intake
import pyttsx3

engine = pyttsx3.init()

def speak(text):
    """Convert text to speech if voice assistant is enabled."""
    if use_voice_assistant:
        engine.say(text)
        engine.runAndWait()

use_voice_assistant = input("Do you want to enable the voice assistant? (yes/no): ").strip().lower() == "yes"

if use_voice_assistant:
    speak("Welcome to Foodie Freak! I will assist you with food ingredient detection and recommendations.")

speak("Please enter your daily dietary limits.")
calorie_limit = float(input("Enter your daily calorie limit (kcal): "))
speak(f"You have set a calorie limit of {calorie_limit} kcal.")

sugar_limit = float(input("Enter your daily sugar limit (grams): "))
speak(f"You have set a sugar limit of {sugar_limit} grams.")

fat_limit = float(input("Enter your daily fat limit (grams): "))
speak(f"You have set a fat limit of {fat_limit} grams.")

speak("Ok Now tell me do you suffer from any kind of allergy")
user_allergies = input("Enter your allergies (comma-separated, e.g., nuts, gluten, milk): ").lower().split(",")
speak(f"Noted your allergies: {', '.join(user_allergies)}")

speak("Please enter any health conditions you have like diabetes , cholestrol etc.")
health_conditions = input("Do you have any health conditions (e.g., diabetes, cholesterol, obesity)? Enter comma-separated: ").lower().split(",")
speak(f"Health conditions noted: {', '.join(health_conditions)}")

image_path = input("Enter the path of the barcode image: ")  
image = cv2.imread(image_path)

barcodes = decode(image)
if not barcodes:
    print("❌ No barcode detected. Try another image.")
    speak("No barcode detected. Please try again.")
else:
    for barcode in barcodes:
        barcode_data = barcode.data.decode("utf-8")
        print(f"Detected Barcode: {barcode_data}")
        speak("Barcode detected                     Thank you")

        product_name, nutriments, ingredients = get_food_info(barcode_data)

        if product_name:
            print(f"🍽️ Food Item: {product_name}")
            speak(f"Food Item: {product_name}")

            allergy_warning = check_allergens(ingredients, user_allergies)
            print(allergy_warning)
            speak(allergy_warning)

            recommendation = recommend_intake(nutriments, calorie_limit, sugar_limit, fat_limit, health_conditions)
            print(recommendation)
            speak(recommendation)
        else:
            print("❌ No details found for this barcode in the database.")
            speak("No details found for this barcode in the database.")

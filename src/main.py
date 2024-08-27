from dotenv import load_dotenv
import os
from OCR.webdriver import *

def main():
    load_dotenv()

    OPENAI_API_KEY = os.getenv('OPENAI_API_KEY')

    print("OpenAI Key:", OPENAI_API_KEY)

    # Test webdriver
    # driver_test()
    driver_test_two()

if __name__ == "__main__":
    main()
import requests
from dotenv import load_dotenv
import os

load_dotenv()

OPENAI_API_KEY = os.getenv('OPENAI_API_KEY')

print("OpenAI Key:", OPENAI_API_KEY)
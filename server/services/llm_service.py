from typing import List
import google.generativeai as genai

from config import Config

settings = Config()


class LLMService:
    def __init__(self):
        genai.configure(settings.GEMINI_API_KEY)
        self.model = genai.GenerativeModel(model_name="gemini-2.0-flash-exp")

    def generate_response(self, query: str, search_results: List[dict]): ...

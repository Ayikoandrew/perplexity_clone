from typing import List
import google.generativeai as genai

from config import Config

settings = Config()


class LLMService:
    def __init__(self):
        genai.configure(api_key=settings.GEMINI_API_KEY)
        self.model = genai.GenerativeModel(model_name="gemini-2.0-flash-exp")

    def generate_response(self, query: str, search_results: List[dict]):
        try:
            content_text = "\n\n".join(
                [
                    f"Source {i+1} {result['url']}:{result['content']}"
                    for i, result in enumerate(search_results)
                ]
            )

            full_prompt = f"""
                Context from web search:
                {content_text}
                
                Query: {query}
                
                Please provide a detailed well-cited, accurate response using the above response. 
                Reason and think deeply. Ensure it answers the query the user is asking. 
                Do not use the knowledge until it is absolutely necessary.
            """

            response = self.model.generate_content(full_prompt, stream=True)

            for chunk in response:
                yield chunk.text

        except:
            print("Unexpected error occurred")

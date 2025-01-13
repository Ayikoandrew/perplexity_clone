import trafilatura
from config import Config
from tavily import TavilyClient

settings = Config()

tavily_client = TavilyClient(api_key=settings.TAVILY_API_KEY)


class SearchService:
    async def web_seach(self, query: str):
        try:
            results = []
            response = tavily_client.search(query=query, max_results=3)
            search_result = response.get("results", [])

            for result in search_result:
                downloaded = trafilatura.fetch_url(result.get("url"))
                content = trafilatura.extract(downloaded, include_comments=False)

                results.append(
                    {
                        "title": result.get("title", ""),
                        "url": result.get("url", ""),
                        "content": content,
                    }
                )

            return results
        except Exception as e:
            print(e)

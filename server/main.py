from fastapi import FastAPI

from models.chat_body import ChatBody
from services.search_service import SearchService
from services.sort_source_service import SortSourceService

app = FastAPI()

search_service = SearchService()
sort_source_service = SortSourceService()


@app.post("/chat")
async def chat_endpoint(body: ChatBody):
    search_results = await search_service.web_seach(body.query)
    sorted_result = sort_source_service.sort_sources(body.query, search_results)
    print(sorted_result)
    return body.query

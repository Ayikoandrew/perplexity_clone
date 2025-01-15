import asyncio
from fastapi import FastAPI, WebSocket

from models.chat_body import ChatBody
from services.llm_service import LLMService
from services.search_service import SearchService
from services.sort_source_service import SortSourceService

app = FastAPI()

search_service = SearchService()
sort_source_service = SortSourceService()
llm_service = LLMService()


@app.websocket("/ws/chat")
async def websocket_chat(websocket: WebSocket):
    await websocket.accept()
    try:
        data = await websocket.receive_json()
        query = data.get("query")

        search_results = await search_service.web_seach(query)

        sorted_result = sort_source_service.sort_sources(query, search_results)

        await asyncio.sleep(0.1)
        await websocket.send_json(
            {
                "type": "search_result",
                "data": sorted_result,
            }
        )
        for chunk in llm_service.generate_response(query, sorted_result):
            await asyncio.sleep(0.1)
            await websocket.send_json({"type": "content", "data": chunk})

    except:

        print("Unexpected error occurred.")
    finally:
        await websocket.close()


@app.post("/chat")
async def chat_endpoint(body: ChatBody):
    search_results = await search_service.web_seach(body.query)
    sorted_result = sort_source_service.sort_sources(body.query, search_results)
    response = llm_service.generate_response(body.query, sorted_result)
    return response

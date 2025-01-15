from typing import List

from sentence_transformers import SentenceTransformer
import numpy as np


class SortSourceService:
    def __init__(self):
        self.embedding_model = SentenceTransformer("all-MiniLM-L6-v2")

    def sort_sources(self, query: str, search_result: List[dict]):
        try:
            relevant_docs = []
            qeury_embedding = self.embedding_model.encode(query)
            for res in search_result:
                res_embedding = self.embedding_model.encode(res.get("content", ""))

                similarity = float(
                    np.dot(qeury_embedding, res_embedding)
                    / (np.linalg.norm(qeury_embedding) * np.linalg.norm(res_embedding))
                )
                res["relevance_score"] = similarity

                if similarity > 0.3:
                    relevant_docs.append(res)

                return sorted(
                    relevant_docs, key=lambda x: res["relevance_score"], reverse=True
                )
        except Exception as e:

            print(e)

from fastapi import FastAPI
from pydantic import BaseModel
from haystack.document_store.elasticsearch import ElasticsearchDocumentStore
from haystack.retriever.sparse import ElasticsearchRetriever

app = FastAPI()

# Create Document Store
document_store = ElasticsearchDocumentStore(
    host="localhost",
    username="",
    password="",
    index="document",
)

# Create Retriever
retriever = ElasticsearchRetriever(document_store=document_store)

# Create Reader
class QueObj(BaseModel):
    question: str
    num_answers: int
    num_docs: int

@app.post("/query")
async def query(q: QueObj):
    return {"answer": "Hello World"}
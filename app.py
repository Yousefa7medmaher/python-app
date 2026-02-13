from fastapi import FastAPI, HTTPException
from pydantic import BaseModel

app = FastAPI()

class Todo(BaseModel):
    title: str
    completed: bool = False

todos = {}
current_id = 1

@app.get("/todos")
def get_todos():
    return todos

@app.post("/todos")
def add_todo(todo: Todo):
    global current_id
    todos[current_id] = todo.dict()
    current_id += 1
    return {"id": current_id - 1, **todo.dict()}

@app.put("/todos/{todo_id}")
def update_todo(todo_id: int, todo: Todo):
    if todo_id not in todos:
        raise HTTPException(status_code=404, detail="Todo not found")
    todos[todo_id] = todo.dict()
    return {"id": todo_id, **todo.dict()}

@app.delete("/todos/{todo_id}")
def delete_todo(todo_id: int):
    if todo_id not in todos:
        raise HTTPException(status_code=404, detail="Todo not found")
    del todos[todo_id]
    return {"message": "Deleted successfully"}

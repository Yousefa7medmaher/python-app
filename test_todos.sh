#!/bin/bash

# Base URL
BASE_URL="http://127.0.0.1:8000/todos"

echo "===== Testing FastAPI Todos API ====="

# 1. GET all todos (should be empty initially)
echo -e "\n1. GET /todos"
curl -s -X GET "$BASE_URL" | jq
echo

# 2. POST new todos with Arabic text
echo -e "\n2. POST /todos - Adding todos"
TODOS=("شراء الخبز" "قراءة كتاب" "ممارسة الرياضة")

for title in "${TODOS[@]}"; do
  RESPONSE=$(curl -s -X POST "$BASE_URL" \
    -H "Content-Type: application/json" \
    -d "{\"title\":\"$title\",\"completed\":false}")
  echo "$RESPONSE"
done

# 3. GET all todos again
echo -e "\n3. GET /todos - After adding"
curl -s -X GET "$BASE_URL" | jq
echo

# 4. PUT /todos/{id} - Update a todo
echo -e "\n4. PUT /todos/1 - Mark as completed"
curl -s -X PUT "$BASE_URL/1" \
  -H "Content-Type: application/json" \
  -d "{\"title\":\"شراء الخبز\",\"completed\":true}" | jq
echo

# 5. DELETE /todos/{id} - Delete a todo
echo -e "\n5. DELETE /todos/2 - Remove second todo"
curl -s -X DELETE "$BASE_URL/2" | jq
echo

# 6. Final GET to see remaining todos
echo -e "\n6. GET /todos - Final state"
curl -s -X GET "$BASE_URL" | jq
echo

echo "===== API Test Completed ====="

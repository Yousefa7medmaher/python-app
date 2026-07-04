# Python FastAPI Todo Application

A lightweight FastAPI-based Todo REST API with Docker support and automated CI/CD pipeline.

## Features

- Create, read, update, and delete todo items
- FastAPI framework for high-performance API
- Docker multistage builds
- GitHub Actions CI/CD pipeline
- Automated API testing
- Support for Unicode and Arabic text

## Project Structure

```
python-app/
├── app.py              # FastAPI application
├── requirements.txt    # Dependencies
├── Dockerfile          # Docker configuration
├── test_todos.sh       # Integration tests
└── .github/workflows/
    └── ci.yaml         # CI/CD pipeline
```

## Installation

### Local Setup

```bash
# Clone repository
git clone https://github.com/Yousefa7medmaher/python-app.git
cd python-app

# Create virtual environment
python -m venv venv
source venv/bin/activate  # Windows: venv\Scripts\activate

# Install dependencies
pip install -r requirements.txt

# Run application
uvicorn app:app --host 0.0.0.0 --port 8000 --reload
```

### Docker Setup

```bash
# Build image
docker build -t python-app:latest .

# Run container
docker run -d -p 8000:8000 python-app:latest
```

## API Endpoints

| Method | Endpoint | Description |
|--------|----------|-------------|
| GET | `/todos` | Get all todos |
| POST | `/todos` | Create new todo |
| PUT | `/todos/{id}` | Update todo |
| DELETE | `/todos/{id}` | Delete todo |

## Usage Examples

### Get all todos
```bash
curl http://localhost:8000/todos
```

### Create todo
```bash
curl -X POST http://localhost:8000/todos \
  -H "Content-Type: application/json" \
  -d '{"title":"Buy bread","completed":false}'
```

### Update todo
```bash
curl -X PUT http://localhost:8000/todos/1 \
  -H "Content-Type: application/json" \
  -d '{"title":"Buy bread","completed":true}'
```

### Delete todo
```bash
curl -X DELETE http://localhost:8000/todos/1
```

## Testing

Run automated tests:

```bash
chmod +x test_todos.sh
./test_todos.sh
```

The test script validates all CRUD operations with example todos.

## API Documentation

Access interactive documentation:

- Swagger UI: http://localhost:8000/docs
- ReDoc: http://localhost:8000/redoc

## CI/CD Pipeline

The GitHub Actions workflow:

1. **BuildAndTest** - Tests application on every push/PR
2. **DockerBuildPush** - Builds and pushes image to Docker Hub

Required secrets:
- `DOCKER_USERNAME` - Docker Hub username
- `DOCKER_PASSWORD` - Docker Hub token

## Technologies

- **Framework**: FastAPI
- **Server**: Uvicorn (4 workers)
- **Language**: Python 3.12
- **Containerization**: Docker
- **CI/CD**: GitHub Actions

## Requirements

- Python 3.12+
- FastAPI
- Uvicorn

See `requirements.txt` for dependencies.

## Docker Image

Built with multistage approach:
- Stage 1: Build dependencies
- Stage 2: Production image with non-root user

## Troubleshooting

**Port 8000 already in use**
```bash
lsof -ti:8000 | xargs kill -9
```

**ModuleNotFoundError**
```bash
source venv/bin/activate
pip install -r requirements.txt
```

**Test script fails**
```bash
# Install curl and jq
sudo apt-get install curl jq  # Ubuntu/Debian
brew install curl jq           # macOS
```

## Author

DevOps learning project demonstrating FastAPI, Docker, and CI/CD automation.

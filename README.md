# Django Deployment with Docker, Docker Compose, and PostgreSQL.

This project demonstrates how to deploy a Django application with PostgreSQL using Docker and Docker Compose.

## Prerequisites

Ensure you have the following installed:
- [Docker](https://docs.docker.com/get-docker/)
- [Docker Compose](https://docs.docker.com/compose/install/)
- [Git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git)

## Setup Instructions

1. **Clone the repository:**
    ```bash
    git clone https://github.com/thecameluk/docker_django_postgreSQL_compose.git
    cd docker_django_postgreSQL_compose
    ```

2. **Create a `.env` file in dotenv_files:**
    ```.env
SECRET_KEY="CHANGE-ME"
DEBUG="1"
ALLOWED_HOSTS="127.0.0.1, localhost"
DB_ENGINE="django.db.backends.postgresql"
POSTGRES_DB="CHANGE-ME"
POSTGRES_USER="CHANGE-ME"
POSTGRES_PASSWORD="CHANGE-ME"
POSTGRES_HOST="localhost"
POSTGRES_PORT="5432"

    ```

3. **Build and start the containers:**
    ```bash
    docker-compose up --build
    ```

4. **Apply create a superuser:**
    ```bash
    docker-compose exec web python manage.py createsuperuser
    ```

5. **Access the application:**
    Open your web browser and go to `http://"youipserver":8000`.

## Usage

- To start the application: `docker-compose up`
- To stop the application: `docker-compose down`

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

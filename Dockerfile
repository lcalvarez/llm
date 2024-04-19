FROM python:3.11-slim

RUN apt-get update && apt-get install -y --no-install-recommends \
    gcc \
    libblas-dev \
    liblapack-dev \
    gfortran

# Install Poetry
RUN pip3 install poetry
RUN poetry config virtualenvs.create false

# Set the working directory
WORKDIR /app

# Copy the pyproject.toml file
COPY pyproject.toml /app/

# Install project dependencies
RUN poetry install --no-root

# Copy the rest of the project files
COPY . /app

# Set the entrypoint command
ENTRYPOINT []
FROM python:3.6.8

COPY Pipfile .

RUN pip install --upgrade pip && \
    pip install pipenv && \
    pipenv install --skip-lock --system --dev --verbose

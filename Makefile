SHELL = /bin/bash

test:
	echo "[INFO] Running tests from Makefile:"
	pip install --upgrade pip && pip install pipenv
	pipenv install && pipenv install --deploy --system --dev
	pytest --cov=x4np --junitxml=test_out.xml
.PHONY: test

test_in_docker:
	echo "[INFO] Running tests from Makefile in docker:"
	docker run --rm -t -v ${pwd}:/opt/x4np -w /opt/x4np python:3.6.8 make test
.PHONY: test_in_docker

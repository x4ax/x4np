SHELL = /bin/bash
TOP := $(shell pwd)

test:
	echo "[INFO] Running tests from Makefile:"
	pip install --upgrade pip && pip install pipenv
	pipenv install && pipenv install --deploy --system --dev
	pytest --cov=x4np --junitxml=test_out.xml --cov-report term --cov-report xml:test-cov.xml
.PHONY: test

test_in_docker:
	echo "[INFO] Running tests from Makefile [$(TOP)] in docker:"
	ls
	docker run --rm -t -v $(TOP):/github/workspace/x4np -w /github/workspace/x4np python:3.6.8 make test
.PHONY: test_in_docker

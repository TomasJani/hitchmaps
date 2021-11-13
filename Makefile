# Starting Services

.PHONY: prestart start-worker

migrate:
	alembic revision --autogenerate

prestart:
	# Let the DB start
	python app/tests_pre_start.py
	# Run migrations
	alembic upgrade head
	# Create initial data in DB
	python app/initial_data.py

start-worker:
	# Test connection to DB
	python app/tests_pre_start.py
	# Start Celery server
	celery -A app.worker worker -l INFO -Q main-queue -c 1

# Testing

.PHONY: test test-cov test-running

test:
	# Run tests
	pytest --cov=app --cov-report=term-missing app/tests "${@}"

test-cov:
	# Run tests with coverage
	bash scripts/test.sh --cov-report=html "${@}"

test-running:
	python app/tests_pre_start.py
	bash ./scripts/test.sh "$@"

# Linting/Formatting

.PHONY: format lint precommit

format:
	isort  --force-single-line-imports .
	autoflake --remove-all-unused-imports --recursive --remove-unused-variables --in-place . --exclude=__init__.py
	black .
	isort --profile black .

precommit:
	pre-commit run --all-files

lint: format precommit
	flake8 . --ignore E2,W5 --select E,W,F,N --max-line-length=120

.DEFAULT_GOAL := lint

# CI

.PHONY: black-ci isort-ci flake8-ci

black-ci:
	black .

isort-ci:
	isort --profile black .

flake8-ci:
	flake8 . --ignore E2,W5 --select E,W,F,N --max-line-length=120

precommit-ci:
	precommit

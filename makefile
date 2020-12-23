HOST=127.0.0.1
PORT=4000
ENV=development

run:
	export HOST=$(HOST)
	export HOST=$(PORT)
	export HOST=$(ENV)
	python app.py


test:
	pytest -v tests/


clean:
	rm -Rf .pytest_cache
	rm -Rf __pycache__
	rm -Rf */*/__pycache__

build-dev:
	python -m virtualenv venv
	@echo "Load - $ source /venv/bin/activate"
	@echo "Next: Load dependencies"
	@echo "Load - $ make dependencies"


dependencies-dev:
	pip install -r requirements/development.txt


dependencies-prod:
	pip install -r requirements/production.txt


dependencies:
ifeq ($(ENV), development)
	make dependencies-dev
endif
ifeq ($(ENV), production)
	make dependencies-prod
endif
ifeq ($(ENV), undefined)
	make dependencies-prod
endif

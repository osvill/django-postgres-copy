.PHONY: ship test


ship:
	pipenv run python setup.py sdist bdist_wheel
	pipenv run twine upload dist/* --skip-existing


test:
	clear;
	pipenv run flake8 postgres_copy;
	pipenv run flake8 tests;
	pipenv run coverage run setup.py test;
	pipenv run coverage report -m;

help:
	@echo 'make install:    Add pre-commit GIT hook that strips the notebook binary data'
	@echo 'make hook:       Add pre-commit GIT hook that strips the notebook binary data'
	@echo 'make clean:      Add hook that clears notebook binary data'
	@echo 'make clean:      Run notebooks'


install: hook
	pip install nbconvert  --user
	pip install jupyterlab --user

hook:
	cp .hooks/pre-commit .git/hooks/pre-commit

clean:
	jupyter-nbconvert --ClearOutputPreprocessor.enabled=True --inplace **.ipynb

run:
	jupyter-lab .

.PHONY: nbconvert install docker

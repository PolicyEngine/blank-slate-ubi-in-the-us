PYTHON = python3.11
VENV = policyengine_env
BIN = $(VENV)/bin

.PHONY: all setup run clean check-python

all: clean setup run

check-python:
	@echo "Checking Python version..."
	@which $(PYTHON) > /dev/null || (echo "Python 3.11 is not installed. Please install it and try again." && exit 1)
	@$(PYTHON) -c "import sys; assert sys.version_info[:2] == (3, 11), 'Python 3.11 is required'" || (echo "Python 3.11 is required, but a different version is installed." && exit 1)
	@echo "Python 3.11 found."

setup: check-python
	@echo "Setting up virtual environment..."
	rm -rf $(VENV)
	$(PYTHON) -m venv $(VENV)
	@echo "Upgrading pip..."
	$(BIN)/python -m pip install --upgrade pip
	@echo "Installing requirements..."
	$(BIN)/python -m pip install -r requirements.txt
	@echo "Installing ipykernel..."
	$(BIN)/python -m pip install ipykernel
	$(BIN)/python -m ipykernel install --user --name=$(VENV)
	@echo "Setup completed."

run:
	@echo "Running notebooks..."
	$(BIN)/jupyter nbconvert --to notebook --execute blank_slate_ubi.ipynb
	$(BIN)/jupyter nbconvert --to notebook --execute charts.ipynb
	@echo "Notebooks execution completed."

clean:
	@echo "Cleaning up..."
	rm -rf $(VENV)
	find . -type f -name '*.pyc' -delete
	find . -type d -name '__pycache__' -delete
	@echo "Cleanup completed."
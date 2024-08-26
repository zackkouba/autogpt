VENV_DIR = venv
PYTHON = $(VENV_DIR)/bin/python
PIP = $(VENV_DIR)/bin/pip
SRC_DIR = src

all: run

$(VENV_DIR):
	python3 -m venv $(VENV_DIR)

install: $(VENV_DIR)
	$(PIP) install -r requirements.txt

setenv: $(VENV_DIR)
	@echo "Activating virtual environment..."
	@source $(VENV_DIR)/bin/activate

run: install
	@echo "==============================="
	@echo "Running Application"
	@echo "==============================="
	$(PYTHON) $(SRC_DIR)/__main__.py

clean:
	rm -rf $(VENV_DIR)
	find . -name "*.pyc" -delete
	find . -name "__pycache__" -delete

distclean: clean
	rm -rf $(VENV_DIR)

help:
	@echo "======================================================================="
	@echo "Usage:"
	@echo "make			- Create virtual env, install dependencies, run app"
	@echo "make install		- Install dependencies"
	@echo "make run		- Run app"
	@echo "make clean		- Clean up virtual env and bytecode"
	@echo "make distclean		- Clean everything, and dependencies"
	@echo "======================================================================="
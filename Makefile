VENV_DIR = venv
PYTHON = $(VENV_DIR)/bin/python
PIP = $(VENV_DIR)/bin/pip
SRC_DIR = src

all: run

$(VENV_DIR):
	@echo "-> Creating Virtual Environment"
	python3 -m venv $(VENV_DIR)

install: $(VENV_DIR)
	@echo "-> Installing Requirements"
	$(PIP) install -q -r requirements.txt

setenv: $(VENV_DIR)
	@echo "-> Activating Virtual Environment"
	@source $(VENV_DIR)/bin/activate

run: install
	@echo "-> Running Application"
	$(PYTHON) $(SRC_DIR)/main.py

clean:
	@echo "-> Cleaning"
	rm -rf $(VENV_DIR)
	find . -name "*.pyc" -delete
	find . -name "__pycache__" -delete

distclean: clean
	@echo "-> Dist Cleaning"
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
	
chrome-debug:
	@echo "-> Chrome Debug (WIP)"
	powershell.exe -Command "Start-Process 'C:\Program Files\Google\Chrome\Application\chrome.exe' -ArgumentList '--remote-debugging-port=9222'"

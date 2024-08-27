from selenium import webdriver
from selenium.webdriver.chrome.service import Service
from webdriver_manager.chrome import ChromeDriverManager
from selenium.webdriver.chrome.options import Options
import time

# Download and utilize ChromeDriver automatically using webdriver-manager
def driver_test():
    service = Service(ChromeDriverManager().install())
    driver = webdriver.Chrome(service=service)

    driver.get("https://www.google.com/")

    try:
        while True:
            time.sleep(1)
            if driver.service.process.poll() is not None:
                break
    finally:
        driver.quit()

def driver_test_two():
    chrome_options = Options()
    chrome_options.add_experimental_option("debuggerAddress", "127.0.0.1:9222")

    service = Service()
    driver = webdriver.Chrome(service=service, options=chrome_options)

    driver.get("https://www.google.com/")

    try:
        while True:
            time.sleep(1)
            if driver.service.process.poll() is not None:
                break
    finally:
        driver.quit()
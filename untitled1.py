
from selenium import webdriver
from selenium.webdriver.common.keys import Keys
import time
import pyperclip 

chromedriver = 'C:/Users/shb59/Downloads/chromedriver_win32/chromedriver.exe'
driver = webdriver.Chrome(chromedriver)

driver.get('https://www.naver.com/')
time.sleep(1)
print("1")
# 로그인 버튼을 찾고 클릭합니다
login_btn = driver.find_element_by_css_selector("#account > a")
login_btn.click()
time.sleep(1)
print("2")
# id, pw 입력할 곳을 찾습니다.
tag_id = driver.find_element_by_id('id')
tag_pw = driver.find_element_by_id('pw')
tag_id.clear()
print("3")
# id 입력
tag_id.click()
pyperclip.copy('shb598999')
tag_id.send_keys(Keys.CONTROL, 'v')
time.sleep(1)

# pw 입력
tag_pw.click()
pyperclip.copy('park~^^99')
tag_pw.send_keys(Keys.CONTROL, 'v')
time.sleep(1)

# 로그인 버튼을 클릭합니다
login_btn = driver.find_element_by_id('log.login')
login_btn.click()

regist_btn = driver.find_element_by_css_selector('.btn_upload > a')
regist_btn.click()
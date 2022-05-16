import requests
from bs4 import BeautifulSoup
url = 'http://help.websiteos.com/websiteos/example_of_a_simple_html_page.htm'
reqs = requests.get(url)
soup = BeautifulSoup(reqs.text, 'html.parser')
print("Title of the website is : ")
for title in soup.find_all('title'):
    print(title.get_text())
import requests
from bs4 import BeautifulSoup

def scrapFile(url: str):
    scrapThisSite = url
    req = requests.get(scrapThisSite)
    soup = BeautifulSoup(req.text, 'html.parser')

    return soup.prettify()
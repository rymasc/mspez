#Python webscrape
import requests
from bs4 import BeautifulSoup, SoupStrainer

import os
ti_gcc_url = "http://software-dl.ti.com/msp430/msp430_public_sw/mcu/msp430/MSPGCC/latest/" 
ti_url = ti_gcc_url+"index_FDS.html"
headers ={'User-Agent':'Mozilla/5.0'}
page = requests.get(ti_url)

for link in BeautifulSoup(page.text, parse_only=SoupStrainer('a'), features='html.parser'):
    if link.has_attr('href') and 'linux64' in link['href']:
        print link['href']
	os.system('wget ' + ti_gcc_url + link['href']+ ' -O mspgcc.tar.bz2')

for link in BeautifulSoup(page.text, parse_only=SoupStrainer('a'), features='html.parser'):
    if link.has_attr('href') and 'support-files' in link['href']:
        print link['href']
	os.system('wget ' + ti_gcc_url + link['href']+ ' -O support-files.zip')


ti_debug_url = "http://software-dl.ti.com/msp430/msp430_public_sw/mcu/msp430/MSPGCC/latest/"
ti_url = ti_gcc_url+"index_FDS.html"
headers ={'User-Agent':'Mozilla/5.0'}
page = requests.get(ti_url)


#for link in BeautifulSoup(page.text, parse_only=SoupStrainer('a'), features='html.parser'):
#    if link.has_attr('href') and 'MSP430 DLL' in link['href']:
#        print link['href']

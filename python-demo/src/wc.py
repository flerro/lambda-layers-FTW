import requests
import random
import boto3
import os 

from wordcloud import WordCloud, STOPWORDS
from bs4 import BeautifulSoup
from PIL import Image


s3 = boto3.client('s3')


def handler(event, context):
    tmp_img='/tmp/out.png'

    print('Generating word cloud...')

    wordcloud_from_serverlessday_2018_agenda('/tmp/out.png')
    
    print('Uploading to S3...')

    bucket = os.environ['OUT_BUCKET']
    key = 'Serverless_Days_2018.png'

    s3.upload_file(Bucket=bucket, Key=key, Filename=tmp_img)


def grey_color_func(word, font_size, position, orientation, random_state=None,
                    **kwargs):
    return "hsl(0, 0%%, %d%%)" % random.randint(60, 100)


def wordcloud_from_serverlessday_2018_agenda(out_file_path):
    url = 'https://milan.serverlessdays.io/#agenda'
    source_code = requests.get(url)
    html_content = source_code.text
    soup = BeautifulSoup(html_content, "html.parser")

    keynotes = [k.find('strong').text 
                    for k in soup.find_all('div', attrs={'class': 'keynote'})]
    talks_all = [k.find('strong').text 
                    for k in soup.find_all('div', attrs={'class': 'talk'})]
    talks = [i for i in talks_all if i[0] not in ('1','9')]
    workshops = [k.find_all('strong')[1].text 
                    for k in soup.find_all('div', attrs={'class': 'talk workshop'})]

    text = ' '.join(keynotes + talks + workshops)

    stopwords = ('era', 'top', 'non', 'for', 'how', 'and', 'with', 'the', "wouldn't", 'in', 'of', 'from', 'would', 
                    'at', 'welcome', 'then', 'ITA' , 'than', 'on', 'you', 'to')

    wc = WordCloud(color_func=grey_color_func, random_state=5, width=1280, height=720, stopwords=stopwords)
    wc.generate(text)
    wc.to_file(out_file_path)


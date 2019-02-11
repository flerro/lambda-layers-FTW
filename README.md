# Lambda Layers FTW!

Using Lambda Layers with Node.js and Python.

Code examples presented at [Serverless on stage #16](https://www.meetup.com/Serverless-Italy/events/258711904/)

[More info here](http://www.rolandfg.net/)


## Node.js Demo info

- Test Events:

  - Near Duomo:

        {
            "queryStringParameters": {
                "lat": 45.460951, 
                "lng": 9.188376
            }
        }

  - Near Mikamai:

        {
            "queryStringParameters": {
                "lat": 45.4906, 
                "lng": 9.21538
            }
        }

- Sample HTTP invocation:

    ```shell
    curl 'https://slu579if63.execute-api.eu-west-3.amazonaws.com/Prod/bikemi?lat=45.4906&lng=9.21538' | jq .

    curl 'https://slu579if63.execute-api.eu-west-3.amazonaws.com/Prod/mobike?lat=45.4906&lng=9.21538' | jq .
    ```    

## Python Demo Info

```
beautifulsoup4==4.7.1
certifi==2018.11.29
chardet==3.0.4
cycler==0.10.0
get==2018.11.19
idna==2.8
kiwisolver==1.0.1
numpy==1.16.1
Pillow==5.4.1
post==2018.11.20
public==2018.11.20
pyparsing==2.3.1
python-dateutil==2.8.0
query-string==2018.11.20
requests==2.21.0
six==1.12.0
soupsieve==1.7.3
urllib3==1.24.1
wordcloud==1.5.0
```
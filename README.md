# Lambda Layers FTW!

Code examples presented at [Serverless on stage #16](https://www.meetup.com/Serverless-Italy/events/258711904/). View also [the slides](http://www.rolandfg.net/)

For quick action use `build.sh` and `deploy.sh` scripts in the `node-demo/bin` and `pyton-demo/bin` directories. 

Install both [`aws cli`](https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-install.html) and
[`SAM cli`](https://docs.aws.amazon.com/serverless-application-model/latest/developerguide/serverless-sam-cli-install.html) are reuired to run the scripts.

## Node.js Demo contents

- Lambda Layer: Bike-sharing API wrappers for [BikeMI](https://www.bikemi.com/) and [Mobike](https://mobike.com/it/) as Lambda Layer
- Lambda Functions: functions consuming Layer APIs

Test Events for AWS Console:

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

HTTP invocation:

```shell
curl 'https://slu579if63.execute-api.eu-west-3.amazonaws.com/Prod/bikemi?lat=45.4906&lng=9.21538' | jq .

curl 'https://slu579if63.execute-api.eu-west-3.amazonaws.com/Prod/mobike?lat=45.4906&lng=9.21538' | jq .
```    

## Python Demo conents

- Lambda Layer: all python libs needed to download data and generate word cloud
- Lambda Function: generate a word cloud

Install Lambda Layer python requirements in `virtualenv`:

```shell
cd python-demo
virtualenv venv
source venv/bin
pip install -r requirements.txt
```
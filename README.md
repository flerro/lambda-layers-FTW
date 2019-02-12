# Lambda Layers FTW!

Code examples presented at [Serverless on stage #16](https://www.meetup.com/Serverless-Italy/events/258711904/), slides [available here](http://www.rolandfg.net/)

**DISCLAIMER**: Automated build/deploy scripts require some additional tweaking to be used in a real project (e.g. add error checking)

## Node.js Demo

- **Lambda Functions**: query bike-sharing service importing custom modules from Lambda Layer
- **Lambda Layer**: bike-sharing API wrappers modules for [BikeMI](https://www.bikemi.com/) and [Mobike](https://mobike.com/it/)

### Requirements
- Node.js 8
- [`aws cli`](https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-install.html) and
[`SAM cli`](https://docs.aws.amazon.com/serverless-application-model/latest/developerguide/serverless-sam-cli-install.html) for automated deployment

### Up and running

0. Download repo:

```
git clone git@github.com:flerro/lambda-layers-FTW.git
```


1. Build and deploy on AWS:

```
cd lambda-layers-FTW/node-demo
bin/build.sh
bin/deploy.sh
```

### Service invocatoon

Test Events for AWS Console:

- Near Duomo:
    ```json
    {
        "queryStringParameters": {
            "lat": 45.460951, 
            "lng": 9.188376
        }
    }
    ```
- Near Mikamai:
    ```json
    {
        "queryStringParameters": {
            "lat": 45.4906, 
            "lng": 9.21538
        }
    }
    ```

HTTP invocation:

```shell
curl 'https://slu579if63.execute-api.eu-west-3.amazonaws.com/Prod/bikemi?lat=45.4906&lng=9.21538' | jq .

curl 'https://slu579if63.execute-api.eu-west-3.amazonaws.com/Prod/mobike?lat=45.4906&lng=9.21538' | jq .
```    

## Python Demo

- Lambda Function: generate a word cloud from [Serverless Days 2018](https://milan.serverlessdays.io/) talk titles
- Lambda Layer: python libs needed to download data and generate word cloud (see `requirements.txt`)

### Requirements

- Python 3.6
- External modules in `requirements.txt`
- [`aws cli`](https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-install.html) and
[`SAM cli`](https://docs.aws.amazon.com/serverless-application-model/latest/developerguide/serverless-sam-cli-install.html) for automated deployment


### Up and running

0. Download repo

```
git clone git@github.com:flerro/lambda-layers-FTW.git
```

1. Install requirements in a virtual environment

```
cd lambda-layers-FTW/python-demo
virtualenv venv
source venv/bin
pip install -r requirements.txt
```

2. Build and deploy on AWS:

```
cd python-demo
bin/build.sh
bin/deploy.sh
```
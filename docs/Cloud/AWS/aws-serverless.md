# AWS Lambda Serverless Applications

AWS Lambda is a serverless, event-driven compute server that lets you run code for virtually any type of application or backend service without provisioning or managing servers.

<a href="https://aws.amazon.com/lambda/">https://aws.amazon.com/lambda/</a>

## Development Env
AWS Toolkit for Visual Studio Code (VSCode) provides support for serverless application. Using Toolkit for VSCode, can create serverless application containing AWS Lambda functions.

### Installation

In VSCode under Extensions, search for `AWS Toolkit`. The post-installation prompts will guide through authentication and linking with AWS.

In addition to **AWS Toolkit** the **AWS SAM CLI** is requiredto work on Lambda applications. VSCode will prompt with a dialog on the lower corner when an attempt to create Lambda SAM application is made. 

**AWS SAM CLI** can be installed via guide on <a href="https://docs.aws.amazon.com/serverless-application-model/latest/developerguide/install-sam-cli.html">https://docs.aws.amazon.com/serverless-application-model/latest/developerguide/install-sam-cli.html</a>

After installation of **AWS SAM CLI**, running `sam --version` should return the SAM CLI version, something like:
```sh
$ sam --version
SAM CLI, version 1.77.0
```

## Creating First Lambda Application


<!-- Author / Footer -->
---
<div  style="text-align: right; font-size:small; color:grey">LChen - March 21, 2023</div>
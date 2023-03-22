# AWS Lambda Serverless Functions

AWS Lambda is a compute service allowing for code to be ran without provisioning or managing server instances. Running on highly available compute infrastructure it takes on all the tasks of managing the compute resources required, tasks such as server and OS maintianance, scaling, and logging are all handled without end-user interaction.

<a href="https://docs.aws.amazon.com/lambda/latest/dg/lambda-runtimes.html">Supported languages on Lambda</a>


*The following notes will be writing Lambda functions in Python3.*

## Handler

The handler is the method in the function code that processes events. When function is invoked, the handler method is run by Lambda. 

A response is returned to caller when the handler exist.

### Syntax

The general syntax for a handler function in Python is:

```py
    def handlerName(event, context):
        ...
        return someValue
```

### Naming

By default, Lambda derives the handler name from the filename and function name. This can be overriden in the console.

For example:

**handler.py**
```py
    def lambdaHandler(event, context):
        ...
        return someValue
```

Auto-derived handler name would be `handler.lambdaHandler`.

### Return Value

Lambda handlers can optionally return a value. All values returned are serialized into a JSON format.

Return objects must be serializable into JSON, or else an error will be thrown by Lambda.

Should the handler not return anything (i.e. a `None`) Lambda will return `null`.

## Deployment

Lambda functions are deployed using a *deployment package* consisting of scripts/compiled programs and their dependencies.

### .zip

Building a deployment package with .zip archive can be done with any .zip utility. The archive must contain the **function code** and its **dependencies**.

If the function only requires the **standard libraries or AWS SDKs**, these are built into the Lambda runtime, and **do not need to be included**.

<a href="https://docs.aws.amazon.com/lambda/latest/dg/python-package.html#python-package-create-package-no-dependency">Deploying wthout dependencies</a>

<a href="https://docs.aws.amazon.com/lambda/latest/dg/python-package.html#python-package-create-package-with-dependency">Deploying with dependencies</a>

## AWS Lambda Context Objects

Lambda has a set of context objects that provide information about the invocation, function, and execution environment. Think of these like environment variables in a traditional server invironment.

See <a href="https://docs.aws.amazon.com/lambda/latest/dg/python-context.html">Developer Guide</a> for list

## Error Handling

Should Lambda run into an error, it will return the exception type, message, and HTTP status code indicating cause of error.

<a href="https://docs.aws.amazon.com/lambda/latest/dg/API_Invoke.html#API_Invoke_Errors">List of Invokatable Errors</a>


## Examples

### Hello World
Here is a simple hello world lambda handler:

**helloWorld.py**
```py
    def helloHandler(event, context):
        return 'Hello World!'
```

In the Lambda console, **Create function** give the function a name like `hello-world` and set the **Runtime** to `Python 3.9`, the rest can be left as is.

Under **Code** we'll upload `helloWorld.zip`. 

Lastly under **Runtime settings** rename the handler to be `helloWorld.helloHandler` and make sure **Runtime** is `Python 3.9`.

#### Test
In the **Code source** window, select `helloWorld.py` and click **Test**. Give the test event a name, the rest doesn't matter as this function won't use any parameters, and **Save**.

Click **Test** again to see results.

```
Test Event Name
test

Response
"Hello World"

Function Logs
START RequestId: e50d6889-d036-4ea3-98b2-c8d37919a5c8 Version: $LATEST
END RequestId: e50d6889-d036-4ea3-98b2-c8d37919a5c8
REPORT RequestId: e50d6889-d036-4ea3-98b2-c8d37919a5c8	Duration: 1.41 ms	Billed Duration: 2 ms	Memory Size: 128 MB	Max Memory Used: 36 MB	Init Duration: 99.36 ms

Request ID
e50d6889-d036-4ea3-98b2-c8d37919a5c8

```

<!-- Author / Footer -->
---

References:

 - <a href="https://docs.aws.amazon.com/lambda/latest/dg/welcome.html">What is AWS Lambda?</a>

---
<div  style="text-align: right; font-size:small; color:grey">LChen - March 21, 2023</div>
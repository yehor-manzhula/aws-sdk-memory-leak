# How to run a project

## Prepare everything
1. Install project dependencies `npm install`
2. Make sure you have installed [docker](https://docs.docker.com/desktop/install/linux-install/) and [docker-compose](https://docs.docker.com/compose/install/)

# Run scripts
To run script with force GC invocation on each request `./run.sh ./src/aws-sdk-gc.js` 
To run script without forced GC on each request `./run.sh ./src/aws-sdk.js`
To run httpRequest function that performing requests to localstack internal API with force GC invocation on each request `./run.sh ./src/http-request-gc.js` 
To run httpRequest function that performing requests to localstack internal API without force GC invocation on each request `./run.sh ./src/http-request.js` 

### Generate heapdump
To generate heapdump execute command `kill -USR2 ${APPLICATION_PID}` in terminal
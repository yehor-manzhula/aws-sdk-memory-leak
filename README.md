# How to run a project

## Prepare everything
1. Install project dependencies `npm install`
2. Run `./run-gc.sh` to run script with force GC invocation on each request
3. Run `./run-no-gc.sh` to run script without force GC invocation on each request

### Generate heapdump
To generate heapdump execute command `kill -USR2 ${APPLICATION_PID}` in terminal
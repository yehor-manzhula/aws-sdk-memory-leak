const http = require('http');

function httpRequest(options) {
  return new Promise((resolve, reject) => {
    const req = http.request(options, (res) => {
      let data = '';

      res.on('data', (chunk) => {
        data += chunk;
      });

      res.on('end', () => {
        resolve({
          statusCode: res.statusCode,
          headers: res.headers,
          body: data
        });
      });
    });

    req.on('error', (e) => {
      reject(e);
    });

    req.end();
  });
}

(function main() {
    let pollingTimeoutId = null;

    const poll = () => {
        httpRequest({
            hostname: 'localhost',
            port: 4566,
            path: '/_aws/sqs/messages/',
            method: 'GET'
        })
            .then(() => {})
            .catch((error) => {
                console.log(`Error ${error.message}`);
            })
            .finally(() => {
                if (pollingTimeoutId) {
                    clearTimeout(pollingTimeoutId);
                }

                pollingTimeoutId = setTimeout(() => poll(), 0);
            });
    };

    poll();

    console.log('Vanilla http request started');
}());

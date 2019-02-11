const http = require('https');

module.exports = {
    near: (lat, lng) => 
        new Promise((resolve, reject) => {
            const options = {
                method: 'POST',
                hostname: 'app.mobike.com',
                path: `/api/nearby/v4/nearbyBikeInfo?latitude=${lat}&longitude=${lng}`,
                headers: {
                    'platform': 1,
                    'User-Agent': 'Mozilla/5.0 (Android 7.1.2; Pixel Build/NHG47Q) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.9 NTENTBrowser/3.7.0.496 (IWireless-US) Mobile Safari/537.36',
                    'Content-Type': 'application/x-www-form-urlencoded'
                }
            };

            let req = http.request(options, res => {            
                if (res.statusCode !== 200) {
                    reject(new Error(`Request Failed, Status Code: ${res.statusCode}`));
                }

                let jsonData = '';
                res.on('data', (chunk) => { jsonData += chunk; });
                res.on('end', () => resolve(JSON.parse(jsonData)));
            });

            req.end();
            req.on('error', err => reject(err));
        })
}
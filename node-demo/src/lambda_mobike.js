
const mobike = require('mobike')

exports.handler = async (event) => {
    try {
        let lat = parseFloat(event.queryStringParameters.lat);
        let lng = parseFloat(event.queryStringParameters.lng);

        const data = await mobike.near(lat, lng);

        const response = {
            statusCode: 200,
            body: JSON.stringify({ mobike: data.bike }),
        };
        return response;

    } catch (err) {
        console.log(`Unable to process event: ${JSON.stringify(event)}`, err)
        return { statusCode: 500 }
    }    
};

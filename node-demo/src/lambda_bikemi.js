
const bikemi = require('bikemi')

exports.handler = async (event) => {
    try {
        let lat = parseFloat(event.queryStringParameters.lat);
        let lng = parseFloat(event.queryStringParameters.lng);

        const data = await bikemi.near(lat, lng);

        const response = {
            statusCode: 200,
            body: JSON.stringify({ bikemi: data }),
        };
        return response;

    } catch (err) {
        console.log(`Unable to process event: ${JSON.stringify(event)}`, err)
        return { statusCode: 500 }
    }    
};


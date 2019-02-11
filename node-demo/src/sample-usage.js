
const bikeme = require('./bikemi')
const mobike = require('./mobike')

var mikamai = [45.4906, 9.21538]
var duomo = [45.460951, 9.188376]

function bykeMIStations(){
    bikeme.stations()
            .then(e => console.log(JSON.stringify(e)))
            .catch(e => console.log("Problem retrieving BikeMI info.\n", e));
}

async function bikeMINear() {
    const near = await bikeme.near(...mikamai);
    printJSON(near);
}

function mobikes(){
    mobike.near(...mikamai)
        .then(e => console.log(JSON.stringify(e.bike)))
        .catch(e => console.log("Problem retrieving BikeMI info.\n", e));
}

// bikeMINear();
mobikes();
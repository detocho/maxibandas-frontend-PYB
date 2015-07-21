exports.post = function (request, response){

    var out;

    out = {
        "id": 4,
        "pictures": [{
            "size": "origin",
            "url": "http://api.maxibanda.com.mx/pictures/uploads/2015/2/MB4-origin.jpeg",
            "secure_url": ""
        }, {
            "size": "200X160",
            "url": "http://localhost:8080/publica/thumb1.jpg",
            "secure_url": ""
        }, {
            "size": "800X600",
            "url": "http://api.maxibanda.com.mx/pictures/uploads/2015/2/MB4-800X600.jpeg",
            "secure_url": ""
        }, {
            "size": "100X75",
            "url": "http://localhost:8080/publica/thumb1.jpg",
            "secure_url": ""
        }, {
            "size": "60X60",
            "url": "http://api.maxibanda.com.mx/pictures/uploads/2015/2/MB4-60X60.jpeg",
            "secure_url": ""
        }]
    };

    response.set('Access-Control-Allow-Origin', '*');
    response.set('Access-Control-Allow-Headers', 'Access-Control-Allow-Origin, X-Requested-With, Content-Type, Accept');
    response.set('Access-Control-Allow-Methods', 'PUT, POST, GET, OPTIONS, HEAD');
    response.json(200, out);
}

exports.options = function (request, response) {
    response.set('Access-Control-Allow-Headers', 'Access-Control-Allow-Origin, X-Requested-With, Content-Type, Accept');
    response.set('Access-Control-Allow-Methods', 'PUT, POST, GET, OPTIONS, HEAD');
    response.set('Access-Control-Allow-Origin', '*');
    response.send(200);
}

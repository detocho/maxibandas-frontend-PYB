exports.post = function (request, response){

    var userId = Math.floor((Math.random() * 10) + 1);
    var json

    json = {
        "access_token": "MB_9B73099E85B7F3362F7C45F89A78B739_5",
        "token_expiration_date": "11-08-2014",
        "user_id": userId,
        "user_type": "admin"
    }

    response.json(201,json)
}

exports.options = function (request, response) {
    response.set('Access-Control-Allow-Headers', 'Access-Control-Allow-Origin, X-Requested-With, Content-Type, Accept');
    response.set('Access-Control-Allow-Methods', 'PUT, POST, GET, OPTIONS, HEAD');
    response.set('Access-Control-Allow-Origin', '*');
    response.send(201);
}
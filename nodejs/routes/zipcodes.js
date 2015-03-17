exports.get = function (request, response){

    var zipcodeId = request.params.zipcodeId
    var json

    if (zipcodeId == "00000"){
        json ={
            "message": "The zipcode not found",
            "status": 404,
            "error": "not_found"
        };

        response.set('Access-Control-Allow-Origin', '*');
        response.set('Access-Control-Allow-Headers', 'Access-Control-Allow-Origin, X-Requested-With, Content-Type, Accept');
        response.set('Access-Control-Allow-Methods', 'PUT, POST, GET, OPTIONS, HEAD');
        response.json(404,json)

    }else {

        json = {
            "zipcode": zipcodeId,
            "parent_location": [
                {
                    "location_id": "CTY416",
                    "name": "Tultitlán",
                    "level": "city"
                },
                {
                    "location_id": "EST10",
                    "name": "Estado de México",
                    "level": "state",
                    "adjacent_states":["EST22","EST16","EST12","EST17","EST15","EST21","EST29","EST13" ]
                },
                {
                    "location_id": "MX",
                    "name": "México",
                    "level": "country"
                }
            ],
            "neighborhoods": [
                {
                    "locationId": "NGD59165",
                    "name": "Belém"
                },
                {
                    "locationId": "NGD59159",
                    "name": "Los Reyes"
                },
                {
                    "locationId": "NGD59160",
                    "name": "Tultitlán de Mariano Escobedo Centro"
                },
                {
                    "locationId": "NGD59161",
                    "name": "San Juan"
                },
                {
                    "locationId": "NGD59162",
                    "name": "La Concepción"
                },
                {
                    "locationId": "NGD59163",
                    "name": "Nativitas"
                },
                {
                    "locationId": "NGD59164",
                    "name": "Santiaguito"
                },
                {
                    "locationId": "NGD59166",
                    "name": "Residencial los Reyes"
                },
                {
                    "locationId": "NGD59167",
                    "name": "San Bartolo"
                }
            ]
        }
        response.set('Access-Control-Allow-Origin', '*');
        response.set('Access-Control-Allow-Headers', 'Access-Control-Allow-Origin, X-Requested-With, Content-Type, Accept');
        response.set('Access-Control-Allow-Methods', 'PUT, POST, GET, OPTIONS, HEAD');
        response.json(200, json);

    }




}

exports.options = function (request, response) {
    response.set('Access-Control-Allow-Headers', 'Access-Control-Allow-Origin, X-Requested-With, Content-Type, Accept');
    response.set('Access-Control-Allow-Methods', 'PUT, POST, GET, OPTIONS, HEAD');
    response.set('Access-Control-Allow-Origin', '*');
    response.send(200);
}
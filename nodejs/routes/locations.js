exports.get = function (request, response){

    var locationId = request.params.locationId
    var json;

    response.set('Access-Control-Allow-Origin', '*');
    response.set('Access-Control-Allow-Headers', 'Access-Control-Allow-Origin, X-Requested-With, Content-Type, Accept');
    response.set('Access-Control-Allow-Methods', 'PUT, POST, GET, OPTIONS, HEAD');

    if (locationId == "MX3MB00"){
        json ={
            "message": "The categoryId not found",
            "status": 404,
            "error": "not_found"
        };

        response.json(404,json)

    }else if (locationId == "MX"){

        json = {
            "location_id": "MX",
            "name": "México",
            "level": "country",
            "parent_location": [],
            "children_locations": [{
                "locationId": "EST1",
                "name": "Aguascalientes",
                "level": "state"
            }, {
                "locationId": "EST2",
                "name": "Baja California",
                "level": "state"
            }, {
                "locationId": "EST3",
                "name": "Baja California Sur",
                "level": "state"
            }, {
                "locationId": "EST4",
                "name": "Campeche",
                "level": "state"
            }, {
                "locationId": "EST5",
                "name": "Chiapas",
                "level": "state"
            }, {
                "locationId": "EST6",
                "name": "Chihuahua",
                "level": "state"
            }, {
                "locationId": "EST7",
                "name": "Coahuila de Zaragoza",
                "level": "state"
            }, {
                "locationId": "EST8",
                "name": "Colima",
                "level": "state"
            }, {
                "locationId": "EST15",
                "name": "Distrito Federal",
                "level": "state"
            }, {
                "locationId": "EST9",
                "name": "Durango",
                "level": "state"
            }, {
                "locationId": "EST10",
                "name": "Estado de México",
                "level": "state"
            }, {
                "locationId": "EST11",
                "name": "Guanajuato",
                "level": "state"
            }, {
                "locationId": "EST12",
                "name": "Guerrero",
                "level": "state"
            }, {
                "locationId": "EST13",
                "name": "Hidalgo",
                "level": "state"
            }, {
                "locationId": "EST14",
                "name": "Jalisco",
                "level": "state"
            }, {
                "locationId": "EST16",
                "name": "Michoacán de Ocampo",
                "level": "state"
            }, {
                "locationId": "EST17",
                "name": "Morelos",
                "level": "state"
            }, {
                "locationId": "EST18",
                "name": "Nayarit",
                "level": "state"
            }, {
                "locationId": "EST19",
                "name": "Nuevo León",
                "level": "state"
            }, {
                "locationId": "EST20",
                "name": "Oaxaca",
                "level": "state"
            }, {
                "locationId": "EST21",
                "name": "Puebla",
                "level": "state"
            }, {
                "locationId": "EST22",
                "name": "Querétaro",
                "level": "state"
            }, {
                "locationId": "EST23",
                "name": "Quintana Roo",
                "level": "state"
            }, {
                "locationId": "EST24",
                "name": "San Luis Potosí",
                "level": "state"
            }, {
                "locationId": "EST25",
                "name": "Sinaloa",
                "level": "state"
            }, {
                "locationId": "EST26",
                "name": "Sonora",
                "level": "state"
            }, {
                "locationId": "EST27",
                "name": "Tabasco",
                "level": "state"
            }, {
                "locationId": "EST28",
                "name": "Tamaulipas",
                "level": "state"
            }, {
                "locationId": "EST29",
                "name": "Tlaxcala",
                "level": "state"
            }, {
                "locationId": "EST30",
                "name": "Veracruz de Ignacio de la Llave",
                "level": "state"
            }, {
                "locationId": "EST31",
                "name": "Yucatán",
                "level": "state"
            }, {
                "locationId": "EST32",
                "name": "Zacatecas",
                "level": "state"
            }]
        };

        response.json(200,json)
    }else {

        json = {
				"location_id": ""+locationId+"",
				"name": "Ampliación San Pedro Xalpa",
				"level": "neighborhood",
				"parent_location": [{
				    "location_id": "CTY767",
				    "name": "Azcapotzalco",
				    "level": "city"
				}, {
				    "location_id": "EST15",
				    "name": "Distrito Federal",
				    "level": "state"
				}, {
				    "location_id": "MX",
				    "name": "México",
				    "level": "country"
				}],
				"children_locations": []
			};

        response.json(200,json)
    }


}

exports.options = function (request, response) {
    response.set('Access-Control-Allow-Headers', 'Access-Control-Allow-Origin, X-Requested-With, Content-Type, Accept');
    response.set('Access-Control-Allow-Methods', 'PUT, POST, GET, OPTIONS, HEAD');
    response.set('Access-Control-Allow-Origin', '*');
    response.send(200);
}
exports.get = function (request, response){
	
	var userId = request.params.userId
	var json
	
    json = {
        "id": userId,
        "name": "",
        "location_id": "15",
        "registration_date": "Nov 9, 2014 1:45:11 PM",
        "date_last_update": "Nov 9, 2014 1:45:11 PM",
        "origin": "MB",
        "status": "active",
        "user_type": "normal"
    }
	
	response.json(200,json)
}

exports.post = function (request, response){

    var userId = Math.floor((Math.random() * 10) + 1);
    var json

    json = {
        "id": userId,
        "name": "",
        "location_id": "15",
        "registration_date": "Nov 9, 2014 1:45:11 PM",
        "date_last_update": "Nov 9, 2014 1:45:11 PM",
        "origin": "MB",
        "status": "active",
        "user_type": "normal"
    }

    response.json(201,json)
}
exports.get = function (request, response){

    var categoryId = request.params.categoryId
    var json

    if (categoryId == "MX3"){
        json ={
            "message": "The categoryId not found",
            "status": 404,
            "error": "not_found"
        };

        response.set('Access-Control-Allow-Origin', '*');
        response.set('Access-Control-Allow-Headers', 'Access-Control-Allow-Origin, X-Requested-With, Content-Type, Accept');
        response.set('Access-Control-Allow-Methods', 'PUT, POST, GET, OPTIONS, HEAD');

        response.json(404,json)

    }else if (categoryId == "MX2"){
        json

            ={
            "category_id": "MX2",
            "name": "Eventos sociales",
            "parent_category": [{
                "category_id": "MX",
                "name": "México",
                "status": "active"
            }],
            "children_categories": [{
                "categoryId": "MX2MB8",
                "name": "Aniversario",
                "status": "active"
            }, {
                "categoryId": "MX2MB13",
                "name": "Banquetes",
                "status": "active"
            }, {
                "categoryId": "MX2MB19",
                "name": "Bautizo",
                "status": "active"
            }, {
                "categoryId": "MX2MB21",
                "name": "Bienvenida",
                "status": "active"
            }, {
                "categoryId": "MX2MB27",
                "name": "Boda",
                "status": "active"
            }, {
                "categoryId": "MX2MB1",
                "name": "Celebraciones",
                "status": "active"
            }, {
                "categoryId": "MX2MB9",
                "name": "Cena",
                "status": "active"
            }, {
                "categoryId": "MX2MB5",
                "name": "Comuniones",
                "status": "active"
            }, {
                "categoryId": "MX2MB25",
                "name": "Conciertos",
                "status": "active"
            }, {
                "categoryId": "MX2MB15",
                "name": "Congreso",
                "status": "active"
            }, {
                "categoryId": "MX2MB16",
                "name": "Convención",
                "status": "active"
            }, {
                "categoryId": "MX2MB14",
                "name": "Cruceros",
                "status": "active"
            }, {
                "categoryId": "MX2MB3",
                "name": "Cumpleaños",
                "status": "active"
            }, {
                "categoryId": "MX2MB10",
                "name": "Cóctel",
                "status": "active"
            }, {
                "categoryId": "MX2MB12",
                "name": "Despedidas de soltera",
                "status": "active"
            }, {
                "categoryId": "MX2MB20",
                "name": "Exposiciones",
                "status": "active"
            }, {
                "categoryId": "MX2MB6",
                "name": "Ferias",
                "status": "active"
            }, {
                "categoryId": "MX2MB26",
                "name": "Festivales",
                "status": "active"
            }, {
                "categoryId": "MX2MB2",
                "name": "Fiesta mayor",
                "status": "active"
            }, {
                "categoryId": "MX2MB24",
                "name": "Fiestas",
                "status": "active"
            }, {
                "categoryId": "MX2MB4",
                "name": "Fiestas infantiles",
                "status": "active"
            }, {
                "categoryId": "MX2MB17",
                "name": "Fiestas nochevieja",
                "status": "active"
            }, {
                "categoryId": "MX2MB23",
                "name": "Funeral",
                "status": "active"
            }, {
                "categoryId": "MX2MB18",
                "name": "Inauguracion",
                "status": "active"
            }, {
                "categoryId": "MX2MB28",
                "name": "Otros Eventos",
                "status": "active"
            }, {
                "categoryId": "MX2MB7",
                "name": "Pasacalles",
                "status": "active"
            }, {
                "categoryId": "MX2MB11",
                "name": "Presentaciones",
                "status": "active"
            }, {
                "categoryId": "MX2MB22",
                "name": "Recepcion",
                "status": "active"
            }, {
                "categoryId": "MX2MB29",
                "name": "XV y XVII años",
                "status": "active"
            }]
        };

        response.set('Access-Control-Allow-Origin', '*');
        response.set('Access-Control-Allow-Headers', 'Access-Control-Allow-Origin, X-Requested-With, Content-Type, Accept');
        response.set('Access-Control-Allow-Methods', 'PUT, POST, GET, OPTIONS, HEAD');
        response.json(200,json)

    }else {

        json = {
                "category_id": ""+categoryId+"",
                "name": "Banda",
                "parent_category": [{
                "category_id": "MX1",
                "name": "Géneros musicales",
                "status": "active"
                }, {
                    "category_id": "MX",
                    "name": "México",
                    "status": "active"
                }],
                "children_categories": [
                    {
                        "category_id": "MX10",
                        "name": "Banda",
                        "status": "active"
                    },
                    {
                        "category_id": "MX12",
                        "name": "Mariachi",
                        "status": "active"
                    }
                ]
        };

        response.set('Access-Control-Allow-Origin', '*');
        response.set('Access-Control-Allow-Headers', 'Access-Control-Allow-Origin, X-Requested-With, Content-Type, Accept');
        response.set('Access-Control-Allow-Methods', 'PUT, POST, GET, OPTIONS, HEAD');

        response.json(200,json)
    }


}

exports.options = function (request, response) {
    response.set('Access-Control-Allow-Headers', 'Access-Control-Allow-Origin, X-Requested-With, Content-Type, Accept');
    response.set('Access-Control-Allow-Methods', 'PUT, POST, GET, OPTIONS, HEAD');
    response.set('Access-Control-Allow-Origin', '*');
    response.send(200);
}
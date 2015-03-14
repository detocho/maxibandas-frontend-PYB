'use strict'

function PYBController ($scope, $http, $upload, Locations, Bands, Categories,States){

	$scope.zipcodeData      = '';
    $scope.zipcodeValue     = '';
    $scope.zipcodeError     = '';
    $scope.cols             = '';
    $scope.isValidZipcode   = false;

    $scope.isValidVideo     = false;
    $scope.urlVideoEmbed    = '';
    $scope.urlPic           = [];
    $scope.picturesJson     = [];

    $scope.socialEventsData = '';
    $scope.stateEventsData  = '';

    //errors control
    $scope.errorName        = false;
    $scope.errorCategory    = false;
    $scope.errorPrice       = false;
    $scope.errorLocationId  = false;
    $scope.errorEmail       = false;
    $scope.errorPhones      = false;
    $scope.errorVideo       = false;
    $scope.errorZipcode     = false;

    $scope.stateEvents = function(){
        var params = {};
        States.stateEvents(params, function (data){


            $scope.stateEventsData = data.children_locations;


        }, function (error) {

            $scope.stateEventsData = '';
        });
    };

    $scope.stateEvents();

    $scope.socialEvents = function(){
        var params = {};
        Categories.socialEvents(params, function (data){


            $scope.socialEventsData = data.children_categories;



        }, function (error) {

            $scope.socialEventsData = '';
        });
    };

    $scope.socialEvents();

    $scope.searchZipcodes = function() {


        var params = {
            action:$scope.zipcodeValue
        };

        Locations.zipcode(params, function (data) {

            $scope.zipcodeError     = '';
            $scope.zipcodeData      = data;
            $scope.cols             = data.neighborhoods;
            $scope.isValidZipcode   = true;

        }, function (error) {

            $scope.isValidZipcode   = false;
            $scope.zipcodeData      = '';
            $scope.zipcodeError     = "Codigo postal = "+$scope.zipcodeValue+" no encontrado";
        });
    };

    $scope.embedVideo = function (){


        $scope.isValidVideo = false;
        var urlVideo = $scope.urlVideo;
        if(urlVideo.indexOf("www.youtube.com") > 0) {
            var elem = urlVideo.split('v=');
            if (elem[1]) {

                var videoId     = elem[1];
                var urlEmbed    = "http://www.youtube.com/embed/video_id?rel=0&showinfo=0&controls=1";

                $scope.urlVideoEmbed = urlEmbed.replace("video_id", videoId);
                $scope.isValidVideo = true;
            }
        }
    };

    // ****************

    $scope.onFileSelect = function($files, indexPicture) {
        //$files: an array of files selected, each file has name, size, and type.
        for (var i = 0; i < $files.length; i++) {
            var file = $files[i];
            console.log("EL file a cargar es"+file);
            $scope.upload = $upload.upload({
                url: 'http://localhost:8888/pictures/', //upload.php script, node.js route, or servlet url
                method: 'POST',
                //headers: {'header-key': 'header-value'},
                //withCredentials: true,
                data: {myObj: $scope.myModelObj},
                file: file, // or list of files ($files) for html5 only
                //fileName: 'doc.jpg' or ['1.jpg', '2.jpg', ...] // to modify the name of the file(s)
                // customize file formData name ('Content-Desposition'), server side file variable name.
                //fileFormDataName: myFile, //or a list of names for multiple files (html5). Default is 'file'
                // customize how data is added to formData. See #40#issuecomment-28612000 for sample code
                //formDataAppender: function(formData, key, val){}
            }).progress(function (evt) {
                console.log('percent: ' + parseInt(100.0 * evt.loaded / evt.total));
            }).success(function (data, status, headers, config) {
                // file is uploaded successfully
                console.log(data);
                $scope.urlPic[indexPicture] = data.pictures[1].url;
                // aqui procesamos el array de pictures, mas bien el josn
                //TODO debemos revisar como hacemos para cuando quieren modificar una fotografia antes de subirla
                $scope.picturesJson.push({
                    picture_id :data.id,
                    url : data.pictures[1].url,
                    size : '200x160',
                    secure_url : ''});

                console.log ('el array ahora tiene = '+ JSON.stringify($scope.picturesJson));
            });
            //.error(...)
            //.then(success, error, progress);
            // access or attach event listeners to the underlying XMLHttpRequest.
            //.xhr(function(xhr){xhr.upload.addEventListener(...)})
        }
    }


    // *******************

    $scope.createBand = function (){

        console.log('vamos a crear la banda aqui comienzan las validaciones');

        console.log ('imprimiendo valores capturados');

        console.log('categoryID = '+$scope.categoryId);
        console.log('nombre = '+$scope.name);
        console.log('price = '+$scope.price);
        console.log('payForm = '+$scope.payForm);
        console.log('locationId = '+$scope.locationId);
        console.log('email = '+$scope.email);
        console.log('phones = '+$scope.phones);
        console.log('video = '+$scope.urlVideo);
        console.log('description = '+$scope.description);
        console.log('pictures = '+ JSON.stringify($scope.picturesJson));

        $scope.errorName        = false;
        $scope.errorCategory    = false;
        $scope.errorPrice       = false;
        $scope.errorLocationId  = false;
        $scope.errorEmail       = false;
        $scope.errorPhones      = false;
        $scope.errorZipcode     = false;

        var publishedBand = true;

        if(!$scope.categoryId){
            $scope.errorCategory = true;
            publishedBand = false;
        }

        if(!$scope.name){
            $scope.errorName = true;
            publishedBand = false;

        }

        if(!$scope.zipcodeValue){
            $scope.errorZipcode = true;
            publishedBand = false;
        }

        if(!$scope.price){
            $scope.errorPrice = true;
            publishedBand = false;
        }

        if(!$scope.locationId){
            $scope.errorLocationId = true;
            publishedBand = false;
        }

        if(!$scope.email){
            $scope.errorEmail = true;
            publishedBand = false;
        }

        if(!$scope.phones){
            $scope.errorPhones = true;
            publishedBand = false;
        }



        if (publishedBand){
            alert ('Listo vamos a publicar la banda');
        }

        return false;

        // esta es la funcion que hace el post de la banda *********
        /*
        var params = {

        };

        Bands.newband(params, function (data) {

            console.log('la data del request de nueva banda es'+data[0]);
            // aqui hacemos la redireccion
            window.location="/published/endPublished/?bandId="+data[0];

        }, function (error) {

            console.log ('Error en la llamada a la creacion de la banda'+error);
        });
        */
        // ***********************************
        //TODO
        /*
         1.- generamos las validaciones para cada topico obligatorio
         2.- generamos el model de datos para el item
         3.- generamos un servicio con ajax para enviarle los datos ya preprocesados
         4.- en el servicio
            4.1.- Buscamos el user por el email
            4.2.- obtenemos el id de usuario (si no esta lo creamos y enviamos un email de registro para que actualice su password)
            4.3.- posteamos el item
            4.4.- mandamos un email de activacion de item
            4.5.- lo redirigimos logueado a su cuenta para administrar su anuncio y desde ahi le decimo que su anuncio esta listo para verlo
            dale click aqui y lo mandamos a la vip del anuncio.
            LISTO
         */
    }



}
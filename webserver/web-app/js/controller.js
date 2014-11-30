'use strict'

function PYBController ($scope, Locations){

	$scope.zipcodeData      = '';
    $scope.zipcodeValue     = '';
    $scope.zipcodeError     = '';
    $scope.cols             = '';
    $scope.isValidZipcode   = false;

    $scope.isValidVideo = false;
    $scope.urlVideoEmbed = '';






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
    }

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
    }

}
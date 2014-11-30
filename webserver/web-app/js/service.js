'use strict'


var module = angular.module('PYBServices', ['ngResource']);


module.factory('Locations',function ($resource){
    var url = apiBaseUrl + "/locations/zipcodes/:action";
    return $resource(url, {}, {
        zipcode:{method:"GET"}
    });
});

/*

 module.factory('Locations',function ($resource){
 var url = apiBaseUrl + "/locations/zipcodes/:action";
 return $resource(url, {}, {
 zipcode:{method:"GET", params:{action:"54900"}}
 });
 });
 */
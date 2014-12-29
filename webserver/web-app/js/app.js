'use strict'

var module = angular.module('PYB',['PYBServices', 'my_ui', 'angularFileUpload']);

angular.module("my_ui", [])
    .directive('uiBlur', function() {
        return function( scope, elem, attrs ) {
            elem.bind('blur', function() {
                scope.$apply(attrs.uiBlur);
            });
        };
    });
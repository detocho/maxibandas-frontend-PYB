<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"><!--<![endif]-->
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title><g:layoutTitle default="Grails"/></title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="HandheldFriendly" content="True">
    <meta name="apple-mobile-web-app-status-bar-style" content="brown">
    <link rel="shortcut icon" href="${resource(dir: 'images', file: 'favicon.ico')}" type="image/x-icon">

    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
    <!-- Optional theme -->
    <link rel="stylesheet" href="http://getbootstrap.com/examples/offcanvas/offcanvas.css">

    <link rel="stylesheet" href="${resource(dir: 'css', file: 'mb.css')}" type="text/css">


    <g:layoutHead/>
    <r:layoutResources />
</head>

<body ng-app="PYB" >

<nav class="navbar navbar-fixed-top navbar-inverse">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="/"><img class="logo" src="${resource(dir: 'images', file: 'mb.png')}"></a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
            <ul class="nav navbar-nav navbar-right">
                <li><a href="#"><span class="glyphicon glyphicon-user" aria-hidden="true"></span>
                    <g:if test="${session['user']}">
                        ${session['user'].name}
                    </g:if>
                </a> </li>
                <li><a href="/published/PYB/endSession">Salir</a></li>
            </ul>
        </div><!-- /.nav-collapse -->
    </div><!-- /.container -->
</nav><!-- /.navbar -->


<g:layoutBody/>


<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="http://getbootstrap.com/dist/js/bootstrap.min.js"></script>
<script src="http://getbootstrap.com/assets/js/ie10-viewport-bug-workaround.js"></script>

<script src="${resource(dir: 'js', file: 'angular.min.js')}"></script>
<script src="${resource(dir: 'js', file: 'angular-resource.min.js')}"></script>
<script src="${resource(dir: 'js', file: 'underscore-min.js')}"></script>
<script src="${resource(dir: 'js', file: 'angular-file-upload.js')}"></script>
<script src="${resource(dir: 'js', file: 'angular-file-upload-shim.js')}"></script>
<script src="${resource(dir: 'js', file: 'app.js')}"></script>
<script src="${resource(dir: 'js', file: 'controller.js')}"></script>
<script src="${resource(dir: 'js', file: 'service.js')}"></script>

<script src="http://www.parsecdn.com/js/parse-1.3.5.min.js"></script>
<script >
    //var apiBaseUrl = "http://api.maxibanda.com.mx";
    //var apiBaseUrlLocations     = 'http://ec2-54-69-9-226.us-west-2.compute.amazonaws.com';
    //var apiBaseUrlCategories    = 'http://ec2-54-69-9-226.us-west-2.compute.amazonaws.com';
    //var apiBaseUrlImages        = 'http://images.maxibanda.mx/pictures/';
    //var apiBaseUrlLocations     = "http://" + document.domain + "\\:8888";
    //var apiBaseUrlCategories    = "http://" + document.domain + "\\:8888";
    //var apiBaseUrlImages        = "http://" + document.domain + ":8080/pictures/";
    /*
     var apiBaseUrlLocations     = "http://api.maxibanda.com.mx";
     var apiBaseUrlCategories    = "http://api.maxibanda.com.mx";
     var apiBaseUrlImages        = "http://api.maxibanda.com.mx/pictures/";
     */
    var apiBaseUrl = "http://" + document.domain + "\\:8888";
    var apiBaseUrlLocations     = apiBaseUrl;
    var apiBaseUrlCategories    = apiBaseUrl;
    var apiBaseUrlImages        = "http://" + document.domain + ":8888/pictures/";
    // Parse.initialize("zbeIUDTUzN5Tn7h9IuXs5950f7UDZ1XcF1Vqsm04", "KsRuEPQboXzf4NBpiMVxSFRcgRTCW8mslxo82YOI");
</script>
<r:layoutResources />


</body>
</html>

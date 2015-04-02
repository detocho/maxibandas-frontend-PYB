<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"><!--<![endif]-->
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title><g:layoutTitle default="Grails"/></title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="initial-scale=1.0,user-scalable=no,maximum-scale=1" media="(device-height: 600px)">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="HandheldFriendly" content="True">
    <meta name="apple-mobile-web-app-status-bar-style" content="brown">
    <link rel="shortcut icon" href="${resource(dir: 'images', file: 'favicon.ico')}" type="image/x-icon">

    <!-- Latest compiled and minified CSS -->

    <link rel="stylesheet" href="${resource(dir:'css', file:'bootstrap.min.css')}" type="text/css">

    <!-- Optional theme -->

    <link rel="stylesheet" href="${resource(dir:'css', file:'bootstrap-them.min.css')}" type="text/css">

    <link rel="stylesheet" href="${resource(dir: 'css', file: 'mb.css')}" type="text/css">
    <!-- <link rel="stylesheet" href="${resource(dir: 'css', file: 'main.css')}" type="text/css"> -->


    <g:layoutHead/>
    <r:layoutResources />
</head>

<body ng-app="PYB" >


<header class="slide">
    <nav class="navbar navbar-default">

        <div class="navbar-header">
            <a class="navbar-brand" href="/" > <img alt="Brand" src="${resource(dir:'images', file:'mb.png')}"> </a>
        </div>
        <p class="navbar-text navbar-right">
            <g:if test="${session['user']}">
                ${session['user'].name}
            </g:if>
            <a href="/published/PYB/endSession" class="navbar-link">Salir</a>
        </p>
    </nav>
</header>

<div class="container">
    <g:layoutBody/>
</div>

<r:layoutResources />


</body>
</html>

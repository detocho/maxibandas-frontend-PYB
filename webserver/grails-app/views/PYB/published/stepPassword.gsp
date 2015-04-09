<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>maxibanda.com.mx</title>
</head>
<body>

<div ng-controller="PasswordController" class="panel panel-default">

    <div class="panel-heading">
        <h3 class="panel-title">Publica tu banda [escribe tu password]</h3>
    </div>
    <div class="panel-body">

        <h2>Listo!! </h2>
        <h3>Ahora solo necesitamos que coloques tu password <br> si no tienes, crea uno </h3>

        <% if(errorSession != ''){ %>

        <div class="alert alert-danger" role="alert">
            ${errorSession}
        </div>

       <% }
            %>

        <g:form name="published"  ng-submit="createAccount()">
            <input ng-model="password" pattern=".{6,}" class="caja_registro big" type="password" name="password" placeholder="Escribe tu password" required/>
            <g:submitButton name="submit" class="btn btn-primary"  value="Siguiente"></g:submitButton>
            <g:submitButton name="cancel" class="btn btn-default"  value="Cancelar"></g:submitButton>
        </g:form>

    </div>
</div>


<script src="${resource(dir: 'js', file: 'jquery.min.js')}"></script>
<script src="${resource(dir: 'js', file: 'jquery.form.min.js')}"></script>
<script src="${resource(dir: 'js', file: 'angular.min.js')}"></script>
<script src="${resource(dir: 'js', file: 'angular-resource.min.js')}"></script>
<script src="${resource(dir: 'js', file: 'underscore-min.js')}"></script>
<script src="${resource(dir: 'js', file: 'angular-file-upload.js')}"></script>
<script src="${resource(dir: 'js', file: 'angular-file-upload-shim.js')}"></script>
<script src="${resource(dir: 'js', file: 'app.js')}"></script>
<script src="${resource(dir: 'js', file: 'controller.js')}"></script>
<script src="${resource(dir: 'js', file: 'service.js')}"></script>
<script >
    var apiBaseUrl = "http://api.maxibanda.com.mx";
    //var apiBaseUrl = "http://" + document.domain + "\\:8888"
</script>


</body>
</html>
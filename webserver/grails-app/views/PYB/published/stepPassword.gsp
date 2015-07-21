<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>maxibanda.com.mx</title>
</head>
<body>

<div class="container" ng-controller="PasswordController" data-ng-init="init()">

    <div class="page-header">
        <h2>Listo!! </h2>
        <h3>Ahora solo necesitamos que coloques tu password, si no tienes, crea uno </h3>
    </div>
    <div class="panel panel-default">
        <div class="panel-body">
            <% if(errorSession != ''){ %>
            <div class="row">
                <div class="col-lg-4">
                    <div class="alert alert-danger" role="alert">
                        ${errorSession}
                    </div>
                </div>
            </div>
            <% }
            %>
            <g:form name="published"  ng-submit="createAccount()">
            <div class="row">
                <div class="col-lg-4">
                    <div class="form-group input-group-lg">
                        <div class="form-group input-group-lg">
                            <input ng-model="password" pattern=".{6,}" class="form-control" type="password" name="password" placeholder="Escribe tu password" required/>
                        </div>
                    </div>
                </div> <!-- col-lg-x-->
            </div> <!-- row -->

            <div class="row">
                <div class="col-lg-4">
                    <div class="form-group input-group-lg">
                        <div class="form-group input-group-lg">
                            <g:submitButton name="cancel" class="btn btn-default btn-xs" value="Cancelar"></g:submitButton>
                            <g:submitButton name="submit" class="btn btn-warning btn-lg" value="Siguiente"></g:submitButton>
                        </div>
                    </div>
                </div> <!-- col-lg-x-->
            </div> <!-- row -->

            </g:form>
        </div>


    </div>

    <footer>
        <p class="pull-right">&copy; 2015 maxibandas, Inc. &middot; </p>
    </footer>
</div><!-- div container -->


</body>
</html>
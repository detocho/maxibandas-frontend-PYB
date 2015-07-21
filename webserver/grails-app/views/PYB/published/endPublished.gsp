<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>maxibanda.com.mx</title>
</head>
<body>

<div class="container">

    <div class="alert alert-success" role="alert">
        <h1><span class="glyphicon glyphicon-ok" aria-hidden="true"></span> Felicidades ya publicaste!!!</h1>
    </div>

    <div class="panel panel-default">
        <div class="panel-body">

            <div class="row">
                <div class="col-lg-4">
                        <p>Número de anuncio:${bandId}  <a href="#">Ver anuncio</a></p>
                </div>
            </div>

            <div class="row">
                <div class="col-lg-4">
                        <g:submitButton name="submit" class="btn btn-warning btn-lg"   value="Publicar otro"></g:submitButton>
                        <g:submitButton name="submit" class="btn btn-warning btn-lg"   value="Mi cuenta"></g:submitButton>

                </div>
            </div>

        </div>



    </div>

    <footer>
        <p class="pull-right">&copy; 2015 maxibandas, Inc. &middot; </p>
    </footer>
</div><!-- div container -->

</body>
</html>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>maxibanda.com.mx</title>
</head>
<body >

<main>


    <div id="dataItemMain">
        <!-- <form name="dataItem" action="" method="post"> -->
        <% if (bandId) {%>
        <h1>Felicidades tu banda ah sido publicada</h1>
        <div>imagen de exito</div>
        <div><a href="">ver banda .</a></div>
        <%} else {%>
        <h1>Lo sentimos no pudimos publicar por :</h1>
        <div>imagen de rechazo </div>
        <div><a href="">Intentar nuevamente</a></div>
        <% } %>
    </div>
</main>

</body>
</html>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>maxibanda.com.mx</title>
</head>
<body >

<main ng-controller="PYBController">

    <h2><span class="H2titulo">»</span>Escribe las caracteristicas de tu banda</h2>
    <div id="dataItemMain">
        <!-- <form name="dataItem" action="" method="post"> -->
        <div class="feature_item">
            <div class="data_etiqueta">¿Que musica tocas?</div>
            <div class="data_value">
                <select class="caja_seleccion big" name="genero">
                    <option value="0">Selecciona un género</option>
                    <% for(int index=0; index< groups.size(); index++){ %>
                    <option value=${groups[index].categoryId}>${groups[index].name}</option>
                    <% } %>
                </select>
            </div>
        </div>

        <div class="feature_item">
            <div class="data_etiqueta">¿Como te llamas?</div>
            <div class="data_value">
                <input  class="caja_registro big" size="50" maxlength="50" type="text" name="name_band" placeholder="Nombre de tu banda">
            </div>
        </div>

        <div class="feature_item">
            <div class="data_etiqueta">¿Cuanto cobras?</div>
            <div class="data_value">
                <input class="caja_registro big" type="text" size="10" maxlength="" name="price" placeholder="Precio $$$">
            </div>
            <div class="data_value">
                <input type="radio" name="PayForm" value="contado" checked /> Variable
                <input type="radio" name="PayForm" value="credit" checked /> Fijo x evento
            </div>
        </div>

        <div class="feature_item" >
            <div class="data_etiqueta">¿De donde eres?</div>
            <div class="data_value">
                <input  type="text" ui-Blur="searchZipcodes()" ng-model="zipcodeValue" class="caja_registro big" size="5" maxlength="5" name="zipcode" placeholder="Codigo Postal">

                <div> {{zipcodeError}} </div>
                <div ng-show="isValidZipcode">
                    <div>{{zipcodeData.zipcode}}</div>
                    <div>{{zipcodeData.parent_location[1].name}}</div>
                    <div>{{zipcodeData.parent_location[0].name}}</div>
                    <div>
                    <select class="caja_seleccion big" name="locationId">
                        <option value="0">Selecciona una colonia</option>
                        <option ng-repeat="col in cols" value="{{col.locationId}}">{{col.name}}</option>
                    </select>
                    </div>
                </div>

            </div>
        </div>

        <div class="feature_item">
            <div class="data_etiqueta">¿Como te contactamos?</div>
            <div class="data_value">
                <input name="email" type="text" id="id_email" class="caja_registro big" placeholder="Email" />
            </div>
        </div>

        <div class="feature_item">
            <div class="data_value">
                <input name="telefonos" type="text" id="id_telefonos" class="caja_registro big" placeholder="Telefonos" />
                <div class="reg_ejemplo"> Ej: (55)1234-5555, (55)5555-4444</div>
            </div>
        </div>

        <div class="feature_item">
            <div class="data_etiqueta">Muestranos un poco de tu talento</div>
            <div class="data_value">
                <input class="caja_registro big" size="50" maxlength="50" type="text" ui-Blur="embedVideo()" ng-model="urlVideo" name="url_video" placeholder="Link de youtube">
                <div ng-show="isValidVideo">
                    <iframe src="{{urlVideoEmbed}}" frameborder="0" allowfullscreen></iframe>
                </div>
            </div> no tienes?, nosotros lo hacemos preguntanos aqui..
        </div>

        <div class="feature_item">
            <div class="data_etiqueta">Fotos:</div>
            <div class="data_value">



                <input type="text" ng-model="myModelObj">
                <input class="custom-input-file" type="file" ng-file-select="onFileSelect($files)">
                <img ng-show="urlPic != null" ng-src="{{urlPic}}" class="thumb">


            </div>
        </div>

        <div class="feature_item">
            <div class="data_value">
                <div class="data_etiqueta">Describete mejor!!</div>
                <textarea name="Description" cols="20" rows="10"></textarea>
            </div>
        </div>

        <div class="feature_item">
            <div class="data_etiqueta"></div>
            <div class="data_value">
                <input class="btn-continue" id="btnContinuar" onclick="fin_publica();"  type="button" value="Comienza a recibir ofertas Publica ya!!!"/>
            </div>
        </div>

        <!--	</form> -->
    </div>
</main>
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
</script>
</body>
</html>
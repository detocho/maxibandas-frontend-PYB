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
    <form name="publishedForm" action="" method="post">
        <div class="feature_item">
            <div class="data_etiqueta">¿Que musica tocas?</div>
            <div class="data_value">
                <select ng-model="categoryId" class="caja_seleccion big" name="genero">
                    <option value="0">Selecciona un género</option>
                    <% for(int index=0; index< groups.size(); index++){ %>
                    <option value=${groups[index].categoryId}>${groups[index].name}</option>
                    <% } %>
                </select>
                <span class="error" ng-show="errorCategory">La categoria es requerido</span>
            </div>
        </div>

        <div class="feature_item">
            <div class="data_etiqueta">¿Como te llamas?</div>
            <div class="data_value">
                <input ng-model="name" class="caja_registro big" size="50" maxlength="50" type="text" name="name_band" placeholder="Nombre de tu banda">
                <span class="error" ng-show="errorName">El nombre es requerido</span>
            </div>
        </div>

        <div class="feature_item">
            <div class="data_etiqueta">¿Cuanto cobras?</div>
            <div class="data_value">
                <input ng-model="price" class="caja_registro big" type="text" size="10" maxlength="" name="price" placeholder="Precio $$$">
                <span class="error" ng-show="errorPrice">El precio es requerido</span>
            </div>
            <div class="data_value">
                <input type="radio" ng-model="payForm" name="PayForm" value="contado" checked /> Variable
                <input type="radio" ng-model="payForm" name="PayForm" value="credit" checked /> Fijo x evento
            </div>
        </div>

        <div class="feature_item" >
            <div class="data_etiqueta">¿De donde eres?</div>
            <div class="data_value">
                <input  type="text" ui-Blur="searchZipcodes()" ng-model="zipcodeValue" class="caja_registro big" size="5" maxlength="5" name="zipcode" placeholder="Codigo Postal">
                <span class="error" ng-show="errorZipcode">El zip es requerida</span>
                <div> {{zipcodeError}} </div>
                <div ng-show="isValidZipcode">
                    <div>{{zipcodeData.zipcode}}</div>
                    <div>{{zipcodeData.parent_location[1].name}}</div>
                    <div>{{zipcodeData.parent_location[0].name}}</div>
                    <div>
                    <select ng-model="locationId" class="caja_seleccion big" name="locationId">
                        <option value="0">Selecciona una colonia</option>
                        <option ng-repeat="col in cols" value="{{col.locationId}}">{{col.name}}</option>
                    </select>
                    <span class="error" ng-show="errorLocationId">La colonia es requerida</span>
                    </div>
                </div>

            </div>
        </div>

        <div class="feature_item">
            <div class="data_etiqueta">¿Como te contactamos?</div>
            <div class="data_value">
                <input ng-model="email" name="email" type="text" id="id_email" class="caja_registro big" placeholder="Email" />
                <span class="error" ng-show="errorEmail">El email es requerido</span>
            </div>
        </div>

        <div class="feature_item">
            <div class="data_value">
                <input ng-model="phones" name="telefonos" type="text" id="id_telefonos" class="caja_registro big" placeholder="Telefonos" />
                <div class="reg_ejemplo"> Ej: (55)1234-5555, (55)5555-4444</div>
                <span class="error" ng-show="errorPhones">El telefono es requerido</span>
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




                <input class="custom-input-file" type="file" ng-file-select="onFileSelect($files,0)">
                <img ng-show="urlPic[0] != null" ng-src="{{urlPic[0]}}" class="thumb">


                <input class="custom-input-file" type="file" ng-file-select="onFileSelect($files,1)">
                <img ng-show="urlPic[1] != null" ng-src="{{urlPic[1]}}" class="thumb">


                <input class="custom-input-file" type="file" ng-file-select="onFileSelect($files,2)">
                <img ng-show="urlPic[2] != null" ng-src="{{urlPic[2]}}" class="thumb">


                <input class="custom-input-file" type="file" ng-file-select="onFileSelect($files,3)">
                <img ng-show="urlPic[3] != null" ng-src="{{urlPic[3]}}" class="thumb">


            </div>
        </div>

        <div class="feature_item">
            <div class="data_value">
                <div class="data_etiqueta">Describete mejor!!</div>
                <textarea ng-model="description" name="Description" cols="20" rows="10"></textarea>
            </div>
        </div>

        <div class="feature_item">
            <div class="data_etiqueta"></div>
            <div class="data_value">
                <input class="btn-continue" id="btnContinuar" ng-click="createBand()"  type="button" value="Comienza a recibir ofertas Publica ya!!!"/>
            </div>
        </div>

    </form>
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
    //var apiBaseUrl = "http://api.maxibanda.com.mx";
    var apiBaseUrl = "http://" + document.domain + "\\:8888"
</script>
</body>
</html>
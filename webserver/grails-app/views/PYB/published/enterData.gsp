<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>maxibanda.com.mx</title>
</head>
<body>

<div ng-controller="PYBController">
    <g:form name="published"  ng-submit="createBand()">

        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title">[Datos de tu banda]</h3>
            </div>
            <div class="panel-body">
                <div class="form-group">
                    <label>¿Como se llama tu banda?</label>
                    <input ng-model="name" class="form-control caja_registro big" size="50" maxlength="50" type="text" name="name_band" placeholder="Nombre de tu banda" required>
                    <span class="error" ng-show="errorName">El nombre es requerido</span>
                </div>

                <div class="form-group">
                    <label>¿Que musica tocas?</label>
                    <div>
                        <select ng-model="categoryId" class="caja_seleccion big" name="genero" required >
                            <option value="">Selecciona un género</option>
                            <% for(int index=0; index< groups.size(); index++){ %>
                            <option value=${groups[index].categoryId}>${groups[index].name}</option>
                            <% } %>
                        </select>
                        <span class="error" ng-show="errorCategory">La categoria es requerido</span>
                    </div>
                </div>

                <div class="form-group">
                    <label>¿Cuanto cobras por evento?</label>
                    <input ng-model="price" class="form-control  caja_registro big" type="text" size="10" maxlength="" name="price"  required >
                    <span class="error" ng-show="errorPrice">El precio es requerido</span>
                    <div class="data_value">
                        <input  type="radio" ng-model="payForm" name="PayForm" value="contado" checked /> Variable
                        <input  type="radio" ng-model="payForm" name="PayForm" value="credit" checked /> Fijo x evento
                    </div>
                </div>

                <div class="form-group">
                    <label>¿En que eventos tocas?</label>
                    <ul class="gridFeatures">
                        <lablel class="checkbox"><li><input ng-model="all_events" type="checkbox" name="social_event" /> Todos</li></lablel>
                        <span ng-repeat="event in socialEventsData" >
                            <lablel class="checkbox"><li><input type="checkbox" name="social_event" value="{{event.categoryId}}" ng-checked="all_events"  /> {{event.name}}</li></lablel>
                        </span>
                    </ul>
                </div>

                <div class="form-group">
                    <label>¿Ubicaión de tu banda?</label>
                    <div>
                        <input  type="text" ui-Blur="searchZipcodes()" ng-model="zipcodeValue" class="caja_registro big" size="5" maxlength="5" name="zipcode" placeholder="Codigo Postal" required>
                        <span class="error" ng-show="errorZipcode">El zip es requerida</span>
                        <div> {{zipcodeError}} </div>
                        <div ng-show="isValidZipcode">

                            <div class="caja_registro big">{{zipcodeData.parent_location[1].name}}</div>
                            <div class="caja_registro big">{{zipcodeData.parent_location[0].name}}</div>
                            <div>
                                <select ng-model="locationId" class="caja_seleccion big" name="locationId" required>
                                    <option value="">Selecciona una colonia</option>
                                    <option ng-repeat="col in cols" value="{{col.locationId}}">{{col.name}}</option>
                                </select>
                                <span class="error" ng-show="errorLocationId">La colonia es requerida</span>
                            </div>
                        </div>
                    </div>
                </div>


                <div class="form-group" ng-show="isValidZipcode">
                    <label>¿En que estados puedes tocar?</label>
                    <ul class="gridFeatures">
                        <lablel class="checkbox"><li><input ng-model="all_locations" type="checkbox" name="locations_event" /> Todos</li></lablel>
                        <span ng-repeat="state in stateEventsData">
                            <lablel class="checkbox">
                                <li><input type="checkbox" name="locations_event" value="{{state.locationId}}" ng-checked="all_locations || (state.locationId == zipcodeData.parent_location[1].location_id)" />
                                {{state.name}}-{{state.locationId == zipcodeData.parent_location[1].location_id}}</li>
                            </lablel>
                        </span>
                    </ul>
                </div>
            </div>
        </div>

        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title">[Tu talento]</h3>
            </div>
            <div class="panel-body">
                <div class="form-group">
                    <label>Muestranos un poco de tu talento</label>
                    <input class="form-control caja_registro big" size="50" maxlength="50" type="text" ui-Blur="embedVideo()" ng-model="urlVideo" name="url_video" placeholder="Link de youtube">
                    <div ng-show="isValidVideo">
                        <iframe src="{{urlVideoEmbed}}" frameborder="0" allowfullscreen></iframe>
                    </div>
                    no tienes?, nosotros lo hacemos preguntanos aqui..
                </div>

                <div class="form-group">
                    <label>Fotos:</label>
                    <div class="array_pictures">
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

                <div class="form-group">
                    <label>Describete mejor!!</label>
                    <div>
                        <textarea class="form-control caja_registro big" ng-model="description" name="Description" cols="20" rows="10"></textarea>
                    </div>
                </div>
            </div>
        </div>
        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title">[Como te contactamos]</h3>
            </div>
            <div class="panel-body">
                <div class="form-group">
                    <label>¿Como te contactamos?</label>
                    <div class="data_value">
                        <input ng-model="email" name="email" type="email" id="id_email" class="form-control caja_registro big" placeholder="Email" required />
                        <span class="error" ng-show="errorEmail">El email es requerido</span>
                        <input ng-model="phones" name="telefonos" type="text" id="id_telefonos" class="form-control caja_registro big" placeholder="Telefonos" required />
                        <div class="reg_ejemplo"> Ej: (55)1234-5555, (55)5555-4444</div>
                        <span class="error" ng-show="errorPhones">El telefono es requerido</span>



                    </div>
                </div>

                <div class="form-group">
                    <g:submitButton name="cancel" class="btn btn-default" value="Cancelar"></g:submitButton>
                    <g:submitButton id="btnContinuar" class="btn btn-primary" name="submit"  value="Publica tu banda ahora"></g:submitButton>
                </div>
                <input type="hidden" name="pictures" value="{{picturesJson}}"/>
            </div>
        </div>

    </g:form>
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
    //var apiBaseUrl = "http://api.maxibanda.com.mx";
    var apiBaseUrl = "http://" + document.domain + "\\:8888"
</script>
</body>
</html>



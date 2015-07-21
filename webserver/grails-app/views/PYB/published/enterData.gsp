<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>maxibanda.com.mx</title>
</head>
<body>



<div class="container" ng-controller="PYBController" data-ng-init="init()">
<g:form name="published"  ng-submit="createBand()">
<div class="page-header">
    <h3>Publica tu banda es facil, rapido y seguro!!</h3>
</div>
<div class="panel panel-default">

    <div class="panel-body">
        <div class="row">
            <div class="col-lg-4">
                <div class="form-group input-group-lg">
                    <label for="exampleInputEmail1">Nombre de tu banda</label>
                    <input type="text" ng-model="name" class="form-control"  placeholder="Nombre de tu banda" required="" />
                    <span class="error" ng-show="errorPass">El nombre es requerido</span>
                </div>
            </div> <!-- col-lg-x-->
            <div class="col-lg-4">
                <div class="form-group input-group-lg">
                    <label for="exampleInputEmail1">Que muscia tocas</label>
                    <select ng-model="categoryId"  class="form-control" required >
                        <option value="">Selecciona un género</option>
                        <option ng-repeat="genero in generos" value="{{genero.category_id}}">{{genero.name}}</option>
                    </select>
                    <span class="error" ng-show="errorCategory">La categoria es requerido</span>
                </div>
            </div>
            <div class="col-lg-4">
                <div class="form-group form-inline">
                    <label for="exampleInputEmail1">Cuanto cobras por evento</label>
                    <div class="input-group input-group-lg">
                        <div class="input-group-addon">$</div>
                        <input ng-model="price" type="text" class="form-control" only-digits id="exampleInputAmount" placeholder="Amount" required>
                        <span class="error" ng-show="errorPrice">El precio es requerido</span>
                        <div class="input-group-addon">.00</div>
                    </div>
                </div>
            </div>

            <div class="col-lg-4">
                <div class="form-group input-group-lg">
                    <label for="exampleInputEmail1">En donde se ubica tu banda</label>
                    <input type="text" ui-Blur="searchZipcodes()" ng-model="zipcodeValue" class="form-control" placeholder="Codigo Postal" required>
                    <span class="error" ng-show="errorZipcode">El zip es requerida</span>
                    {{zipcodeError}}
                </div>
            </div>
        </div>

        <div class="row" ng-show="isValidZipcode">
            <div class="col-lg-4">
                <div class="form-group input-group-lg">
                    <label for="exampleInputEmail1">Estado</label>
                    <input type="text" class="form-control"  placeholder="Estado" value="{{zipcodeData.parent_location[1].name}}" disabled>
                </div>
            </div> <!-- col-lg-x-->
        </div>


        <div class="row" ng-show="isValidZipcode">
            <div class="col-lg-4">
                <div class="form-group input-group-lg">
                    <label for="exampleInputEmail1">Municipio</label>
                    <input type="text" class="form-control" id="exampleInputEmail1" placeholder="Municipio" value="{{zipcodeData.parent_location[0].name}}" disabled>
                </div>
            </div> <!-- col-lg-x-->
        </div>

        <div class="row" ng-show="isValidZipcode">
            <div class="col-lg-4">
                <div class="form-group input-group-lg">

                    <label for="exampleInputEmail1">Colonia</label>
                    <select ng-model="locationId" class="form-control" required >
                        <option value="">Selecciona una colonia</option>
                        <option ng-repeat="col in cols" value="{{col.locationId}}">{{col.name}}</option>
                    </select>
                    <span class="error" ng-show="errorLocationId">La colonia es requerida</span>
                </div>
            </div> <!-- col-lg-x-->
        </div>


        <div class="row" ng-show="isValidZipcode">
            <div class="col-lg-10">
                <div class="form-group input-group-lg">
                    <label for="exampleInputEmail1">Estados donde tocas</label>
                    <div class="checkbox">
                        <ul class="list-unstyled">
                            <li  class="list-group col-lg-4">
                                <label>
                                    <input ng-model="all_locations" type="checkbox" name="locations_event" /> Todos
                                </label>
                            </li>
                            <li class="list-group col-lg-4" ng-repeat="state in stateEventsData">
                                <label>
                                    <input type="checkbox" name="locations_event" value="{{state.locationId}}" ng-checked="all_locations || (state.locationId == zipcodeData.parent_location[1].location_id) || isAdjacentState(zipcodeData.parent_location[1].adjacent_locations,state.locationId)" />
                                    {{state.name}}
                                </label>
                            </li>
                        </ul>
                    </div>

                </div>
            </div>
        </div><!-- end row -->

        <div class="row">
            <div class="col-lg-12">
                <div class="form-group input-group-lg">
                    <label for="exampleInputEmail1">Eventos donde tocas principalmente</label>
                    <div class="checkbox">
                        <ul class="list-unstyled">
                            <li class="list-group col-lg-4">
                                <label>
                                    <input ng-model="all_events" type="checkbox" name="social_event" /> Todos
                                </label>
                            </li>
                            <li class="list-group col-lg-4" ng-repeat="event in socialEventsData">
                                <label>
                                    <input type="checkbox" name="social_event" value="{{event.categoryId}}" ng-checked="all_events"  /> {{event.name}}
                                </label>
                            </li>
                        </ul>
                    </div>

                </div>

            </div>

        </div> <!-- fin row -->
    </div>
</div>
<div class="panel panel-default">
    <div class="panel-body">
        <div class="row">
            <div class="col-lg-4">
                <div class="form-group input-group-lg">
                    <label for="exampleInputEmail1">Video de YouTube <small><a href="#">No tienes? nostoros lo hacemos aquí</a></small></label>
                    <input type="text" ui-Blur="embedVideo()" ng-model="urlVideo" class="form-control"  placeholder="Link YouTube" />
                </div>
            </div> <!-- col-lg-x-->
        </div> <!-- row -->

        <div class="row" ng-show="isValidVideo">
            <div class="col-lg-4">
                <div class="form-group input-group-lg">
                    <iframe src="{{urlVideoEmbed}}" frameborder="0" allowfullscreen></iframe>
                </div>
            </div> <!-- col-lg-x-->
        </div> <!-- row -->


        <div class="row">
            <div class="col-xs-1 col-lg-10">
                <div class="form-group input-group-lg">
                    <label for="exampleInputEmail1">Fotos</label>
                    <div  class="array_pictures">
                        <div class="fileUpload btn_foto">
                        <input id="picture_0" class="upload"  type="file" ng-file-select="onFileSelect($files,0)" multiple accept="image/*" data-multiple="true">
                        <img ng-show="loadingPicture(0)" ng-src="http://localhost:8080/publica/loading_picture.gif" alt="Foto 1" class="img-rounded">
                        <img ng-show="urlPic[0] != null" ng-src="{{urlPic[0]}}" class="img-rounded">
                        </div>
                        <div class="fileUpload btn_foto">
                        <input class="upload" type="file" ng-file-select="onFileSelect($files,1)">
                        <img ng-show="urlPic[1] != null" ng-src="{{urlPic[1]}}" class="img-rounded">
                        </div>
                        <div class="fileUpload btn_foto">
                        <input class="upload" type="file" ng-file-select="onFileSelect($files,2)">
                        <img ng-show="urlPic[2] != null" ng-src="{{urlPic[2]}}" class="img-rounded">
                        </div>
                        <div class="fileUpload btn_foto">
                        <input class="upload" type="file" ng-file-select="onFileSelect($files,3)">
                        <img ng-show="urlPic[3] != null" ng-src="{{urlPic[3]}}" class="img-rounded">
                        </div>
                    </div>
                </div>
            </div> <!-- col-lg-x-->

        </div> <!-- row -->

        <div class="row">
            <div class="col-lg-10">
                <div class="form-group input-group-lg">
                    <label for="exampleInputEmail1">Describete mejor</label>
                    <div>
                        <textarea class="form-control" ng-model="description"  rows="10" cols="20" placeholder="Descripciín de tu banda"></textarea>
                    </div>
                </div>
            </div> <!-- col-lg-x-->
        </div> <!-- row -->

    </div>
</div>
<g:if test="${session['user'] == null}">
<div class="panel panel-default">
    <div class="panel-body">
        <div class="row">
            <div class="col-lg-4">
                <div class="form-group input-group-lg">
                    <label for="exampleInputEmail1">Email</label>
                    <input ng-model="email" type="email" class="form-control" id="id_email" placeholder="Email" required />
                    <span class="error" ng-show="errorEmail">El email es requerido</span>
                </div>
            </div> <!-- col-lg-x-->
        </div> <!-- row -->
        <div class="row">
            <div class="col-lg-4">
                <div class="form-group input-group-lg">
                    <label for="exampleInputEmail1">Telefonos</label>
                    <input ng-model="phones" type="text" class="form-control" id="id_telefonos" placeholder="Ej. 55-5555-5555, 22-2222-2222" required />
                    <span class="error" ng-show="errorPhones">El telefono es requerido</span>
                </div>
            </div> <!-- col-lg-x-->
        </div> <!-- row -->
    </div>
</div>
</g:if>

<g:submitButton name="cancel" class="btn btn-default btn-xs" value="Cancelar"></g:submitButton>
<g:submitButton id="btnContinuar" class="btn btn-warning btn-lg" name="submit"  value="Publica tu banda ahora"></g:submitButton>
<input type="hidden" name="pictures" value="{{picturesJson}}"/>

</g:form>
<footer>
    <p class="pull-right">&copy; 2015 maxibandas, Inc. &middot; </p>
</footer>

</div><!--/.container-->

</body>
</html>



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
                <form id="fileupload" action="cargaFotografias.asp" method="POST" enctype="multipart/form-data">

                    <div class="row fileupload-buttonbar">
                        <div class="span7">
                            <span class="btn btn-success fileinput-button">
                                <i class="icon-plus icon-white"></i>
                                <span>Seleccionar Fotos</span>
                                <input type="file" name="files[]" multiple>
                            </span>
                            <button type="submit" class="btn btn-primary start">
                                <i class="icon-upload icon-white"></i>
                                <span>Iniciar carga</span>
                            </button>

                            <button type="button" class="btn btn-danger delete">
                                <i class="icon-trash icon-white"></i>
                                <span>Eliminar</span>
                            </button>
                            <input type="checkbox" class="toggle">
                        </div>
                        <div class="span5">
                            <!-- The global progress bar -->
                            <div class="progress progress-success progress-striped active fade">
                                <div class="bar" style="width:0%;"></div>
                            </div>
                        </div>
                    </div>
                    <!-- The loading indicator is shown during file processing -->
                    <div class="fileupload-loading"></div>
                    <br>
                    <!-- The table listing the files available for upload/download -->
                    <table class="table table-striped">
                        <tbody class="files" data-toggle="modal-gallery" data-target="#modal-gallery"></tbody>
                    </table>
                </form>

                <!-- modal-gallery is the modal dialog used for the image gallery -->
                <div id="modal-gallery" class="modal modal-gallery hide fade" data-filter=":odd">
                    <div class="modal-header">
                        <a class="close" data-dismiss="modal">&times;</a>
                        <h3 class="modal-title"></h3>
                    </div>
                    <div class="modal-body"><div class="modal-image"></div></div>
                    <div class="modal-footer">
                        <a class="btn modal-download" target="_blank">
                            <i class="icon-download"></i>
                            <span>Descargar</span>
                        </a>
                        <a class="btn btn-success modal-play modal-slideshow" data-slideshow="5000">
                            <i class="icon-play icon-white"></i>
                            <span>Presentación</span>
                        </a>
                        <a class="btn btn-info modal-prev">
                            <i class="icon-arrow-left icon-white"></i>
                            <span>Previa</span>
                        </a>
                        <a class="btn btn-primary modal-next">
                            <span>Siguiente</span>
                            <i class="icon-arrow-right icon-white"></i>
                        </a>
                    </div>
                </div>
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
<script src="${resource(dir: 'js', file: 'app.js')}"></script>
<script src="${resource(dir: 'js', file: 'controller.js')}"></script>
<script src="${resource(dir: 'js', file: 'service.js')}"></script>
<script >
    var apiBaseUrl = "http://api.maxibanda.com.mx";
</script>
</body>
</html>
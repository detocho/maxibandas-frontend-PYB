<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>maxibanda.com.mx</title>
</head>
<body>

<main>

    <h2><span class="H2titulo">»</span>Escribe las caracteristicas de tu banda</h2>
    <div id="dataItemMain">
        <!-- <form name="dataItem" action="" method="post"> -->
        <div class="feature_item">
            <div class="data_etiqueta">¿Que musica tocas?</div>
            <div class="data_value">
                <select class="caja_seleccion big" name="genero">
                    <option value="Sinaloense">Selecciona un género</option>
                    <option value="Sinaloense">Sinaloense</option>
                    <option value="Rock">Rock</option>
                    <option value="Pop">Pop</option>
                    <option value="Alternativo">Alternativo</option>
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

        <div class="feature_item">
            <div class="data_etiqueta">¿De donde eres?</div>
            <div class="data_value">
                <select name="estado" id="id_estado" class="caja_seleccion big">
                    <option value="0-none">Selecciona un estado</option>
                    <option value="1-AGUASCALIENTES">AGUASCALIENTES</option>
                    <option value="2-BAJA CALIFORNIA">BAJA CALIFORNIA</option>
                    <option value="3-BAJA CALIFORNIA SUR">BAJA CALIFORNIA SUR</option>
                    <option value="4-CAMPECHE">CAMPECHE</option>

                    <option value="5-COAHUILA">COAHUILA</option>
                    <option value="6-COLIMA">COLIMA</option>
                    <option value="7-CHIAPAS">CHIAPAS</option>
                    <option value="8-CHIHUAHUA">CHIHUAHUA</option>
                    <option value="9-DISTRITO FEDERAL">DISTRITO FEDERAL</option>
                    <option value="10-DURANGO">DURANGO</option>

                    <option value="11-GUANAJUATO">GUANAJUATO</option>
                    <option value="12-GUERRERO">GUERRERO</option>
                    <option value="13-HIDALGO">HIDALGO</option>
                    <option value="14-JALISCO">JALISCO</option>
                    <option value="15-MEXICO">MEXICO</option>
                    <option value="16-MICHOACAN">MICHOACAN</option>

                    <option value="17-MORELOS">MORELOS</option>
                    <option value="18-NAYARIT">NAYARIT</option>
                    <option value="19-NUEVO LEON">NUEVO LEON</option>
                    <option value="20-OAXACA">OAXACA</option>
                    <option value="21-PUEBLA">PUEBLA</option>
                    <option value="22-QUERETARO">QUERETARO</option>

                    <option value="23-QUINTANA ROO">QUINTANA ROO</option>
                    <option value="24-SAN LUIS POTOSI">SAN LUIS POTOSI</option>
                    <option value="25-SINALOA">SINALOA</option>
                    <option value="26-SONORA">SONORA</option>
                    <option value="27-TABASCO">TABASCO</option>
                    <option value="28-TAMAULIPAS">TAMAULIPAS</option>

                    <option value="29-TLAXCALA">TLAXCALA</option>
                    <option value="30-VERACRUZ">VERACRUZ</option>
                    <option value="31-YUCATAN">YUCATAN</option>
                    <option value="32-ZACATECAS">ZACATECAS</option>

                </select>
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
                <input class="caja_registro big" size="50" maxlength="50" type="text" name="url_video" placeholder="Link de youtube">
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
</body>
</html>
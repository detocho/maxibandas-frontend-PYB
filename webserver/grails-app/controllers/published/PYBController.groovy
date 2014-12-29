package published

class PYBController {

    def pybService = new PYBService()

    //println "ya entro al controller"


    def publishedFlow = {

        begin{
            action{

                flow.nameBand = 'los biscochos'
                flow.groups  = pybService.getGroups()
                flow.nameTest = 'david'
                if(!flow.groups){
                    return error()
                }

            }
            on('success').to 'enterData'
            on('error').to 'errorPublished'
        }

        enterData {

            [model: [flow.groups, flow.nameBand, flow.nameTest]]

            on('submit'){
                flow.nameTest = "Entro a la prueba"

                println "hola aqui estoy"
                println "los parametros con "+params

                flow.nameBand       = params.name_band
                flow.phones         = params.telefonos
                flow.description    = params.Description
                flow.genero         = params.genero
                flow.price          = params.price
                flow.payForm        = params.payForm
                flow.email          = params.email
                flow.zipcode        = params.zipcode
                flow.locationId     = params.locationId
                flow.urlVide        = params.url_video


            }.to 'processData'
            on('cancel').to 'errorPublished'
        }

        processData{

            println "Ahora aqui desde el procesamiento de datos tenemos"+flow.description

            on('submit'){

                //println "los parametros que pasamos son "+flow.params

            }.to 'endPublished'
            on('cancel').to 'errorPublished'
        }

        endPublished{

            on('cancel').to 'errorPublished'
        }

        errorPublished{

        }

    }

/*
    def index() {


        def groups  = pybService.getGroups()


        def model = [

                "groups":groups
        ]


        render (view:'index', model:model)
    }


    def published(){
        //llamamos al servicio
        // procesamos la info en el servicio
        //renderizamos el resultado o enviamos a mi cuenta


        def bandId = pybService.published(params, request.JSON)
        render bandId


        //de aqui hacemos un request a la api de bands
        // lo enviamos a la vista de felicitaciones y un boton de ver banda (revisar si llevara a mi cuenta)
    }

    def endPublished(){

        def bandId = params.bandId
        def model = [
                "bandId":bandId
        ]
        render (view: 'published', model: model)
    }

    */
}

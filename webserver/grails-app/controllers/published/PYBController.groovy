package published

class PYBController {

    def pybService = new PYBService()

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
}

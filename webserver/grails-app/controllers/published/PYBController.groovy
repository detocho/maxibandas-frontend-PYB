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


        render pybService.published(params, request.JSON)
    }
}

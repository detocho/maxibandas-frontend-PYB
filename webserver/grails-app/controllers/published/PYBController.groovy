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
}

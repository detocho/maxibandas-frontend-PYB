package published

import  session.UserSession

class PYBController {

    def pybService = new PYBService()
    def userSession =  new UserSession()

    //println "ya entro al controller"


    def publishedFlow = {

        begin{
            action{

                //TODO aqui definimos si esta logueado

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

                flow.nameBand           = params.name_band
                flow.phones             = params.telefonos
                flow.description        = params.Description
                flow.genero             = params.genero
                flow.price              = params.price
                flow.payForm            = params.payForm
                flow.email              = params.email
                flow.zipcode            = params.zipcode
                flow.locationId         = params.locationId
                flow.urlVideo           = params.url_video
                flow.pictures           = params.pictures
                flow.socialEvents       = params.social_event
                flow.serviceLocations   = params.locations_event


            }.to 'stepValidateSession'
            on('cancel').to 'errorPublished'
        }

        stepValidateSession{
            action{
                if(session["user"]){
                    if(userSession.validSession(session["user"])){
                        return success()
                    }else{
                        return error()
                    }
                }else{
                    return error()
                }

            }
            on('success').to 'processData'
            on('error').to 'stepPassword'
        }

        stepPassword{
           //TODO aqui debemos ver el algoritmo para obtener el password del user siempre y cuando no este logueado
            //TODO revisar el tema del login

            on('submit'){
                session["user"]  = userSession.createSession("davidpaz@maxibandas.com.mx","algo")
            }.to 'processData'
            on('error').to 'errorPublished'
        }

        processData{
            action {

                def publishedMap = [
                        category_id         : flow.genero,
                        name                : flow.nameBand,
                        price_min           : flow.price,
                        price_max           : flow.price,
                        currency_type       : "MXP", //TODO donde metemos el payform
                        location_id         : flow.locationId,
                        service_locations   : flow.serviceLocations,
                        events_types        : flow.socialEvents,
                        web_page            : "",
                        pictures            : flow.pictures,
                        url_videos          : flow.urlVideo,
                        description         : flow.description,
                        type_item           : "free",
                        attributes          : []
                ]

                def parameters = [
                        access_token    : session['user'].token,
                        phone           : flow.phones,
                        email           : flow.email,
                        pass            : params.pass
                ]


                // vamos a imprimir la data que enviarmeos al aservicio

                println "------ los parametros que enviaremos son :"
                println "access_token = "+parameters.access_token
                println "email = "+parameters.email
                println "pass = "+parameters.pass

                println "------- los datos del json de prepublished son :"
                println "category_id = "+publishedMap.category_id
                println "name = "+publishedMap.name
                println "price_min = "+publishedMap.price_min
                println "price_max = "+publishedMap.price_max
                println "currency_type = "+publishedMap.currency_type
                println "location_id = "+publishedMap.location_id
                println "service_locations = "+ publishedMap.service_locations
                println "events_types = "+publishedMap.events_types
                println "web_page = "+publishedMap.web_page
                println "pictures = "+publishedMap.pictures
                println "url_videos = "+publishedMap.url_videos
                println "description  = "+publishedMap.description
                println "type_item = "+publishedMap.type_item
                println "attributes = "+publishedMap.attributes


                def bandId = pybService.published(parameters, publishedMap)

                if (bandId){
                    flow.bandId = bandId
                    //TODO colocar el servicio que envia un email de publicación
                    return success()
                }else {
                    return error()
                }



            }
            on('success').to 'endPublished'
            on('error').to 'errorPublished'
        }

        endPublished{

            on('cancel').to 'errorPublished'
        }

        errorPublished{

        }

    }

    def endSession (){
        session["user"] = userSession.endSession(session["user"])
        redirect( action:"published")
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

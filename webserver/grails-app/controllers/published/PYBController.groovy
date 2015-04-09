package published

import  session.UserSession

class PYBController {

    def pybService = new PYBService()
    def userSession =  new UserSession()


    def publishedFlow = {

        begin{
            action{

                flow.errorSession   = ""
                flow.origin         = "PYB"
                flow.groups         = pybService.getGroups()

                if(!flow.groups){
                    return error()
                }

                if(session['user']){
                    if(!userSession.validSession(session['user'])){
                        userSession.endSession(session['user'])
                    }
                }

            }
            on('success').to 'enterData'
            on('error').to 'errorPublished'
        }

        enterData {


            [model: [flow.groups, flow.nameBand, flow.nameTest]]

            on('submit'){

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

            [model: [flow.errorSession]]
            on('submit'){
                flow.pass = params.password

            }.to 'stepValidatePassword'
            on('error').to 'errorPublished'
        }

        stepValidatePassword{
            action{

                session["user"]  = userSession.createSession(flow.email,flow.pass, flow.locationId, flow.phones, flow.origin,  flow.nameBand)
                if (session["user"].error != ''){
                    flow.errorSession = session["user"].error
                    session["user"]  = null
                    return invalid()
                }else{
                    return success()
                }
            }
            on('success').to 'processData'
            on('invalid').to 'stepPassword'
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
                        pass            : flow.pass
                ]


                // vamos a imprimir la data que enviarmeos al aservicio
                /*
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
                */


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

}

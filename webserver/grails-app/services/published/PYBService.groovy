package published

import rest.RestService

import java.text.MessageFormat
import org.apache.ivy.plugins.conflict.ConflictManager
import grails.converters.*
import published.exceptions.NotFoundException
import published.exceptions.ConflictException
import published.exceptions.BadRequestException

import org.joda.time.LocalTime;
import org.joda.time.format.DateTimeFormatter;
import org.joda.time.format.ISODateTimeFormat;

import javax.servlet.http.HttpServletResponse

class PYBService {

    def restService = new RestService()
    def categoryIdGroups = 'MX1'

    def getGroups(){

        def groups =[]

        def result = restService.getResource("/categories/"+categoryIdGroups+"/")

        if(result.status != HttpServletResponse.SC_OK){
            result.data = []
        }

        result.data.children_categories.each{
            if (it.status == 'active'){
                groups.add(

                        categoryId:it.categoryId,
                        name:it.name
                )
            }
        }

        groups

    }

    def published(def params, def jsonPrepublished){
        //generamos el json con los parametros que se obtienen
        /*
        4.- en el servicio
        4.1.- Buscamos el user por el email
        4.2.- obtenemos el id de usuario (si no esta lo creamos y enviamos un email de registro para que actualice su password)
        4.3.- posteamos el item
        4.4.- mandamos un email de activacion de item
        4.5.- lo redirigimos logueado a su cuenta para administrar su anuncio y desde ahi le decimo que su anuncio esta listo para verlo
        dale click aqui y lo mandamos a la vip del anuncio.
        */

        def bandId
        def email = 'algunmail@dominio.com'
        def phone = 'casa 55 2534-5465'
        def pass = '****'
        def locationId = 'MXNGD1234'
        def origin = 'PYB'

        def result = 'No encontrado'
        println "El email a buscar es"+params.email
        def userId = searchUser(params.email)

        if(userId){
           result = userId
        }else{
           result = createUser(email, phone, pass, locationId, origin)
        }
        if (result){ // TODO si encontramos el usuario entonces hacemo un post de la banda en internal

            //definimos las variables que enviaremos con el body

            def categoryId = ''
            def name = ''
            def priceMin = ''
            def priceMax = ''
            def currencyType = ''
            def serviceLocations = ''
            def eventsTypes = ''
            def managerId = result //TODO revisar que en el metodo internal, podamos postear el user_id
            def webPage = ''
            def pictures = ''
            def urlVideos = ''
            def description = ''
            def typeItem = ''
            def attributes = ''
            def status = 'active'


            def bodyBand = [

                    categoryId          : categoryId,
                    name                : name,
                    priceMin            : priceMin,
                    priceMax            : priceMax,
                    currencyType        : currencyType,
                    locationId          : locationId,
                    serviceLocations    : serviceLocations,
                    eventsTypes         : eventsTypes,
                    managerId           : managerId,
                    webPage             : webPage,
                    pictures            : pictures,
                    urlVideos           : urlVideos,
                    description         : description,
                    typeItem            : typeItem,
                    attributes          : attributes ,
                    status              : status

            ]

            bandId = createBandInternal(bodyBand)

        }

        bandId
    }

    def searchUser(def email){


        def userId

        println "Estamos buscando ... "+email
        def result = restService.getResource("/users/searchByEmail/"+email+"/")
        println "la data encontrada es "+result
        if(result.status == HttpServletResponse.SC_OK){
            //TODO agregar siempre y cuando el estatus del usuario sea active
            userId = result.data.user_id
        }
        println "El user id encontrado es "+userId
        userId

    }

    def createUser(def email, def phone, def pass, def locationId, def origin){

        println "vamos a crear el usuario"
        def userId
        def body = [

                email:email,
                phone:phone,
                password:pass,
                location_id:locationId,
                origin:origin
        ]


        def result = restService.postResource("/users/", body)

        println "el resultado obtenido del create es"+result
        if (result.status == HttpServletResponse.SC_CREATED){
            userId = result.data.id
        }

        userId
    }

    def createBandInternal (def body){

        println "vamos a crear la banda"
        def bandId

        def result = restService.postResource("/bands/", body)

        println "el resultado obtenido del createband es"+result
        if (result.status == HttpServletResponse.SC_CREATED){
            bandId = result.data.band_id
        }

        bandId

    }



}

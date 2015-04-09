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


        def accessToken = params.access_token

        def locationId  = jsonPrepublished.location_id

        def bandId

        if (accessToken){


            def categoryId          = jsonPrepublished.category_id
            def name                = jsonPrepublished.name
            def priceMin            = jsonPrepublished.price_min
            def priceMax            = jsonPrepublished.price_max
            def currencyType        = jsonPrepublished.currency_type
            def serviceLocations    = jsonPrepublished.service_locations
            def eventsTypes         = jsonPrepublished.events_types
            def webPage             = jsonPrepublished.web_page
            def pictures            = jsonPrepublished.pictures
            def urlVideos           = jsonPrepublished.url_videos
            def description         = jsonPrepublished.description
            def typeItem            = jsonPrepublished.type_item
            def attributes          = jsonPrepublished.attributes
            def status              = 'active'


            def bodyBand = [

                    category_id         : categoryId,
                    name                : name,
                    price_min           : priceMin,
                    price_max           : priceMax,
                    currency_type       : currencyType,
                    location_id         : locationId,
                    service_locations   : serviceLocations,
                    events_types        : eventsTypes,
                    web_page            : webPage,
                    pictures            : pictures,
                    url_videos          : urlVideos,
                    description         : description,
                    type_item           : typeItem,
                    attributes          : attributes ,
                    status              : status

            ]

            bandId = createBand(bodyBand, accessToken)

        }

        bandId
    }

    def searchUser(def email){

        def userId

        def result = restService.getResource("/users/searchByEmail/"+email+"/")

        if(result.status == HttpServletResponse.SC_OK){
            //TODO agregar siempre y cuando el estatus del usuario sea active
            userId = result.data.user_id
        }

        userId

    }

    def getUser(def userId){
        def result = restService.getResource("/users/"+userId)
        result
    }

    def getUser(def userId, def accessToken){

        def params = [
                access_token:accessToken
        ]

        def result = restService.getResource("/users/"+userId, params)

        result
    }

    def createUser(def email, def phone, def pass, def locationId, def origin, def name){

        def userId
        def body = [
                name:name,
                email:email,
                phone:phone,
                password:pass,
                location_id:locationId,
                origin:origin
        ]

        def result = restService.postResource("/users/", body)


        if (result.status == HttpServletResponse.SC_CREATED){
            userId = result.data.id
        }

        userId
    }

    def createBand (def body, def accessToken){

        def bandId

        def params = [
                access_token:accessToken
        ]

        def result = restService.postResource("/bands/", params, body)

        if (result.status == HttpServletResponse.SC_CREATED){
            bandId = result.data.band_id
        }

        bandId

    }


    def getAccessToken (def email, def pass){


        def body = [
                email:email,
                password: pass
        ]


        def result = restService.postResource("/oauth/", body)

        result
    }


}

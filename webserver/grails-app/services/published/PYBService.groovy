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


}

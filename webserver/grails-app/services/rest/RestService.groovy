package rest

import org.codehaus.groovy.grails.commons.DefaultGrailsApplication
import grails.converters.JSON
import javassist.NotFoundException
import net.sf.json.JSONNull
import org.codehaus.groovy.grails.web.json.JSONObject
import published.exceptions.NotFoundException
import published.exceptions.ConflictException
import published.exceptions.BadRequestException

import grails.util.Environment
import groovyx.net.http.*
import groovyx.net.http.HTTPBuilder

import static groovyx.net.http.ContentType.*
import static groovyx.net.http.Method.*

import groovyx.net.http.RESTClient

import javax.servlet.http.HttpServletResponse
import grails.plugin.gson.converters.GSON




class RestService {


    static transactional = true

    def grailsApplication = new DefaultGrailsApplication()
    def urlBase = grailsApplication.config.domainMainUsers



    def restClient  = new RESTClient(urlBase)



    def getResource(def resource, def queryParams){

        Map result = [:]



        try {

            def resp = restClient.get(path:resource, query:queryParams, requestContentType: 'application/json')

            result.status   = resp.status
            result.data     = resp.data

        } catch (HttpResponseException e){
            def dataMap = [
                    error:e.response.responseData.error,
                    message:e.response.responseData.message
            ]
            result.status   = e.response.responseData.status
            result.data     = dataMap
        }

        result


    }

    def getResource(def resource){

        Map result = [:]

        try {

            def resp = restClient.get(path: resource, requestContentType: 'application/json')


            result.status   = resp.status
            result.data     = resp.data


        } catch (HttpResponseException e){
            def dataMap = [
                    error:e.response.responseData.error,
                    message:e.response.responseData.message
            ]
            result.status   = e.response.responseData.status
            result.data     = dataMap
        }


        result


    }


    def postResource(def resource, def body){

        Map result = [:]

        try {

            def resp = restClient.post(
                    path: resource,
                    body: body,
                    requestContentType: 'application/json')


            result.status = resp.status
            result.data = resp.data




        }catch (HttpResponseException e){
            def dataMap = [
                    error:e.response.responseData.error,
                    message:e.response.responseData.message
            ]
            result.status   = e.response.responseData.status
            result.data     = dataMap
        }

        result
    }

    def postResource(def resource,def query, def body){

        Map result = [:]

        try {

            def resp = restClient.post(
                    path: resource,
                    query: query,
                    body: body,
                    requestContentType: 'application/json')

            result.status = resp.status
            result.data = resp.data




        }catch (HttpResponseException e){
            def dataMap = [
                    error:e.response.responseData.error,
                    message:e.response.responseData.message
            ]
            result.status   = e.response.responseData.status
            result.data     = dataMap
        }

        result
    }

    def putResource(def resource, def body){
        Map result = [:]



        try {

            def resp = restClient.put(
                    path : resource,
                    body : body,
                    requestContentType : 'application/json' )


            result.status = resp.status
            result.data = resp.data



        }catch (HttpResponseException e){
            def dataMap = [
                    error:e.response.responseData.error,
                    message:e.response.responseData.message
            ]
            result.status   = e.response.responseData.status
            result.data     = dataMap
        }

        result

        result
    }


}

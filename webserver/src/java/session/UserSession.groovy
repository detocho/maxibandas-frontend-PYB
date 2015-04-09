package session

import published.PYBService

import javax.servlet.http.HttpServletResponse

/**
 * Created by dpaz on 24/03/15.
 */
class UserSession {

    def pybService = new PYBService()

    def validSession(def user){

        def isValidSession = false

        if(user){
            if(user.token){
                if(tokenValid(user.id, user.token)){
                    isValidSession =  true
                }
            }

        }

        isValidSession

    }

    def createSession(def email, def password, def locationId, def phone, def origin, def name){

        def token
        def userId
        def user
        def dataToken

        dataToken = pybService.getAccessToken(email, password)
        if (dataToken){
            if(dataToken.status  == HttpServletResponse.SC_CREATED){
                token   = dataToken.data.access_token
                userId  = dataToken.data.user_id
            }
        }

        if(!token){
            userId = pybService.searchUser(email)
            if(userId){
                user  = createErrorUser('El email y el password son incorrectos')
            }else{

                userId = pybService.createUser(email, phone, password, locationId, origin, name)
                if(userId){
                    dataToken = pybService.getAccessToken(email, password)
                    if (dataToken){
                        if(dataToken.status  == HttpServletResponse.SC_CREATED){
                            token   = dataToken.data.access_token
                            userId  = dataToken.data.user_id
                        }
                    }
                    user = createUserWithToken(token, userId)
                }else{
                    user = createErrorUser('Ocurrio un error y no pudimos registrarte')
                }
            }
        }else{

            user = createUserWithToken(token, userId)
        }

        user

    }

    def endSession(def user){

        user.token  = null
        user.id     = null
        user.name   = null
        user.error  = null

        user = null

        user
    }

    def createUserWithToken(def token, def userId){

        def user
        def dataUser = pybService.getUser(userId)
        if(dataUser){
            user = new User(
                    token   : token,
                    id      : userId,
                    name    : dataUser.data.name,
                    error   : ''
            )
        }else{
            user = new User(
                    token   : null,
                    id      : 0,
                    name    :'',
                    error   : 'Ocurrio un error !!!'
            )
        }

        user

    }

    def createErrorUser (def errorMessage){

        def user  = new User(
                token   : null,
                id      : 0,
                name    :'',
                error   : errorMessage
        )

        user
    }

    def tokenValid (def userId, def token){

        def isValid = false
        def result =  pybService.getUser(userId, token)

        if (result){
            if (result.data.id){
                isValid =  true
            }
        }

        isValid

    }
}

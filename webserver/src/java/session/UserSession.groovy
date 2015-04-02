package session

import published.PYBService

/**
 * Created by dpaz on 24/03/15.
 */
class UserSession {

    def pybService = new PYBService()

    def validSession(def user){

        if(user){
            return true
        }else{
            return false
        }
    }

    def createSession(def email, def password){

        // buscamos el token con las credenciales
        def token = pybService.getAccessToken(email, password)
        // si hay token, entonces buscamos el usuario  en users
        // si no hay user entonces lo registramos con los datos minimos
        // si hay user entonces creamos una instancias de user
        def user = new User(
                token: token,
                id: 5,
                name: "DAVIDPAZ"
        )

        user

    }

    def endSession(def user){

        user.token  = null
        user.id     = null
        user.name   = null

        user = null

        return user
    }
}

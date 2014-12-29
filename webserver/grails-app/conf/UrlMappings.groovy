class UrlMappings {

    static mappings = {

        "/" (controller:'PYB',action:'published')

        "/$controller/$action?/$id?"{
            constraints {
                // apply constraints here
            }
        }

       // "/band" (controller:'PYB',action:'published')
       // "/endPublished" (controller: 'PYB', action: 'endPublished')
       /*
       TODO podemos meter el login aqui?
       "/listado/" (controller: 'Search', action:'Index')

        "/banda/$bandId?" (controller:'VBP', action:'Index')
        */

    }
}

class UrlMappings {

    static mappings = {

        "/" (controller:'PYB',action:'Index')

        "/band" (controller:'PYB',action:'published')
        "/endPublished" (controller: 'PYB', action: 'endPublished')
       /*
       TODO podemos meter el login aqui?
       "/listado/" (controller: 'Search', action:'Index')

        "/banda/$bandId?" (controller:'VBP', action:'Index')
        */

    }
}

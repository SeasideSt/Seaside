updating
updateRoot: anHtmlRoot
	super updateRoot: anHtmlRoot.
	#(#resetCss #typographyCss #screenCss) do: [ :selector |
		anHtmlRoot stylesheet url:  (WASwaggerUIFileLibrary / selector) ].
	#(#jquery180minJs #jquerybabbqminJs #jquerywiggleminJs #jqueryslidetominJs #underscoreminJs #shredbundleJs #handlebars200Js #highlight73packJs #markedJs  #backboneminJs  #swaggerclientJs  #swaggeruiminJs #swaggeroauthJs) do: [ :selector |
		anHtmlRoot javascript url: (WASwaggerUIFileLibrary / selector) ].
	anHtmlRoot bodyAttributes addClass: 'swagger-section'.
	anHtmlRoot addScript: '$(function () {
      var url = window.location.search.match(/url=([^&]+)/);
      if (url && url.length > 1) {
        url = decodeURIComponent(url[1]);
      } else {
        url = "http://" + window.location.host + "/config-api/swagger.json";
      }
      window.swaggerUi = new SwaggerUi({
        url: url,
        dom_id: "swagger-ui-container",
        supportedSubmitMethods: [''get'', ''post'', ''put'', ''delete'', ''patch''],
        onComplete: function(swaggerApi, swaggerUi){
          if(typeof initOAuth == "function") {
            /*
            initOAuth({
              clientId: "your-client-id",
              realm: "your-realms",
              appName: "your-app-name"
            });
            */
          }
          $(''pre code'').each(function(i, e) {
            hljs.highlightBlock(e)
          });
        },
        onFailure: function(data) {
          log("Unable to Load SwaggerUI");
        },
        docExpansion: "none",
        sorter : "alpha"
      });

      function addApiKeyAuthorization() {
        var key = $(''#input_apiKey'')[0].value;
        log("key: " + key);
        if(key && key.trim() != "") {
            log("added key " + key);
            window.authorizations.add("api_key", new ApiKeyAuthorization("api_key", key, "query"));
        }
      }

      $(''#input_apiKey'').change(function() {
        addApiKeyAuthorization();
      });

      // if you have an apiKey you would like to pre-populate on the page for demonstration purposes...
      /*
        var apiKey = "myApiKeyXXXX123456789";
        $(''#input_apiKey'').val(apiKey);
        addApiKeyAuthorization();
      */

      window.swaggerUi.load();
  });'
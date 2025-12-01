"
I am a WebComponent library that allows users to embed Seaside components into existing web pages.

Usually I would not be used directly a Seaside application, instead I would be handed off to a different application or web page that wants to embed Seaside components.

# Usage

To use this library 

```language=HTML
<html>
  <head>
    <!-- -->
    <script src=""seaside-components.js"" defer></script>
  </head>
  <body>
    <!-- -->
    <wa-component url=""/examples/headless-counter"">Loading...</wa-component>
    <!-- -->
  </body>
</html>
```

# Page Refreshes

When an embeded component does a full page refresh a full page refresh of the containing page will result. If this is not wanted then the component needs to use Ajax or opt-in to ajaxification.

# Ajaxification

Per default no ajaxification will happen so you have to make sure your component does not perform full page requests.

You can opt in to ajaxification using

```language=HTML
<seaside-component url=""/examples/headless-counter"" ajaxify=""true"">Loading...</seaside-component>
```

# Error Handling

If Ajax calls fails the library generates events of type ""wa-component.xhr"" to which the embedding page can listen. For example with code similar to this

```language=JavaScript
const components = document.getElementsByTagName(""wa-component"");
for (const component of components) {
	component.addEventListener(""wa-component.xhr"", (event) => {
		console.error(""wa-component xhr call failed %O"", event) });
};
```

The event handler has to be registered before the first AJAX call is made (the component is connected).
"
Class {
	#name : 'WAWebComponentsLibrary',
	#superclass : 'WAFileLibrary',
	#category : 'Seaside-WebComponents-Core',
	#package : 'Seaside-WebComponents-Core'
}

{ #category : 'scripts' }
WAWebComponentsLibrary >> seasideWebComponentsJs [
	^ '"use strict";
(function() {
  class WaComponent extends HTMLElement {
    static ELEMENT_NAME = "wa-component";
    #shadowRoot;
    constructor() {
      super();
      this.#shadowRoot = this.attachShadow({mode: "closed"});
    }

    #ajaxify() {
      this.#shadowRoot.addEventListener("click", (event) => {
		
        // links
        const anchor = event.target.closest("a");
        if (anchor !== null) {
          this.#load("GET", anchor.getAttribute("href"), null);
          event.preventDefault();
          return;
        }

        // submit
        const submit = event.target.closest("input[type=submit], button[type=submit]");
        if (submit !== null) {
          const form = submit.closest("form");
          if (form !== null) {
            const formData = new FormData(form);
            formData.append(submit.getAttribute("name"), "");
            this.#load("POST", form.getAttribute("action"), formData);
            event.preventDefault();
          }
        }
      });
    }

    #publishXhrEvent(type, cause) {
      this.#shadowRoot.dispatchEvent(new CustomEvent(WaComponent.ELEMENT_NAME + ".xhr", {
          bubbles: true,
          cancelable: false,
          composed: true,
          detail: {
            type: type,
            cause: cause
          },
       }));
    }

    #load(method, url, data) {
      const xhr = new XMLHttpRequest();

      xhr.responseType = "text";  // we do not strip anyhing, just use innerHtml
      xhr.onload = (event) => {
        const status = xhr.status;
        if (status === 200) {
          this.#shadowRoot.innerHTML = xhr.response;
        } else if (status >= 400 && status <= 599) {
          this.#publishXhrEvent("status", event);
        }
      };
      xhr.onerror = (event) => { this.#publishXhrEvent("error", event); };
      xhr.ontimeout = (event) => { this.#publishXhrEvent("timeout", event); };
		
      xhr.open(method, url);

      // WAActionCallback per default are disabled for AJAX requests
      // Detection happens with X-Requested-With so we override it 
      xhr.setRequestHeader("X-Requested-With", "Seaside-WebComponents");
      xhr.send(data);
    }

    connectedCallback() {
      const componentUrl = this.getAttribute("url");
      const ajaxify = this.getAttribute("ajaxify");
      if (ajaxify === "true") {
        this.#ajaxify();
      }
      this.#load("GET", componentUrl, null);
    }
  }

  customElements.define(WaComponent.ELEMENT_NAME, WaComponent);
})();
'
]

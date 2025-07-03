scripts
seasideWebComponentsJs
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
scripts
seasideWebComponentsJs
	^ '"use strict";
(function() {
  class SeasideComponent extends HTMLElement {
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

    #load(method, url, data) {
      const xhr = new XMLHttpRequest();

      xhr.responseType = "text";  // we do not stirp anyhing, just use innerHtml
      xhr.addEventListener("load", (event) => {
        if (xhr.status === 200) {
          this.#shadowRoot.innerHTML = xhr.response;
        }
      });
		
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

  customElements.define("seaside-component", SeasideComponent);
})();
'
accessing
codeeditorControllerJs

	^ 'import { Application, Controller } from "http://localhost:8080/files/WAStimulusFileLibrary/stimulus.js"
	window.Stimulus = Application.start();
Stimulus.register("code-editor", class extends Controller {

  initialize() {
    codeInput.registerTemplate("syntax-highlighted", codeInput.templates.hljs(hljs, [] /* Array of plugins (see below) */));
  }
})'
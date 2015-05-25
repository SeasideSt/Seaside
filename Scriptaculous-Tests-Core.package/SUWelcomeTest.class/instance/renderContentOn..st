rendering
renderContentOn: html
	 html paragraph: [
		html anchor url: self seaside; with: 'Seaside'.
		html text: ' provides a complete integration of '.
		html anchor url: self scriptaculous; with: 'script.aculo.us'.
		html text: ', allowing the use of the library without having to write a single line of JavaScript code. Everything can be configured and plugged together using Smalltalk objects. Try by yourself, by clicking through this functional test suite and by browsing the source-code.' ].
	html heading level: 2; with: 'Seaside'.
	html paragraph: [
		html anchor url: self seaside; with: 'Seaside'.
		html text: ' is a framework for developing sophisticated web applications in Smalltalk. It provides a layered set of abstractions over HTTP and HTML that let you build highly interactive web applications quickly, reusably and maintainably.' ].
	html heading level: 2; with: 'script.aculo.us'.
	html paragraph: [
		html anchor url: self scriptaculous; with: 'script.aculo.us'.
		html text: ' provides you with easy-to-use, compatible and, ultimately, totally cool JavaScript libraries to make your web sites and web applications fly, Web 2.0 style.' ]
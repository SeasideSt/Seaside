rendering
renderWelcomeOn: html
	html paragraph: [
		html anchor
			url: 'http://www.seaside.st/';
			with: 'Seaside'.
		html text: ' provides a complete integration of '.
		html anchor
			url: 'http://www.jquery.com/';
			with: 'jQuery'.
		html text: ', allowing the use of the library without having to write a single line of JavaScript code. Everything can be configured and plugged together using Smalltalk objects. Try by yourself, by clicking through this functional test suite and by browsing the source-code.' ]
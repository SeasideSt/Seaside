rendering
renderSeasideOn: html
	html heading level: 4; with: 'Seaside'.
	html paragraph: [
		html anchor
			url: 'http://www.seaside.st/';
			with: 'Seaside'.
		html text: ' is a framework for developing sophisticated web applications in Smalltalk. It provides a layered set of abstractions over HTTP and HTML that let you build highly interactive web applications quickly, reusably and maintainably.' ]
rendering-steps
renderDocumentationStepOn: html
	html heading
		level3;
		with: 'Browse the documentation'.
		
	html unorderedList: [ 
		html listItem: [
			html text: 'The  '.
			html anchor
				url: 'http://book.seaside.st/';
				with: 'Seaside Book'.
			html text: ' will teach you all you need to know about Seaside and how to build killer web applications.' ].
		html listItem: [
			html text: 'The '.
			html anchor
				url: 'https://github.com/SeasideSt/Seaside/wiki';
				with: 'Seaside Github wiki'.
			html text: ' is where we keep our most up-to-date reference documentation.' ].
		html listItem: [ 
			html text: 'The '.
			html anchor
				url: 'http://www.hpi.uni-potsdam.de/hirschfeld/seaside/tutorial/';
				with: 'Seaside Tutorial'.
			html text: ' has 12 chapters and introduces a sample application to explain the main features of Seaside.' ] ]
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
				url: 'http://www.swa.hpi.uni-potsdam.de/seaside/tutorial';
				with: 'Seaside Tutorial'.
			html text: ' has 12 chapters and introduces a sample application to explain the main features of Seaside.' ] ]
rendering
renderContentOn: html
	| top left id |
	
	html paragraph
		id: (id := html nextId);
		with: 'Drag the Seaside logo!'.
	html image
		altText: 'Seaside';
		url: (JQUiAllFunctionalTestsLibrary urlOf: #seastarPng);
		script: (html jQuery new draggable 
						opacity: 0.75;
						onStop: ((html jQuery id:  id) load 
										callbackDraggable: [ :e | top := (e at: #position) at: 'top'. left := (e at: #position) at: 'left' ];
										html: [ :r | r text: 'top:',top greaseString,'px left:',left greaseString,'px' ] ))
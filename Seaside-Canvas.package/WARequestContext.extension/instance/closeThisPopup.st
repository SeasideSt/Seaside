*seaside-canvas
closeThisPopup
	^ self respond: [ :resp |
		resp 
			contentType: WAMimeType textHtml;
			nextPutAll: (WAHtmlCanvas builder
				fullDocument: true;
				rootBlock: [ :root | 
					root title: 'Seaside'; beHtml5 ];
				render: [ :html | html script: 'window.close();' ]) ]
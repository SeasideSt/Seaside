*seaside-canvas
closeThisPopupAndReloadOpener
	^ self respond: [ :resp |
		resp
			contentType: WAMimeType textHtml;
			nextPutAll: (WAHtmlCanvas builder
				fullDocument: true;
				rootBlock: [ :root | 
					root title: 'Seaside'; beHtml5 ];
				render: [ :html | html script: 'window.close();window.opener.location=window.opener.location;' ]) ]
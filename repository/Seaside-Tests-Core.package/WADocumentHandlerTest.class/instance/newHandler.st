private
newHandler
	^ WADocumentHandler
		document: 'body { background-color: #ffffff }'
		mimeType: WAMimeType textCss
		fileName: 'sample.css'
private
render: anObject
	^ WARenderer builder
		documentClass: WAHtmlDocument;
		render: anObject
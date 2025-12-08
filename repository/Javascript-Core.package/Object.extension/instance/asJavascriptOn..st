*javascript-core
asJavascriptOn: aStream

	^ JSJavascriptCanvas builder
		  render: [ :javascript | self javascriptOn: javascript ]
		  on: aStream
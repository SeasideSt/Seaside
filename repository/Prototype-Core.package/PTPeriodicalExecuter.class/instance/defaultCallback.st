private
defaultCallback
	| js |
	js := JSJavascriptCanvas builder render: [ :javascript |
 		self owner javascriptContentOn: javascript ].
 	^ (JSStream on: js) asFunction
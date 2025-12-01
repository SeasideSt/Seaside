Extension { #name : 'JSStream' }

{ #category : '*Javascript-Tests-Core' }
JSStream >> contents [

	^ JSJavascriptCanvas builder render: [ :javascript |
		self javascriptOn: javascript ]
]

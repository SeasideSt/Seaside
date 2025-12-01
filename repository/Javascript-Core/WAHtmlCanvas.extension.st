Extension { #name : 'WAHtmlCanvas' }

{ #category : '*Javascript-Core' }
WAHtmlCanvas >> renderJavascript: aJavascriptObject [
	JSJavascriptCanvas builder
		actionUrl: self actionUrl;
		resourceUrl: self context resourceUrl;
		render: aJavascriptObject
		on: self document stream
]

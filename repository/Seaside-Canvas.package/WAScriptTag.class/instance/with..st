public
with: aStringOrJSObject

	self attributes
		at: 'type'
		ifAbsentPut: [ 'text/javascript' ].
	super with: [
		aStringOrJSObject ifNotNil: [
			aStringOrJSObject isJavascript
				ifTrue: [
					self document stream javascript: aStringOrJSObject ]
				ifFalse: [
					"we want to render a String directly and avoid escaping "" and '"
					self document nextPutAll: aStringOrJSObject greaseString ] ] ]
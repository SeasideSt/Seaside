public
with: aStringOrJSObject

	self attributes
		at: 'type'
		ifAbsentPut: [ 'text/javascript' ].
	super with: [
		aStringOrJSObject ifNotNil: [
			aStringOrJSObject isString
				ifTrue: [
					"we want to render a String directly and avoid escaping "" and '"
					self document nextPutAll: aStringOrJSObject ]
				ifFalse: [ self document stream javascript: aStringOrJSObject ] ] ]
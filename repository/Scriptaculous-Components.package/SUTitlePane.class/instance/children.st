hooks
children
	^ (body isKindOf: WAComponent)
		ifTrue: [ Array with: body ]
		ifFalse: [ #() ]
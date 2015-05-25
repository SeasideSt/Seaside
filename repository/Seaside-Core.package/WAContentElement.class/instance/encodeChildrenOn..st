printing
encodeChildrenOn: aDocument 
	children isEmptyOrNil ifTrue: [ ^ self ].
	children do: [ :each | aDocument nextPutAll: each greaseString ]
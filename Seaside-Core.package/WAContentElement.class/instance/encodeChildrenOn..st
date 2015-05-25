printing
encodeChildrenOn: aDocument 
	children isEmptyOrNil ifTrue: [ ^ self ].
	aDocument nextPutAll: '/*<![CDATA[*/'.
	children do: [ :each | aDocument nextPutAll: each greaseString ].
	aDocument nextPutAll: '/*]]>*/'
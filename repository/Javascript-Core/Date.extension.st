Extension { #name : #Date }

{ #category : #'*javascript-core' }
Date >> javascriptMonthIndex [
	^ self monthIndex - 1
]

{ #category : #'*javascript-core' }
Date >> javascriptOn: aStream [
	aStream nextPutAll: 'new Date('.
	#( year javascriptMonthIndex dayOfMonth )
		do: [ :each | aStream javascript: (self perform: each) ]
		separatedBy: [ aStream nextPut: $, ].
	aStream nextPut: $)
]

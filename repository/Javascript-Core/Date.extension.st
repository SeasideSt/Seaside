Extension { #name : 'Date' }

{ #category : '*javascript-core' }
Date >> javascriptMonthIndex [
	^ self monthIndex - 1
]

{ #category : '*javascript-core' }
Date >> javascriptOn: aRenderer [
	(aRenderer new: 'Date')
		with: [ 
			aRenderer argument: self year.
			aRenderer argument: self javascriptMonthIndex.
			aRenderer argument: self dayOfMonth ]
]

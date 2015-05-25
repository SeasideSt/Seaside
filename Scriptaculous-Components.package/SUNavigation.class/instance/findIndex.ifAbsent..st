private
findIndex: anItem ifAbsent: aBlock 
	| index |
	index := items findFirst: [ :each | each = anItem ].
	index isZero ifTrue: [ aBlock value ].
	^ index
*seaside-pharo-swagger-core
classCommentOf: aClass
	| comment |
	comment := aClass comment.
	^ (("Pharo 4"
		comment beginsWith: 'Please comment me using the following template inspired by Class Responsibility Collaborator (CRC) design:')
			or: [ "Pharo 2, 3"
				comment beginsWith: 'A ', aClass name asString, ' is xxxxxxxxx.' ])
		ifFalse: [ comment ]
		ifTrue: [ nil ]
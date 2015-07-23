*seaside-pharo-swagger-core
classCommentOf: aClass
	| comment |
	comment := aClass comment.
	^ (comment beginsWith: 'Please comment me using the following template inspired by Class Responsibility Collaborator (CRC) design:')
		ifFalse: [ comment ]
		ifTrue: [ nil ]
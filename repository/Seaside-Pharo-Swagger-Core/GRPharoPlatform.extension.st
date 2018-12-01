Extension { #name : #GRPharoPlatform }

{ #category : #'*seaside-pharo-swagger-core' }
GRPharoPlatform >> classCommentOf: aClass [
	| comment |
	comment := aClass comment.
	^ (("Pharo 4"
		comment beginsWith: 'Please comment me using the following template inspired by Class Responsibility Collaborator (CRC) design:')
			or: [ "Pharo 2, 3"
				comment beginsWith: 'A ', aClass name asString, ' is xxxxxxxxx.' ])
		ifFalse: [ comment ]
		ifTrue: [ nil ]
]

{ #category : #'*seaside-pharo-swagger-core' }
GRPharoPlatform >> methodCommentOf: aSelector in: aClass [
	| class |
	class := aClass.
	[ (class includesSelector: aSelector) ifTrue: [
		| comment |
		comment := (class >> aSelector) comment.
		"the comments for include "" by default at both end"
		^ (comment notNil and: [ comment size > 1 and: [ comment first = $" and: [ comment last = $" ] ] ])
			ifTrue: [ comment copyFrom: 2 to: comment size - 1 ]
			ifFalse: [ comment ] ].
	class := class superclass.
	class isNil ] whileFalse.
	^ nil
]

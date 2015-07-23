*seaside-pharo-swagger-core
methodCommentOf: aSelector in: aClass
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
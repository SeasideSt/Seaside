*seaside-squeak-swagger-core
methodCommentOf: aSelector in: aClass
	| class |
	class := aClass.
	[ (class includesSelector: aSelector) ifTrue: [
		| comments |
		comments :=(class >> aSelector) methodNode comment.
		^ comments ifNotNil:[ comments isEmpty ifTrue:[ nil ] ifFalse:[ comments first ] ] ].
	class := class superclass.
	class isNil ] whileFalse.
	^ nil
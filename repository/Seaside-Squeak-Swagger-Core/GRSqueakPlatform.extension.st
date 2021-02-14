Extension { #name : #GRSqueakPlatform }

{ #category : #'*seaside-squeak-swagger-core' }
GRSqueakPlatform >> classCommentOf: aClass [
	^ (super classCommentOf: aClass) ifNotNil:[:text | text asString ]
]

{ #category : #'*seaside-squeak-swagger-core' }
GRSqueakPlatform >> methodCommentOf: aSelector in: aClass [
	| class |
	class := aClass.
	[ (class includesSelector: aSelector) ifTrue: [
		| comments |
		comments :=(class >> aSelector) methodNode comment.
		^ comments ifNotNil:[ comments isEmpty ifTrue:[ nil ] ifFalse:[ comments first ] ] ].
	class := class superclass.
	class isNil ] whileFalse.
	^ nil
]

{ #category : #'*seaside-squeak-swagger-core' }
GRSqueakPlatform >> pragmaAt: aSymbol in: aMethod [
	^ aMethod pragmaAt: aSymbol
]

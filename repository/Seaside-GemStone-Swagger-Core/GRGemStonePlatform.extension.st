Extension { #name : #GRGemStonePlatform }

{ #category : #'*seaside-gemstone-swagger-core' }
GRGemStonePlatform >> classCommentOf: aClass [
	^ aClass comment
]

{ #category : #'*seaside-gemstone-swagger-core' }
GRGemStonePlatform >> methodCommentOf: aSelector in: aClass [
	| class |
	class := aClass.
	[ (class includesSelector: aSelector) ifTrue: [
		| tokens |
		^ (class sourceCodeAt: aSelector ifAbsent: [ nil ]) ifNotNil:[:sourceCode |
			tokens := sourceCode findBetweenSubStrs: '"'.
			tokens size > 2 
				ifTrue:[ tokens at: 2 ]
				ifFalse: [ nil ] ] ].
	class := class superclass.
	class isNil ] whileFalse.
	^ nil
]

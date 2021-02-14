Extension { #name : #CompiledMethod }

{ #category : #'*Seaside-Pharo-Slime' }
CompiledMethod >> isRenderingMethod [
	(self numArgs > 0 and: [ self selector beginsWith: #render ])
		ifFalse: [ ^ false ].
	^ self literals anySatisfy: [ :each | each isSymbol and: [ WASlime isBrushSelector: each ] ]
]

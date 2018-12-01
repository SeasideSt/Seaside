Extension { #name : #WAUserConfiguration }

{ #category : #'*seaside-tools-web' }
WAUserConfiguration >> configurationComponent [
	^ WAUserConfigurationEditor on: self
]

{ #category : #'*seaside-tools-web' }
WAUserConfiguration >> currentCollectionAt: key [
	"get the currently defined values with infos for collection attributes"
	
	| expression attributeCollection |
	expression := self expressionAt: key ifAbsent: [ nil ].
	expression isNil
		ifTrue: [ attributeCollection := (self at: key) collect: [ :each | #inherited -> each ] ]
		ifFalse: [
			(expression isKindOf: WAValueExpression)
				ifTrue: [ attributeCollection := (expression value collect: [ :each | #self -> each ]) asOrderedCollection ]
				ifFalse: [ attributeCollection := (expression additions collect: [ :each | #add -> each ]) asOrderedCollection.
							attributeCollection addAll: (expression removals collect: [ :each | #remove -> each ]).
							(self at: key) reverse
								do: [ :each |
										(attributeCollection detect: [ :assoc | assoc value = each ] ifNone: [ ]) isNil
												ifTrue: [ attributeCollection addFirst: #inherited -> each ] ] ] ].
	^ attributeCollection
]

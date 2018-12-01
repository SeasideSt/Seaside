Class {
	#name : #WAFixCallbackTempsMissingRule,
	#superclass : #GRSlimeParseTreeLintRule,
	#category : 'Seaside-Slime'
}

{ #category : #testing }
WAFixCallbackTempsMissingRule class >> isVisible [
	"Hide the test in closure images."

	^ [ ] isKindOf: BlockContext
]

{ #category : #accessing }
WAFixCallbackTempsMissingRule >> group [
	^ 'Seaside'
]

{ #category : #initialization }
WAFixCallbackTempsMissingRule >> initialize [
	super initialize.
	matcher := RBParseTreeSearcher new.
	matcher 
		matches: '[ | `@temps | `@.statements ]'
		do: [ :node :answer | 
			| found |
			found := false.
			(answer isNil and: [ node parent isMessage ]) ifTrue: [
				((self selectors includes: node parent selector) 
					or: [ (WASlime brushSelectors includes: node parent selector)
					or: [ (WASlime attributeSelectors includes: node parent selector)
					or: [ (WASlime callbackSelectors includes: node parent selector) ] ] ]) ifFalse: [
						| dangerousNames |
						dangerousNames := Set new.
						node parent parents do: [ :parent | 
							parent isBlock ifTrue: [ dangerousNames addAll: parent argumentNames ].
							parent isSequence ifTrue: [ dangerousNames addAll: parent temporaryNames ] ].
							(dangerousNames anySatisfy: [ :each | node references: each ]) 
								ifTrue: [ found := true ] ] ].
			found ifTrue: [ node ] ifFalse: [ answer ] ]
]

{ #category : #accessing }
WAFixCallbackTempsMissingRule >> name [
	^ '#fixCallbackTemps possibly missing'
]

{ #category : #accessing }
WAFixCallbackTempsMissingRule >> rationale [
	^ 'I don''t feel like explaining that here.'
]

{ #category : #private }
WAFixCallbackTempsMissingRule >> selectors [
	^ #( allSatisfy: anySatisfy: at:ifAbsent: at:ifAbsentPut: at:ifPresent: count: critical: detect:ifNone: do: do:separatedBy: ensure: fixCallbackTemps fixTemps ifCurtailed: inject:into: noneSatisfy: on:do: reject: render: select: should: should:description: should:raise: should:raise:description: should:raise:whoseDescriptionDoesNotInclude:description: should:raise:whoseDescriptionIncludes:description: shouldnt: shouldnt:description: shouldnt:raise: shouldnt:raise:description: shouldnt:raise:whoseDescriptionDoesNotInclude:description: shouldnt:raise:whoseDescriptionIncludes:description: timesRepeat: use:during: with: )
]

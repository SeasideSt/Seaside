Class {
	#name : #WAWithHasToBeLastMessageInCascadeRule,
	#superclass : #GRSlimeParseTreeLintRule,
	#category : 'Seaside-Pharo-Slime'
}

{ #category : #running }
WAWithHasToBeLastMessageInCascadeRule >> checkMethod: aContext [
	aContext isRenderingMethod 
		ifTrue: [ super checkMethod: aContext ]
]

{ #category : #accessing }
WAWithHasToBeLastMessageInCascadeRule >> group [
	^ 'Seaside'
]

{ #category : #initialization }
WAWithHasToBeLastMessageInCascadeRule >> initialize [
	super initialize.
	self matcher
		matches: '`html `msg with: ``@arg'
		do: [ :node :answer | 
			(answer isNil 
				and: [ (node parent isCascade)
				and: [ (node parent messages last ~= node) 
				and: [ (WASlime isBrushSelector: node receiver selector) ] ] ]) 
					ifTrue: [ node ]
					ifFalse: [ answer ] ]
]

{ #category : #accessing }
WAWithHasToBeLastMessageInCascadeRule >> name [
	^ '#with: has to be last message in cascade'
]

{ #category : #accessing }
WAWithHasToBeLastMessageInCascadeRule >> rationale [
	^ 'Sending #with: triggers serialization of the brush attributes, any attribute being specified afterwards has no effect.'
]

Class {
	#name : 'WAWithHasToBeLastMessageInCascadeRule',
	#superclass : 'GRReSlimeParseTreeLintRule',
	#category : 'Seaside-Pharo110-Slime',
	#package : 'Seaside-Pharo110-Slime'
}

{ #category : 'hooks' }
WAWithHasToBeLastMessageInCascadeRule >> afterCheck: aNode mappings: dict [

	^ aNode methodNode compiledMethod isRenderingMethod and: [
		  aNode parent isCascade and: [
			  aNode parent messages last ~= aNode and: [
				  WASlime isBrushSelector: aNode receiver selector ] ] ]
]

{ #category : 'accessing' }
WAWithHasToBeLastMessageInCascadeRule >> group [

	^ 'Seaside'
]

{ #category : 'initialization' }
WAWithHasToBeLastMessageInCascadeRule >> initialize [

	super initialize.
	self
		matches: '`html `msg with: ``@arg'
]

{ #category : 'accessing' }
WAWithHasToBeLastMessageInCascadeRule >> name [

	^ '#with: has to be last message in cascade'
]

{ #category : 'accessing' }
WAWithHasToBeLastMessageInCascadeRule >> rationale [

	^ 'Sending #with: triggers serialization of the brush attributes, any attribute being specified afterwards has no effect.'
]

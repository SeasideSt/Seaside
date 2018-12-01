Class {
	#name : #WADoNotCombineMultiplePrimaryAjaxCallbacks,
	#superclass : #GRSlimeParseTreeLintRule,
	#category : 'Seaside-Slime'
}

{ #category : #accessing }
WADoNotCombineMultiplePrimaryAjaxCallbacks >> group [
	^ 'Seaside'
]

{ #category : #initialization }
WADoNotCombineMultiplePrimaryAjaxCallbacks >> initialize [
	super initialize.
	self matcher 
		matchesAnyOf:#(
			'``html jQuery ajax callback: ``@block;script:``@block2'
			'``html jQuery ajax script: ``@block;callback:``@block2'
			'``html jQuery ajax callback: ``@block;callback:``@block2'
			'``html jQuery ajax callback: ``@block;html:``@block2'
			'``html jQuery ajax html: ``@block;callback:``@block2')
		do: [ :node :answer | 
			answer notNil ]
]

{ #category : #accessing }
WADoNotCombineMultiplePrimaryAjaxCallbacks >> name [
	^ 'Multiple primary Ajax callbacks'
]

{ #category : #accessing }
WADoNotCombineMultiplePrimaryAjaxCallbacks >> rationale [
	^ 'Multiple primary callback blocks attached to a single ajax request override each other. You can only combine multiple secondary callbacks with a single primary callback.'
]

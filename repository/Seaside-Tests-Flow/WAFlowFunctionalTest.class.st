Class {
	#name : #WAFlowFunctionalTest,
	#superclass : #WAFunctionalTest,
	#category : 'Seaside-Tests-Flow-Functional'
}

{ #category : #actions }
WAFlowFunctionalTest >> goAnchors [
	
	1 to: 5 do: [ :each | 
		| component |
		component := WAComponent new.
		component addMessage: [ :html | 
			html anchor
				callback: [ component answer ];
				with: each greaseString, ': ', self stackDepth greaseString ] fixCallbackTemps.
		self call: component ]
]

{ #category : #actions }
WAFlowFunctionalTest >> goButtons [
	1 to: 5 do: [ :each |
		self inform: each greaseString, ': ', self stackDepth greaseString ]
]

{ #category : #rendering }
WAFlowFunctionalTest >> renderContentOn: html [
	html paragraph: 'The following two anchors should trigger flows with 5 steps each. The stack should neither grow nor shrink (in GemStone the stack for go buttons will grow and that is expected behavior). Backtracking and spawning of windows should properly work.'.
	html paragraph: [
		html anchor
			callback: [ self goAnchors ];
			with: 'go anchors'.
		html break.
		html anchor
			callback: [ self goButtons ];
			with: 'go buttons' ]
]

{ #category : #private }
WAFlowFunctionalTest >> stackDepth [
	^ GRPlatform current stackDepth
]

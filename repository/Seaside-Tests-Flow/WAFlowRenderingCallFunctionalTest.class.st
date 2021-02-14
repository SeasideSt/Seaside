Class {
	#name : #WAFlowRenderingCallFunctionalTest,
	#superclass : #WAFunctionalTest,
	#category : 'Seaside-Tests-Flow-Functional'
}

{ #category : #rendering }
WAFlowRenderingCallFunctionalTest >> renderContentOn: html [
	html paragraph: [
		html anchor
			callback: [ self call: WACallDuringRenderTestComponent new ];
			with: 'This link'.
		html text: ' will call a Component which attempts to do a #call: in its #renderContentOn: method. This is not allowed and should trigger a descriptive error. With WAWalkbackErrorHandler enabled, the output should explain to the user the likely cause of the problem.' ]
]

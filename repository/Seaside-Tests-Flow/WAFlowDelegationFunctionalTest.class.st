Class {
	#name : #WAFlowDelegationFunctionalTest,
	#superclass : #WADelegationFunctionalTest,
	#category : 'Seaside-Tests-Flow-Functional'
}

{ #category : #initialization }
WAFlowDelegationFunctionalTest >> initialize [
	super initialize.
	task := WAFlowDelegationTask new
]

{ #category : #rendering }
WAFlowDelegationFunctionalTest >> renderContentOn: html [
	html paragraph: 'This test is just like WADelegationFunctionalTest, but it uses Flow/Continuations.'.
	super renderContentOn: html
]

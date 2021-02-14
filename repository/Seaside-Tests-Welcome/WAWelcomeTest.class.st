Class {
	#name : #WAWelcomeTest,
	#superclass : #TestCase,
	#category : 'Seaside-Tests-Welcome'
}

{ #category : #private }
WAWelcomeTest >> cleanEnvironment [
	WAAdmin unregister: 'WAWelcomeTestTemp'.
	Smalltalk globals at: #WAWelcomeTestTemp ifPresent: [ :testClass | testClass removeFromSystem ]
]

{ #category : #running }
WAWelcomeTest >> setUp [
	self cleanEnvironment
]

{ #category : #running }
WAWelcomeTest >> tearDown [
	self cleanEnvironment 
]

{ #category : #tests }
WAWelcomeTest >> testComponentCreation [
	| creator |
	creator := WAWelcomeComponentCreator new.
	creator createComponent: #WAWelcomeTestTemp.
	self assert: (Smalltalk globals includesKey: #WAWelcomeTestTemp)
	
]

{ #category : #tests }
WAWelcomeTest >> testImplementedIsAuthorNameSet [
	self shouldnt: [ GRPlatform current seasideIsAuthorNameSet ] raise: Error 
	
	
]

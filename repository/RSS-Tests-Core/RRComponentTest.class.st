Class {
	#name : 'RRComponentTest',
	#superclass : 'WAContextTest',
	#category : 'RSS-Tests-Core',
	#package : 'RSS-Tests-Core'
}

{ #category : 'tests' }
RRComponentTest >> testCanBeRoot [
	self deny: RRComponent canBeRoot.
	self assert: RRTestComponent canBeRoot
]

"
Description
--------------------

I am an action to clear seaside sessions.
"
Class {
	#name : 'WAClearSessionsCommand',
	#superclass : 'WAControlPanelCommand',
	#category : 'Seaside-Pharo100-Tools-Spec2',
	#package : 'Seaside-Pharo100-Tools-Spec2'
}

{ #category : 'converting' }
WAClearSessionsCommand >> asSpecCommand [
	^ super asSpecCommand
		iconName: #remove;
		yourself
]

{ #category : 'hooks' }
WAClearSessionsCommand >> execute [
	WAAdmin clearSessions
]

{ #category : 'initialization' }
WAClearSessionsCommand >> initialize [
	super initialize.
	self
		name: 'Clear sessions';
		description: 'Clear all the sessions.'
]

"
Description
--------------------

I am an action to remove the selected adaptor in Seaside.
"
Class {
	#name : #WARemoveAdaptorCommand,
	#superclass : #WAControlPanelCommand,
	#category : 'Seaside-Pharo-Tools-Spec2'
}

{ #category : #converting }
WARemoveAdaptorCommand >> asSpecCommand [
	^ super asSpecCommand
		iconName: #delete;
		yourself
]

{ #category : #hooks }
WARemoveAdaptorCommand >> canBeRun [
	^ self hasAdaptor
]

{ #category : #hooks }
WARemoveAdaptorCommand >> execute [
	self adaptor isStopped ifTrue: [ self adaptor unregister ].
	self context updateAdaptorsTable
]

{ #category : #initialization }
WARemoveAdaptorCommand >> initialize [
	super initialize.
	self
		name: 'Remove adaptor';
		description: 'Remove the currently selected seaside adaptor'
]

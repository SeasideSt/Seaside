"
Description
--------------------

I am an action to stop the currently selected adaptor.
"
Class {
	#name : 'WAStopAdaptorCommand',
	#superclass : 'WAControlPanelCommand',
	#category : 'Seaside-Pharo100-Tools-Spec2',
	#package : 'Seaside-Pharo100-Tools-Spec2'
}

{ #category : 'converting' }
WAStopAdaptorCommand >> asSpecCommand [
	^ super asSpecCommand
		iconName: #smallQuit;
		yourself
]

{ #category : 'hooks' }
WAStopAdaptorCommand >> execute [
	self adaptor ifNotNil: [ :adaptor | adaptor stop ].
	self context updateAdaptorsTable
]

{ #category : 'initialization' }
WAStopAdaptorCommand >> initialize [
	super initialize.
	self
		name: 'Stop';
		description: 'Stop the selected adaptor'
]

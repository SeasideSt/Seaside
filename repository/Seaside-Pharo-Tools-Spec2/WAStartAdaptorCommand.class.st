"
Description
--------------------

I am an action to start the currently selected adaptor.
"
Class {
	#name : 'WAStartAdaptorCommand',
	#superclass : 'WAControlPanelCommand',
	#category : 'Seaside-Pharo-Tools-Spec2',
	#package : 'Seaside-Pharo-Tools-Spec2'
}

{ #category : 'converting' }
WAStartAdaptorCommand >> asSpecCommand [
	^ super asSpecCommand
		iconName: #smallDoIt;
		yourself
]

{ #category : 'hooks' }
WAStartAdaptorCommand >> execute [
	self adaptor ifNotNil: [ :adaptor | adaptor start ].
	self context updateAdaptorsTable
]

{ #category : 'initialization' }
WAStartAdaptorCommand >> initialize [
	super initialize.
	self
		name: 'Start';
		description: 'Start the selected adaptor'
]

"
Description
--------------------

I am an action to inspect the currently selected adaptor.
"
Class {
	#name : 'WAInspectAdaptorCommand',
	#superclass : 'WAControlPanelCommand',
	#category : 'Seaside-Pharo-Tools-Spec2',
	#package : 'Seaside-Pharo-Tools-Spec2'
}

{ #category : 'converting' }
WAInspectAdaptorCommand >> asSpecCommand [
	^ super asSpecCommand
		iconName: #smallInspectIt;
		yourself
]

{ #category : 'hooks' }
WAInspectAdaptorCommand >> execute [
	self adaptor ifNotNil: #inspect
]

{ #category : 'initialization' }
WAInspectAdaptorCommand >> initialize [
	super initialize.
	self
		name: 'Inspect';
		description: 'Inspect the currently selected adaptor.'
]

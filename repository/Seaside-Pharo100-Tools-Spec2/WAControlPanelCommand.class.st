"
Description
--------------------

I am an abstract class to manage commands of the controle panel of Seaside.

My context is a WAPharoControlPanel.
"
Class {
	#name : 'WAControlPanelCommand',
	#superclass : 'CmCommand',
	#category : 'Seaside-Pharo100-Tools-Spec2',
	#package : 'Seaside-Pharo100-Tools-Spec2'
}

{ #category : 'testing' }
WAControlPanelCommand class >> isAbstract [
	^ self = WAControlPanelCommand
]

{ #category : 'accessing' }
WAControlPanelCommand >> adaptor [
	^ self context selectedAdaptor
]

{ #category : 'hooks' }
WAControlPanelCommand >> hasAdaptor [
	^ self adaptor isNotNil
]

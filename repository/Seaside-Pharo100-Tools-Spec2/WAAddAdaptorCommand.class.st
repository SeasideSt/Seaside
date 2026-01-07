"
Description
--------------------

I am an action to register a new adaptor in Seaside.
"
Class {
	#name : 'WAAddAdaptorCommand',
	#superclass : 'WAControlPanelCommand',
	#category : 'Seaside-Pharo100-Tools-Spec2',
	#package : 'Seaside-Pharo100-Tools-Spec2'
}

{ #category : 'accessing' }
WAAddAdaptorCommand >> adaptorClasses [
	^ (WAServerAdaptor allSubclasses reject: #isAbstract) sorted: #name ascending
]

{ #category : 'converting' }
WAAddAdaptorCommand >> asSpecCommand [
	^ super asSpecCommand
		iconName: #add;
		yourself
]

{ #category : 'hooks' }
WAAddAdaptorCommand >> execute [
	| allAdaptors |
	allAdaptors := self adaptorClasses.
	(UIManager default
		chooseFrom: (allAdaptors collect: #name)
		values: allAdaptors
		lines: #()
		title: 'Add Seaside Adaptor' translated)
		ifNotNil: [ :class | 
			(UIManager default request: 'Enter a port number' initialAnswer: class basicNew defaultPort greaseString)
				ifNotNil: [ :port | 
					(port isEmpty or: [ port isAllDigits not ])
						ifFalse: [ class port: port greaseInteger.
							context updateAdaptorsTable ] ] ]
]

{ #category : 'initialization' }
WAAddAdaptorCommand >> initialize [
	super initialize.
	self
		name: 'Add adaptor';
		description: 'Allows one to create a new adaptor.'
]

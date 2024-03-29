"
Description
--------------------

I am an action to clear the caches of seaside configurations.
"
Class {
	#name : 'WAClearConfigurationCachesCommand',
	#superclass : 'WAControlPanelCommand',
	#category : 'Seaside-Pharo100-Tools-Spec2',
	#package : 'Seaside-Pharo100-Tools-Spec2'
}

{ #category : 'converting' }
WAClearConfigurationCachesCommand >> asSpecCommand [
	^ super asSpecCommand
		iconName: #remove;
		yourself
]

{ #category : 'hooks' }
WAClearConfigurationCachesCommand >> execute [
	WAAdmin clearConfigurationCaches
]

{ #category : 'initialization' }
WAClearConfigurationCachesCommand >> initialize [
	super initialize.
	self
		name: 'Clear configuration caches';
		description: 'Cleat all the caches of the configuration.'
]

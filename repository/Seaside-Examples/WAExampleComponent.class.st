"
Superclass for example components
"
Class {
	#name : 'WAExampleComponent',
	#superclass : 'WAComponent',
	#category : 'Seaside-Examples-Misc',
	#package : 'Seaside-Examples',
	#tag : 'Misc'
}

{ #category : 'testing' }
WAExampleComponent class >> canBeRoot [
	^ true
]

{ #category : 'testing' }
WAExampleComponent class >> isAbstract [ 

	^ self == WAExampleComponent
]

{ #category : 'rendering' }
WAExampleComponent >> rendererClass [
	^ WAHtmlCanvas
]

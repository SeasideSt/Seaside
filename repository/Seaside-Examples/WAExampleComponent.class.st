Class {
	#name : #WAExampleComponent,
	#superclass : #WAComponent,
	#category : 'Seaside-Examples-Misc'
}

{ #category : #testing }
WAExampleComponent class >> canBeRoot [
	^ true
]

{ #category : #rendering }
WAExampleComponent >> rendererClass [
	^ WAHtmlCanvas
]

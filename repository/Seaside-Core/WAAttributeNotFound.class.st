Class {
	#name : #WAAttributeNotFound,
	#superclass : #WAConfigurationError,
	#instVars : [
		'key'
	],
	#category : 'Seaside-Core-Configuration'
}

{ #category : #signaling }
WAAttributeNotFound class >> signalWithKey: aSymbol [
	^ self new
		initializeWithKey: aSymbol;
		signal
]

{ #category : #initialization }
WAAttributeNotFound >> initializeWithKey: aSymbol [
	key := aSymbol
]

{ #category : #accessing }
WAAttributeNotFound >> key [
	^ key
]

{ #category : #accessing }
WAAttributeNotFound >> seasidePossibleCauses [
	^ #(
		'you need to clear your configuration caches to see new attributes (try "WAAdmin clearConfigurationCaches" in a workspace)'
		'you have not included a necessary ancestor in a configuration'
	)
]

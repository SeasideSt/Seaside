Class {
	#name : #CTStreamingServerRequired,
	#superclass : #WAError,
	#category : 'Comet-Core'
}

{ #category : #accessing }
CTStreamingServerRequired >> seasidePossibleCauses [
	^ #(
		'The ServerAdaptor handling this request does not support the streaming of HTTP responses, which is required when using Comet. On Squeak/Pharo, you can use WAListenerAdaptor in the Seaside-Adaptors-Comanche package.'
		)
]

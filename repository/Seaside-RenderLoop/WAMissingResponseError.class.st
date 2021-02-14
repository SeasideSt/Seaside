"
I signal a missing response - can be caused by an attempt to use #call: or a similar method while rendering.
"
Class {
	#name : #WAMissingResponseError,
	#superclass : #WAError,
	#category : 'Seaside-RenderLoop'
}

{ #category : #accessing }
WAMissingResponseError >> seasidePossibleCauses [
	^ #(
		'A Component attempted to use #call: or a similar method while rendering. Calling and answering can only be done in a callback.'
	)
]

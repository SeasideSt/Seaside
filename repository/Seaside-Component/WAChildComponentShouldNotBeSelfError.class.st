Class {
	#name : #WAChildComponentShouldNotBeSelfError,
	#superclass : #WAError,
	#category : 'Seaside-Component-Exceptions'
}

{ #category : #accessing }
WAChildComponentShouldNotBeSelfError >> seasidePossibleCauses [
	^ #(
		'you included self in the return value of #children'
		'You''re probably missing a return (^) somewhere.'
	)
]

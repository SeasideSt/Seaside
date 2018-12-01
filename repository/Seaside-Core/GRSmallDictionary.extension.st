Extension { #name : #GRSmallDictionary }

{ #category : #'*seaside-core' }
GRSmallDictionary >> seasideRequestFields [
	^ WARequestFields withAll: self
]

Extension { #name : #GRSmallDictionary }

{ #category : #'*Seaside-Core' }
GRSmallDictionary >> seasideRequestFields [
	^ WARequestFields withAll: self
]

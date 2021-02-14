Extension { #name : #GRSmallDictionary2 }

{ #category : #'*Seaside-Core' }
GRSmallDictionary2 >> seasideRequestFields [
	^ WARequestFields withAll: self
]

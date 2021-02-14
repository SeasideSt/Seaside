Extension { #name : #Dictionary }

{ #category : #'*Seaside-Core' }
Dictionary >> seasideRequestFields [
	^ WARequestFields withAll: self
]

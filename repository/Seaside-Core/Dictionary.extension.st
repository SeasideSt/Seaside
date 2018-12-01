Extension { #name : #Dictionary }

{ #category : #'*seaside-core' }
Dictionary >> seasideRequestFields [
	^ WARequestFields withAll: self
]

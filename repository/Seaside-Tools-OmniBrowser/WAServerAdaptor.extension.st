Extension { #name : #WAServerAdaptor }

{ #category : #'*seaside-tools-omnibrowser' }
WAServerAdaptor >> asNode [
	^ WAServerAdaptorNode on: self
]

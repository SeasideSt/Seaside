Extension { #name : #SmallDouble }

{ #category : #'*seaside-gemstone-json-core' }
SmallDouble >> jsonOn: aRenderer [
  self - self = 0.0
    ifTrue: [ aRenderer binaryFloat: self ]
    ifFalse: [ aRenderer null ]
]

Extension { #name : #WAJsonCanvas }

{ #category : #'*seaside-gemstone-json-core' }
WAJsonCanvas >> binaryFloat: aBinaryFloat [
  aBinaryFloat printOn: self document stream base: 10
]

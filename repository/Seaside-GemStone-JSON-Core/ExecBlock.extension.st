Extension { #name : #ExecBlock }

{ #category : #'*seaside-gemstone-json-core' }
ExecBlock >> jsonOn: aRenderer [
  self numArgs = 0
    ifTrue: [ self value ]
    ifFalse: [ self value: aRenderer ]
]

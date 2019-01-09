*seaside-gemstone-json-core
jsonOn: aRenderer
  self numArgs = 0
    ifTrue: [ self value ]
    ifFalse: [ self value: aRenderer ]
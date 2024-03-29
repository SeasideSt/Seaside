Extension { #name : 'CharacterCollection' }

{ #category : '*seaside-gemstone-json-core' }
CharacterCollection >> jsonKeyOn: aRenderer [
  self jsonOn: aRenderer
]

{ #category : '*seaside-gemstone-json-core' }
CharacterCollection >> jsonOn: aRenderer [
  aRenderer string: self
]

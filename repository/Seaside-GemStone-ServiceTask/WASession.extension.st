Extension { #name : #WASession }

{ #category : #'*seaside-GemStone-ServiceTask' }
WASession >> codec [
  ^ self requestContext codec
]

{ #category : #'*seaside-GemStone-ServiceTask' }
WASession >> session [
  ^ self
]

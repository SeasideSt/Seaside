Extension { #name : #BlockClosure }

{ #category : #'*seaside-gemstone-servicetask' }
BlockClosure >> serverBackgroundTask [
	^ WAGemStoneServerBackgroundTask value: self
]

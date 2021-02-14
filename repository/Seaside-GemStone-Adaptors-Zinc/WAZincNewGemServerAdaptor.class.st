Class {
	#name : #WAZincNewGemServerAdaptor,
	#superclass : #WAGsZincAdaptor,
	#category : 'Seaside-GemStone-Adaptors-Zinc'
}

{ #category : #defaults }
WAZincNewGemServerAdaptor >> defaultZnServer [
  ^ ZnGemServerManagingMultiThreadedServer on: self port
]

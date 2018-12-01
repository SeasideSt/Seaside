Class {
	#name : #WAGemStoneMutexTest,
	#superclass : #WAMutexTest,
	#category : 'Seaside-Tests-GemStone-Core'
}

{ #category : #running }
WAGemStoneMutexTest >> setUp [
	super setUp.
	mutex := WAGemStoneMutex new
]

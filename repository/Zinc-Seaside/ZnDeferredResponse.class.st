"
I am a lazy ZnResponse that:

1. Does no work except to delegate to a smarter object; and
2. Doesn't even delegate until I'm told it's time to write something out on the stream.

See, I'm even lazy about being lazy. I can get away with this wanton slothfulness because of WAComboResponse's ability to handle everything (status line, headers, chunking).
"
Class {
	#name : #ZnDeferredResponse,
	#superclass : #ZnResponse,
	#instVars : [
		'onWrite'
	],
	#category : 'Zinc-Seaside'
}

{ #category : #'instance creation' }
ZnDeferredResponse class >> onWrite: aBlock [
	^self new onWrite: aBlock
]

{ #category : #'initialize-release' }
ZnDeferredResponse >> onWrite: aBlock [
	onWrite := aBlock
]

{ #category : #writing }
ZnDeferredResponse >> writeOn: stream [
	onWrite value: stream
]

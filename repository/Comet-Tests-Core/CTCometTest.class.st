Class {
	#name : #CTCometTest,
	#superclass : #JSObjectTest,
	#category : 'Comet-Tests-Core'
}

{ #category : #accessing }
CTCometTest class >> packageNamesUnderTest [
	^ #('Comet-Core')
]

{ #category : #accessing }
CTCometTest >> comet [
	^ CTComet context: self renderContext
]

{ #category : #tests }
CTCometTest >> testConnect [
	self
		assert: (self comet url: 'http://www.pusher.com/'; connect)
		equals: 'new Comet("http://www.pusher.com/").connect()'
]

{ #category : #tests }
CTCometTest >> testDisconnect [
	self
		assert: (self comet url: 'http://www.pusher.com/'; disconnect)
		equals: 'new Comet("http://www.pusher.com/").disconnect()'
]

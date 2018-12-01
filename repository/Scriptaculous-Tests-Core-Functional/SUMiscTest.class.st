Class {
	#name : #SUMiscTest,
	#superclass : #JSObjectTest,
	#category : 'Scriptaculous-Tests-Core-Unit'
}

{ #category : #accessing }
SUMiscTest >> sound [
	^ SUSound context: self renderContext
]

{ #category : #tests }
SUMiscTest >> testSound [
	self
		assert: (self sound play: 'blah.mp3')
		equals: 'Sound.play("blah.mp3")'.
	self
		assert: (self sound play: 'blah.mp3'; replace: true)
		equals: 'Sound.play("blah.mp3",{"replace":true})'.
	self
		assert: (self sound play: 'blah.mp3'; track: 'mytrack')
		equals: 'Sound.play("blah.mp3",{"track":"mytrack"})'
]

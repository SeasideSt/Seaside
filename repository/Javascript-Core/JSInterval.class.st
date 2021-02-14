"
I periodically execute the decorated object.
"
Class {
	#name : #JSInterval,
	#superclass : #JSTimed,
	#category : 'Javascript-Core-Decorations'
}

{ #category : #printing }
JSInterval >> javascriptContentOn: aStream [
	aStream nextPutAll: 'setInterval(function(){'.
	super javascriptContentOn: aStream.
	aStream
		nextPutAll: '},';
		javascript: self duration;
		nextPut: $)
]

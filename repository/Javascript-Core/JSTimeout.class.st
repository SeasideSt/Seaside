"
I evaluate the decorated object after a timeout.
"
Class {
	#name : #JSTimeout,
	#superclass : #JSTimed,
	#category : 'Javascript-Core-Decorations'
}

{ #category : #printing }
JSTimeout >> javascriptContentOn: aStream [
	aStream nextPutAll: 'setTimeout(function(){'.
	super javascriptContentOn: aStream.
	aStream
		nextPutAll: '},';
		javascript: self duration;
		nextPut: $)
]

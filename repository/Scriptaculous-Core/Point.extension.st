Extension { #name : 'Point' }

{ #category : '*Scriptaculous-Core' }
Point >> javascriptOn: aRenderer [
	aRenderer array: [ 
		aRenderer value: self x.
		aRenderer value: self y]
]

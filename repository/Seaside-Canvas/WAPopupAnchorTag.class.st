"
I am used to create a link that opens in a new window. A name can be specified using #name: and many features can be configured. Note, that not all features are supported on all web browser platforms. If Javascript is disabled the link will behave like any other anchor.

Most of the time a popup-anchor is created like this:

	html popupAnchor
		callback: [ self session presenter
			show: WACounter new ];
		with: 'Open the counter within a new window'

This code creates a new render-loop and displays a new instance of WACounter within the new browser window.		

"
Class {
	#name : #WAPopupAnchorTag,
	#superclass : #WAAnchorTag,
	#instVars : [
		'windowTitle',
		'features'
	],
	#category : 'Seaside-Canvas-Tags'
}

{ #category : #features }
WAPopupAnchorTag >> dependent: aBoolean [
	"Specifies whether the new window is closed as well when the parent window gets closed."

	features at: #dependent put: aBoolean
]

{ #category : #features }
WAPopupAnchorTag >> extent: aPoint [
	"Specifies the width and height of the new window."

	self width: aPoint x; height: aPoint y
]

{ #category : #private }
WAPopupAnchorTag >> featureString [
	^ String streamContents:  [ :stream | 
		features associations do: [ :association | 
				stream
					nextPutAll: association key;
					nextPut: $=.
				stream nextPutAll: (association value == true 
						ifTrue: [ 'yes' ]
						ifFalse: [
							association value == false 
								ifTrue: [ 'no' ]
								ifFalse: [ association value greaseString ] ]) ]
			separatedBy: [ stream nextPut: $, ] ]
]

{ #category : #features }
WAPopupAnchorTag >> height: anInteger [
	"Specifies the height of the new window."

	features at: #height put: anInteger
]

{ #category : #initialization }
WAPopupAnchorTag >> initialize [
	super initialize.
	windowTitle := '_blank'.
	features := GRSmallDictionary2 new
]

{ #category : #features }
WAPopupAnchorTag >> left: anInteger [
	"Specifies the x coordinate of the top left corner of the new window. "

	features at: #left put: anInteger
]

{ #category : #features }
WAPopupAnchorTag >> location: aBoolean [
	"Specifies whether to display the address line in the new window."

	features at: #location put: aBoolean
]

{ #category : #features }
WAPopupAnchorTag >> menubar: aBoolean [
	"Specifies whether to display the browser menu bar."

	features at: #menubar put: aBoolean
]

{ #category : #features }
WAPopupAnchorTag >> position: aPoint [
	"Specifies the x and y coordinates of the top left corner of the new window."

	self left: aPoint x; top: aPoint y
]

{ #category : #features }
WAPopupAnchorTag >> resizable: aBoolean [
	"Specifies whether the new window is resizable."

	features at: #resizable put: aBoolean
]

{ #category : #features }
WAPopupAnchorTag >> scrollbars: aBoolean [
	"Specifies whether the new window should have scrollbars."

	features at: #scrollbars put: aBoolean
]

{ #category : #features }
WAPopupAnchorTag >> status: aBoolean [
	"Specifies whether to display the browser status bar."

	features at: #status put: aBoolean
]

{ #category : #features }
WAPopupAnchorTag >> toolbar: aBoolean [
	"Specifies whether to display the toolbar in the new window."

	features at: #toolbar put: aBoolean
]

{ #category : #features }
WAPopupAnchorTag >> top: anInteger [
	"Specifies the y coordinate of the top left corner of the new window. "

	features at: #top put: anInteger
]

{ #category : #features }
WAPopupAnchorTag >> width: anInteger [
	"Specifies the width of the new window."

	features at: #width put: anInteger
]

{ #category : #accessing }
WAPopupAnchorTag >> windowTitle [
	^ windowTitle
]

{ #category : #accessing }
WAPopupAnchorTag >> windowTitle: aString [
	"String specifying the name of the new window. If a window with this name already exists, then the new content will be displayed in that existing window, rather than creating a new one."

	windowTitle := aString
]

{ #category : #public }
WAPopupAnchorTag >> with: aBlock [
	self onClick: 'window.open(this.href,' , self windowTitle printString , ',' , self featureString printString , ');return false'.
	super with: aBlock
]

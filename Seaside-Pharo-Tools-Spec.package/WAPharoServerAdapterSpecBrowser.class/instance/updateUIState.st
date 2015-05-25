private
updateUIState

	self disableAllButtons.
	
	"Update the list -- need to separately send the icon changed message or it does not get refreshed..."
	listModel updateList.
	listModel changed: #iconForItem:at:.
	
	adaptor isNil
			ifTrue: [
				textModel text: ''.
				textModel behavior: nil ]
	             ifFalse: [ 
				adaptor canStart
					ifTrue: [ self enableStartButton ].
				adaptor canStop
					ifTrue: [ self enableStopButton	 ].
				self enableBrowseButton.
				textModel text: (String streamContents: [ :stream |
			stream 
				nextPutAll: 'Type: '; nextPutAll: adaptor class name; nextPut: Character cr;
				nextPutAll: 'Port: '; nextPutAll: adaptor port greaseString; nextPut: Character cr;
				nextPutAll: 'Encoding: '; nextPutAll: adaptor codec name; nextPut: Character cr.
			adaptor additionalStatusOn: stream.
			stream
				nextPutAll: adaptor statusString ]) ]
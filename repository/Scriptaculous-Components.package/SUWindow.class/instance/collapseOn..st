scripting
collapseOn: script
	collapsed 
		ifFalse: [
			script prototype element
				id: self windowId;
				styleAt: 'height' put: self titleHeight greaseString , 'px'.
			script prototype element
				id: self containerId; hide ]
		ifTrue: [
			script prototype element
				id: self windowId;
				styleAt: 'height' put: extent y greaseString, 'px'.
			script prototype element
				id: self containerId;
				show ].
	collapsed := collapsed not

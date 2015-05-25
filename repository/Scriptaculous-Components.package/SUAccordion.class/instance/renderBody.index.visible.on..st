rendering
renderBody: anElement index: anInteger visible: aBoolean on: html
	(self isVisible: anElement)
		ifFalse: [ ^ self ].
	html definitionData
		id: (self uid: 'body' at: anInteger);
		style: (aBoolean ifFalse: [ 'display: none' ]);
		with: anElement
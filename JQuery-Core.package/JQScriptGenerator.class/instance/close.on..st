actions
close: aHtmlRoot on: aDocument
	self loadScripts isEmpty
		ifTrue: [ ^ self ].
	self 
		writeScriptTag: [ 
			aDocument nextPutAll: JQuery functionName; nextPutAll: '(function(){'.
			self writeLoadScriptsOn: aDocument.
			aDocument nextPutAll: '});' ]
		on: aDocument
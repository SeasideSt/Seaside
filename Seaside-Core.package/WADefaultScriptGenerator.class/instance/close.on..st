actions
close: aHtmlRoot on: aDocument
	self 
		writeScriptTag: [
			aDocument nextPutAll: 'function onLoad(){'.
			self writeLoadScriptsOn: aDocument.
			aDocument nextPutAll: '};' ]
		on: aDocument
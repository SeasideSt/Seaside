actions
closeOn: aDocument
	"This method is called to close the document that has no root."
	
	self loadScripts isEmpty 
		ifTrue: [ ^ self ].
	self 
		writeScriptTag: [ self writeLoadScriptsOn: aDocument ]
		on: aDocument
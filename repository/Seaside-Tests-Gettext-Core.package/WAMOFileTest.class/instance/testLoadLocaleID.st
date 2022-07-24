test
testLoadLocaleID
	
	| anMOFile |	
	self deny: file exists equals: true.
	file asFileReference binaryWriteStreamDo: [ :stream | stream nextPutAll: self class moFileBinaryForLocaleNLBE ].
	self deny: file exists equals: false.
	self deny: ((file binaryReadStream) contents size) equals: 0.
	
	anMOFile := WAMOFile new initializeFromFile: file localeString: 'nl'.
	self deny: anMOFile equals: nil.
	self assert: anMOFile translatedStrings size equals: 4.
	self assert: anMOFile translatedStrings allButFirst equals: #('Kies een locale hieronder' 'schriftgrootte' 'locale').
	self assert: anMOFile translations size equals: 4.
	self assert: anMOFile translations equals: ((Dictionary new) add: ('Select a locale below'->2); add: ('fontsize'->3); add: (''->1); add: ('locale'->4); yourself).
	
	
	
	
	
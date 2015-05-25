actions
setEncodingFor: anAdaptor
	| codec |
	codec := UIManager default
		chooseFrom: (self codecs collect: [ :each | each name]) 
		values: self codecs
		lines: #()
		title: 'Select encoding' translated.
	codec ifNotNil: [anAdaptor codec: codec].
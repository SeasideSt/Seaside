hooks
execute
	(UIManager default
		chooseFrom: (self codecs collect: [ :each | each name ])
		values: self codecs
		lines: #()
		title: 'Select encoding' translated) ifNotNil: [ :codec | self adaptor codec: codec ]
user interface
codecFromUserFor: anAdaptor
	| allCodecs default |
	allCodecs := self codecs.
	default := anAdaptor defaultCodec.
	
	^ UIManager default
		chooseFrom: ((allCodecs collect: [:e | e name]) copyWithFirst: (default name, ' (default) '))
		values: (allCodecs copyWithFirst: default)
		lines: #(1)
		title: 'Select Codec (optional)' translated.
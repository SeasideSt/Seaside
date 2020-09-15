hooks
execute
	| allAdaptors |
	allAdaptors := self adaptorClasses.
	(UIManager default
		chooseFrom: (allAdaptors collect: #name)
		values: allAdaptors
		lines: #()
		title: 'Add Seaside Adaptor' translated)
		ifNotNil: [ :class | 
			(UIManager default request: 'Enter a port number' initialAnswer: class basicNew defaultPort greaseString)
				ifNotNil: [ :port | 
					(port isEmpty or: [ port isAllDigits not ])
						ifFalse: [ class port: port greaseInteger.
							context updateAdaptorsTable ] ] ]
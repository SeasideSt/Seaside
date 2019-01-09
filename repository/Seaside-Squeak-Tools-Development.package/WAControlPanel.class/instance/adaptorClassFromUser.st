user interface
adaptorClassFromUser
	| allAdaptors |
	allAdaptors := self adaptorClasses.
	^ UIManager default
		chooseFrom: (allAdaptors collect: [:e | e name])
		values: allAdaptors
		lines: #()
		title: 'Add Seaside Adaptor' translated.
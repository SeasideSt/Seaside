printing
javascriptContentOn: aRenderer
	(aRenderer new: 'Comet')
		with: [
			aRenderer render: self url ]
printing
javascriptContentOn: aRenderer
	(aRenderer function: 'setInterval')
		with: [
			aRenderer argument: [
				aRenderer defineFunction: [
					super javascriptContentOn: aRenderer ] ].
			aRenderer argument: self duration ]
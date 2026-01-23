printing
javascriptContentOn: aRenderer
	(aRenderer function: 'setTimeout')
		with: [
			aRenderer argument: [
				aRenderer defineFunction: [
					super javascriptContentOn: aRenderer ] ].
			aRenderer argument: self duration ]
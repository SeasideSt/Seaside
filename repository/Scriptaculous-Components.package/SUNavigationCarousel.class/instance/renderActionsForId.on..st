rendering
renderActionsForId: id on: html
	html table style: 'width:100%;margin-top:10px'; with: [
		html tableRow: [
			html tableData class: 'action'; with: [
				html anchor onClick: ((html prototype evaluator)
								callback: [ :script | self scriptMove: 1 for: id on: script ]; return: false);
								with: 'Previous' ].
				html tableData style: 'width:100%'; with: [ html space ].
				html tableData class: 'action'; class: 'right'; with: [
					html anchor onClick: ((html prototype evaluator)
								callback: [ :script | self scriptMove: -1 for: id on: script ]; return: false);
								with: 'Next' ] ] ]
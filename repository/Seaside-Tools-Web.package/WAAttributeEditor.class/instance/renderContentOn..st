rendering
renderContentOn: html
	self
		renderGroup: [ self renderConfigurationOn: html ]
		named: (self labelForSelector: group)
		on: html
				
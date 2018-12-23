rendering
renderCogValuesOn: html
	self
		renderLabel: 'Cog VM - Size of eden (bytes)'
		value: (self vm parameterAt: 44)
		on: html

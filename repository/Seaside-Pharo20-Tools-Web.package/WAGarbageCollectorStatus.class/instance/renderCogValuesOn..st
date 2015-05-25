rendering
renderCogValuesOn: html
	self renderLabel: 'Cog VM - Size of eden (bytes)' value: (SmalltalkImage current vmParameterAt: 44) on: html.

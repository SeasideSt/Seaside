rendering-elements
renderRadioButtonsOn: html
	self
		renderLabel: 'Radiogroup'
		input: [
			html radioGroup
				callback: [ :value | radio := value ];
				selected: radio;
				with: [ :group |
					self elements do: [ :each |
						html label: [ 
							group radioButton value: each.
							html text: each ].
						html break ] ] ]
		output: radio printString
		on: html
rendering-elements
renderRadioButtonsCustomOn: html
	self
		renderLabel: 'Radiogroup (Custom)'
		input: [
			html radioGroup: [ :group |
					self elements do: [ :each |
						html label: [ 
							html radioButton
								group: group;
								selected: radioCustom = each;
								callback: [ radioCustom := each ].
							html text: each ].
						html break ] ] ]
		output: radioCustom printString
		on: html
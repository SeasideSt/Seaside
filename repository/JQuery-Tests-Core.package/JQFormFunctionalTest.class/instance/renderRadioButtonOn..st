rendering-elements
renderRadioButtonOn: html
	self
		renderLabel: 'Radio-Button'
		control: [ :id :script |
			html radioGroup
				callback: [ :value | radioButton := value ];
				selected: radioButton;
				with: [ :group |
				1 to: 3 do: [ :each |
					html label: [
						html radioButton
							group: group;
							value: each;
							onChange: (script html: [ :h | h render: radioButton ]).
						html text: each ].
					html break ] ] ]
		model: radioButton
		on: html
rendering-elements
renderCheckboxOn: html
	self
		renderLabel: 'Checkbox'
		input: [
			html label: [
				html checkbox
					value: checkbox;
					callback: [ :value | checkbox := value ].
				html text: 'Checked' ] ]
		output: checkbox printString
		on: html
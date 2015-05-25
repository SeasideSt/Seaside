rendering-elements
renderHiddenInputOn: html
	| string |
	string := hiddenInput ifNil: [ 'Seaside' ].
	self
		renderLabel: 'Hidden Input'
		input: [
			html render: string.			
			html hiddenInput
				value: string;
				callback: [ :value | hiddenInput := value ] ]
		output: hiddenInput printString
		on: html
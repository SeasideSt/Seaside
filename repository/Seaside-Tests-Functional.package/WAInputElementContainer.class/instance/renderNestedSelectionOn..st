rendering-elements
renderNestedSelectionOn: html
	| selectTag |
	self
		renderLabel: 'Nested Selection'
		input: [
			selectTag := html select.
			selectTag
				callback: [ :value | nestedSelection := value ];
				selected: nestedSelection;
				with: [
					self nestedElements do: [ :list |
						html optionGroup
							label: list first;
							with: [
								list second do: [ :each |
									html option
										value: each with: selectTag;
										with: each ] ] ] ] ]
		output: nestedSelection printString
		on: html
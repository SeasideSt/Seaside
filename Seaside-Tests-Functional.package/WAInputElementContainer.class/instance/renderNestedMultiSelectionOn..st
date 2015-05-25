rendering-elements
renderNestedMultiSelectionOn: html
	| selectTag |
	self
		renderLabel: 'Nested Multi Selection'
		input: [
			selectTag := html multiSelect.
			selectTag
				size: 6;
				callback: [ :value | nestedMultiSelection := value ];
				selected: nestedMultiSelection;
				with: [
					self nestedElements do: [ :list |
						html optionGroup
							label: list first;
							with: [
								list second do: [ :each |
									html option
										value: each with: selectTag ;
										with: each ] ] ] ] ]
		output: [ nestedMultiSelection isNil ifFalse: [ html unorderedList list: nestedMultiSelection ] ]
		on: html
rendering
renderMouseButtonOn: html
	html form: [
		html table: [
			html tableRow: [
				| group |
				html tableData: 'Button: '.
				group := html radioGroup.
				group
					callback: [ :value | button := value ];
					selected: button.
				#(red yellow blue) do: [ :each |
					html tableData
						style: 'background-color: ', each;
						with: [
							group radioButton value: each ] ].
				html tableData: [
					html submitButton text: 'Set' ] ] ] ]
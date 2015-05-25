private
renderListItem: anObject labelled: aString
	canvas listItem
		class: 'option-selected' if: (self isSelected: anObject);
		with: [
			self hasCallback
				ifFalse: [ canvas render: aString ]
				ifTrue: [
					canvas anchor
						callback: [ self performCallback: anObject ];
						with: aString ] ]
rendering
renderFormOn: html

	html form: [
		html div: [
			html label: 'Filter: '.
			html select
				list: self labels;
				beOptional;
				optionalLabel: '-- Show All --';
				selected: filter;
				callback: [:value | filter := value];
				yourself.
			html submitButton: 'Update'.
		].
	].
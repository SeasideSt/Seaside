rendering
renderChooserOn: html
	html div class: 'chooser'; with: [
		html form: [
			html div: [
				html select
					selected: class;
					list: self allClasses;
					onChange: 'submit()';
					callback: [ :value | self class: value ] ] ].
		self allSelectors size > 1 ifTrue: [
			html form: [
				html div: [
					html select
						selected: selector;
						list: self allSelectors;
						onChange: 'submit()';
						callback: [ :value | self selector: value ] ] ] ] ]
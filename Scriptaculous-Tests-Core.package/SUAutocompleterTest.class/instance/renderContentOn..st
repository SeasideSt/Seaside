rendering
renderContentOn: html
	| textId |
	textId := html nextId.
	html paragraph: 'Start to type a Smalltalk class-name:'.
	html div: [
		html textInput
			id: textId;
			size: 30;
			value: text;
			callback: [ :value | text := value ].
		html div
			class: 'autocomplete';
			script: (html scriptaculous autocompleter
				element: textId;
				onSelected: (html scriptaculous request
					triggerFormElement: textId);
				on: #renderListOn:for: of: self) ]
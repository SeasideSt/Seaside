rendering
renderText: aString on: html
	| id |
	html fieldSet: [
		html label
			for: (id := html nextId);
			with: aString.
		html span: [
			html textInput
				id: id;
				value: aString;
				callback: [ :value | logger addLast: aString , ': ' , value greaseString ] ] ]
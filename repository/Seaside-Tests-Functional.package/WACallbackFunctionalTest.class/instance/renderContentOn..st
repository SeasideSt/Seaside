rendering
renderContentOn: html 
	html paragraph: 'Depending on the way the form is submitted the following actions should be triggered and logged:'.
	html orderedList list: #( 
		'Default: Text, Default'
		'Before: Text'
		'Before Submit: Text, Before Submit'
		'Before Cancel: Before Cancel'
		'After: Text'
		'After Submit: Text, After Submit'
		'After Cancel: After Cancel'
	).
	html form
		defaultAction: [ self append: 'Default' ] ;
		with: [
			html div: [
				"div for validation"
				html submitButton
					text: 'Before'.
				html submitButton
					callback:  [ self append: 'Before Submit' ];
					text: 'Before Submit'.
				html cancelButton
					callback:  [ self append: 'Before Cancel' ];
					text: 'Before Cancel'.
				html break.
				html textInput
					value: 'Some Text';
					callback: [ :value | self append: 'Text: ' , value ].
				html break.
				html submitButton
					text: 'After'.
				html submitButton
					callback:  [ self append: 'After Submit' ];
					text: 'After Submit'.
				html cancelButton
					callback:  [ self append: 'After Cancel' ];
					text: 'After Cancel' ] ].
	html preformatted: transcript contents.
	transcript reset
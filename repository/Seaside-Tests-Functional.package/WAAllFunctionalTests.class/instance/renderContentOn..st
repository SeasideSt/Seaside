rendering
renderContentOn: html
	html heading: self class description.
	html form: [
		html paragraph: [
			html anchor
				callback: [ self previous ];
				with: [ html html: '&larr;' ].
			html select
				list: classes;
				onChange: 'submit()';
				selected: self selected;
				labels: [ :value | value name ];
				callback: [ :value | self selected: value ].
			html anchor
				callback: [ self next ];
				with: [ html html: '&rarr;' ].
			html text: ' '; submitButton: 'Restart' ] ].
	html horizontalRule.
	html render: current contents
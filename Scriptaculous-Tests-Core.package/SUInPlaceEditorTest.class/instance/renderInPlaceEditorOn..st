rendering
renderInPlaceEditorOn: html
	html paragraph
		script: (html scriptaculous inPlaceEditor
			cancelControl: 'button';
			triggerInPlaceEditor: [ :value | text := value ];
			callback: [ :r | r render: text ]);
		with: text

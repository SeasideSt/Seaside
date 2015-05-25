rendering
renderInPlaceCollectionEditorOn: html
	html paragraph
		script: (html scriptaculous inPlaceCollectionEditor
			collection: list;
			cancelControl: 'button';
			triggerInPlaceEditor: [ :value | selected := value ];
			callback: [ :r | r render: selected ]);
		with: selected

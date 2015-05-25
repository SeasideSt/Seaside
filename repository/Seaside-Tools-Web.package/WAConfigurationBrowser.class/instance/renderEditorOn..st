rendering
renderEditorOn: html
	html heading
		class: 'selection-title';
		with: self selection class description, ': ', self selection hierarchyPathString.
		
	html render: editor
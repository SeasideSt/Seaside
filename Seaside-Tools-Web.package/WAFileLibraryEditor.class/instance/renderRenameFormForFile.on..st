rendering
renderRenameFormForFile: fileName on: html
	html tableData
		colSpan: 2;
		with: [
			html form: [
				html textInput
					value: fileName;
					callback: [ :value | newName := value ].
				html anchor
					onClick: 'return submitForm(this)';
					callback: [
						self library renameFile: fileName to: newName.
						renamingFile := nil ];
				 	with: 'Rename'.
				html space.
				html anchor
					onClick: 'return submitForm(this)';
					callback: [ renamingFile := nil ];
					with: 'Cancel' ] ]
rendering
renderFile: fileName on: html
	html tableData: [
		html anchor
			class: 'download';
			url: (self urlFor: fileName);
			with: fileName ].
	html tableData: [
		html anchor
			callback: [
				self confirm: 'Really remove ''', fileName, '''?' onAnswer: [ :answer |
					"use CPS to avoid continuation use for VAST"
					answer ifTrue: [
						self library removeFile: fileName ] ] ];
			with: 'Remove'.
		html space.
		html anchor
			callback: [ renamingFile := fileName ];
			with: 'Rename' ]
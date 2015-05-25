rendering
renderFilesOn: html
	html table: [
		self library filenames sorted do: [ :each |
			html tableRow: [
				renamingFile = each
					ifTrue: [ self renderRenameFormForFile: each on: html ]
					ifFalse: [ self renderFile: each on: html ] ] ] ]
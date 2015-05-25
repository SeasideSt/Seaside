rendering
renderAddFileOn: html
	html form multipart; with: [
	 	html div: [
			html text: 'Add file: '.
			html break.
			html fileUpload size: 40; on: #addFile of: self library.
			html space.
			html submitButton: 'Add' ] ]
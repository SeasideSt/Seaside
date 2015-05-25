rendering
renderFilesOn: html
	html unorderedList: [
		self library filenames
			do: [ :each |
				html listItem: [
					html anchor
						class: 'download';
						url: (self urlFor: each);
						with: each ] ] ]
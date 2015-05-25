rendering
renderFileContentsOn: html 
	file size <= 16r10000
		ifTrue: [ html preformatted: (file contentsDecodedUsing: 'ISO-8859-1') ]
		ifFalse: [
			html break.
			html text: 'file size is: ', file size greaseString, ' bytes' ]
rendering
renderAddFileOn: html
	| theFile theCodec allCodecs |
	allCodecs := GRCodec allCodecs.
	html form multipart; with: [
	 	html div: [
			html text: 'Add file: '.
			html fileUpload 
				size: 40; 
				callback:[ :file | theFile := file ].
			html space.
			html text: 'with encoding: '.
			html select 
				list: (allCodecs sorted: [ :a :b | a name <= b name ]);
				labels: [ :codec | codec name ];
				selected: (allCodecs detect: [ :codec | codec name = 'utf-8'] ifNone:[ nil ]);
				callback:[:codec | theCodec := codec ].
			html break.
			html submitButton
				value: 'Add';
				callback: [ self addFile: theFile withEncoding: theCodec ] ] ]
rendering
renderImagesOn: html
	html form: [
		html div: [
			html text: 'This one is clickable: '.
			html imageButton
				callback: [ self inform: 'ok' onAnswer: [ ] ];
				form: self haloDebugForm ] ].
		
	html paragraph: [
		html image
			form: self haloViewForm;
			altText: 'Halo-View'.
		html space.
		html image
			document: self haloPaintForm
			mimeType: 'image/png'
			fileName: 'Paint.png';
			altText: 'Halo-Paint' ]
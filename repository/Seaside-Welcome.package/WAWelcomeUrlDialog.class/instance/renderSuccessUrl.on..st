rendering
renderSuccessUrl: url on: html
	html paragraph: [ 
		html text: 'Success! '.
		html button
			bePush;
			onClick:
				((html jQuery ajax)
					callback: [ self serverUrl: url ];
					onComplete: html javascript refresh);
		with: 'Update Configuration' ]
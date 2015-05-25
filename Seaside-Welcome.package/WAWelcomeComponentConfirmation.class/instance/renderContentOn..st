rendering
renderContentOn: html
	html paragraph: [
		html text: 'You can see your component in action here: '.
		html anchor
			target: '_blank';
			url: '/', self componentName;
			with: '/', self componentName ].
		
	html paragraph: [
		html text: 'Now go find the class ';
			code: self componentName;
			text: ' in your Smalltalk image. First, try changing the displayed text by changing the ';
			code: '#renderContentOn:';
			text: ' method. Then you can experiment further based on what you''ve seen in the examples and what you read in the '.
		html anchor
				url: 'http://book.seaside.st/';
				with: 'documentation.' ].
		
	html paragraph: [
		html text: 'Want to '.
		html anchor
			callback: [ self answer ];
			with: 'create another component'.
		html text: '?' ]
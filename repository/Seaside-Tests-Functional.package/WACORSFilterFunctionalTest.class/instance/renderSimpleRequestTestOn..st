rendering-tests
renderSimpleRequestTestOn: html

	html heading
		level2;
		with: 'Make GET requests'.
	html div
		id: 'get-requests';
		with:[
			self originTextToUrlTable keysAndValuesDo: [ :text :url | 
				html button
					onClick:
						((JSStream on: ('fetch(<1p>)' expandMacrosWith: url asString))
					 		call: 'then'
					 		with: self successHandlerFunction
					 		with: self errorHandlerFunction);
				with: text.
			html space ] ]
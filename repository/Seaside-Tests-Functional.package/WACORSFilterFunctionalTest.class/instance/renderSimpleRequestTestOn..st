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
						((JSStream on: ('document.getElementById("result-contents").innerHTML = "Doing request..."; fetch(<1p>)' expandMacrosWith: url greaseString))
					 		call: 'then'
					 		with: self successHandlerFunction
					 		with: self errorHandlerFunction;
							call: 'catch'
							with: self catchHandlerFunction);
				with: text.
			html space ] ]
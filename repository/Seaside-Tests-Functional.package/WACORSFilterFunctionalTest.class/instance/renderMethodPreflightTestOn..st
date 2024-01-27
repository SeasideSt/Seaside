rendering-tests
renderMethodPreflightTestOn: html

	html heading
		level2;
		with: 'Make some DELETE requests'.
	html paragraph: 'These test will trigger an OPTIONS preflight request when crossing origins.'.
	html div
		id: 'delete-requests';
		with: [
			self originTextToUrlTable keysAndValuesDo: [ :text :url | 
				html button
					onClick: ((JSStream on:('fetch(<1p>, {method: "DELETE"})' expandMacrosWith: url asString))
					 		call: 'then'
					 		with: self successHandlerFunction
					 		with: self errorHandlerFunction;
							call: 'catch'
							with: self catchErrorHandlerFunction);
					with: text.
				html space ] ]
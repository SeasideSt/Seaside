rendering
renderContentOn: html
	html paragraph: 'CSS Selector:'.
	html form: [
		html paragraph: [
			html textInput
				id: 'selector';
				value: (selector ifNil: [ 'h1' ]);
				callback: [ :value | selector := value ].
			html submitButton
				onClick: (html prototype evaluator
					triggerFormElement: 'selector';
					on: #renderEvaluatorOn: of: self;
					return: false);
				text: 'highlight' ] ]
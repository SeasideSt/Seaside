rendering
renderHandlerConfigurationOn: html
	| attribute filter |
	filter := self exceptionFilter.
	filter ifNil: [
		html paragraph: 'Exception handler configuration attribute not found!'.
		^ self ].
	attribute := filter configuration attributeAt: #exceptionHandler.

	html form: [
		html div: [
			html select
				id: #handlerselect;
				beOptional;
				optionalLabel: '(inherited default)';
				list: attribute options asArray;
				selected: (filter configuration at: attribute key);
				callback: [ :value | 
					value
						ifNil: [ filter configuration removeExpressionAt: attribute key ifAbsent: [ ] ]
						ifNotNil: [ filter configuration takeValue: value forAttribute: attribute ] ].
			html submitButton 
				id: #sethandler; 
				with: 'Set Handler' ] ]
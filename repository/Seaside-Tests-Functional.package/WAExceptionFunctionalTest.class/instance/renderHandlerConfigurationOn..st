rendering
renderHandlerConfigurationOn: html
	| attribute filter |
	filter := self exceptionFilter.
	filter isNil ifTrue: [
		html paragraph: 'Exception handler configuration attribute not found!'.
		^ self ].
	attribute := filter configuration attributeAt: #exceptionHandler.

	html form: [
		html div: [
			html select
				beOptional;
				optionalLabel: '(inherited default)';
				list: attribute options asArray;
				selected: (filter configuration at: attribute key);
				callback: [ :value | 
					value isNil
						ifTrue: [ filter configuration removeExpressionAt: attribute key ifAbsent: [ ] ]
						ifFalse: [ filter configuration takeValue: value forAttribute: attribute ] ].
			html submitButton with: 'Set Handler' ] ]
rendering-rows
renderRowName: aHandler named: aString on: html
	html anchor
		class: 'handler-name';
		class: 'selected' if: aHandler = selection;
		callback: [ self configure: aHandler ];
		with: [
			html text: aString.
			aHandler isDispatcher ifTrue: [ html text: '/' ].
			self dispatcher defaultHandler == aHandler
				ifTrue: [ html span
							title: 'Default handler';
							with: ' (*)' ] ]
private
before
	"Define the default action form buttons. Some implementation notes on this feature: (1) a tab-index of -1 is not valid XHTML, but most todays browser accept it and ignore the element in the tab-order. (2) Internet Explorer requires an additional text field (without other functionality) to make the default action work. Other browser should not include this text-field, as it prevents remembering form input."

	super before.
	defaultAction ifNil: [ ^ nil ].
	canvas div: [
		canvas submitButton
			tabIndex: -1;
			value: 'Default';
			callback: defaultAction;
			style: 'position: absolute; top: -100em'.
		self isInternetExplorer ifTrue: [
			canvas textInput
				tabIndex: -1;
				callback: [ :v | ];
				style: 'position: absolute; top: -100em' ] ]
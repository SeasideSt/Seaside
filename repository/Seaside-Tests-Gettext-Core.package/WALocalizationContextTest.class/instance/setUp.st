initialization
setUp
	super setUp.
	[ WAGettextExample removeTranslatorForExample ] on: Error do:[ :e | ].
	WAGettextExample addTranslatorForExample.
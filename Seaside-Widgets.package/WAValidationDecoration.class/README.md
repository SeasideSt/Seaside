A WAValidationDecoration validates its component form data when the component returns using "answer" or "answer:". A WAValidationDecoration can be added to component via the method "validateWith:" as below.

	SampleLoginComponent>>intialize
		form := WAFormDecoration new buttons: self buttons.
		self addDecoration: form.
		self validateWith: [:answerArgOrSelf | answerArgOrSelf validate].
		self addMessage: 'Please enter the following information'.

If component returns via "answer:" the answer: argument is passed to the validate block. If the component returns using "answer" the sender of "answer" is passed to the validate block.

Instance Variables
	exceptionClass:		<Notification>
	message:		<String>
	validationBlock:		<one arg block>

exceptionClass
	- Type of notication that is raised by validation code when validation fails. Default value is WAValidationNotification

message
	- String message displayed on validation failure. Obtained from the notification

validationBlock
	- One arg block, 

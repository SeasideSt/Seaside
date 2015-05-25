WAFormDialog is an empty html form. Used in WAComponent>>inform: to create a dialog component that displays text and an "Ok" button to close the component. See subclasses for sample usage & more functionality.

Instance Variables:
	form	<WAFormDecoration> Decorator that generates form tags
	validationError	<String>	Text descriping invalid data entered by user. Displayed when not nil. Set to nil when user submits form.

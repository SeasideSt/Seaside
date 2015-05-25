running
setUp
	super setUp.
	message := self messageClass from: self philippeMarschall to: self seasideDev subject: 'new email package'.
	message setStringBody: 'Hello' wrap: false
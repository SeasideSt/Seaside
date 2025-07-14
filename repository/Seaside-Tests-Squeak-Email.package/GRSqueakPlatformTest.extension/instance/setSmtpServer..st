*seaside-tests-squeak-email
setSmtpServer: aString

	[ MailSender setSmtpServer ]
		on: ProvideAnswerNotification
		do: [ :n | n resume: (aString ifNil: [ '' ] ) ]
*seaside-tests-squeak-email
testSeasideSmtpServer

	| seasideSmtpServer oldSmtpServer |
	oldSmtpServer := [ MailSender smtpServer ] on: ProvideAnswerNotification do: [ :e |
		"If the smtpServer was not set, an notification is raised. Set it back to nil afterwards."
		nil ].
	self setSmtpServer: '1.2.3.4'.
	[ seasideSmtpServer := GRPlatform current seasideSmtpServer ] 
		ensure: [ self setSmtpServer: oldSmtpServer ].
	self assert: seasideSmtpServer isString
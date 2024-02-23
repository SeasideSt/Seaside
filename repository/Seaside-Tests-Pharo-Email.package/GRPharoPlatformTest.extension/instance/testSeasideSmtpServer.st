*seaside-tests-pharo-email
testSeasideSmtpServer

	| seasideSmtpServer oldSmtpServer |
	oldSmtpServer := [ MailComposition smtpServer ] on: Error do: [ :e | 	"If the smtpServer was not set, an error is thrown. Set it back to nil afterwards." nil ].
	MailComposition setSmtpServer: '1.2.3.4'.
	[ seasideSmtpServer := GRPlatform current seasideSmtpServer ] 
		ensure: [ MailComposition setSmtpServer: oldSmtpServer ].
	self assert: seasideSmtpServer isString
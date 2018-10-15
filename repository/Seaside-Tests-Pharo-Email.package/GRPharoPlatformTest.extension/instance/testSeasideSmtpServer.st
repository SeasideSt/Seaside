*seaside-tests-pharo-email
testSeasideSmtpServer

	| seasideSmtpServer |
	seasideSmtpServer := [ GRPlatform current seasideSmtpServer  ]
		on: ProvideAnswerNotification
		do: [ :e | e resume: '1.2.3.4' ].
	self assert: seasideSmtpServer isString
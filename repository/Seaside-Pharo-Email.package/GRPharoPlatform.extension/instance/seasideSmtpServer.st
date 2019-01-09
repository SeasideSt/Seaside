*seaside-pharo-email
seasideSmtpServer

	^ self seasideHandlerPreferenceAt: #smtpServer ifAbsent: [
		| mailSenderClass |
		mailSenderClass := (Smalltalk globals hasClassNamed: 'MailComposition')
			ifTrue: [ Smalltalk globals classNamed: 'MailComposition' ]
			ifFalse: [ Smalltalk globals classNamed: 'MailSender' ].
		mailSenderClass smtpServer ]
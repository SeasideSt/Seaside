*seaside-squeak-email
seasideSmtpServer

	^ self
		seasideHandlerPreferenceAt: #smtpServer
		ifAbsent: [ MailSender smtpServer ]
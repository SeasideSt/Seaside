*seaside-pharo-email
seasideSmtpServer

	^ self seasideHandlerPreferenceAt: #smtpServer ifAbsent: [ MailSender smtpServer ]
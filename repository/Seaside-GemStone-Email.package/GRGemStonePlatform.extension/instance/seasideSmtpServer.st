*seaside-gemstone-email
seasideSmtpServer
	
	^ self seasideHandlerPreferenceAt: #smtpServer ifAbsent: [SendMail mailhost]
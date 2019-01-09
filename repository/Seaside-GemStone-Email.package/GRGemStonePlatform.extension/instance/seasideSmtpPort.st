*seaside-gemstone-email
seasideSmtpPort

	^ self seasideHandlerPreferenceAt: #smtpPort ifAbsent: [SendMail new smtpPort]
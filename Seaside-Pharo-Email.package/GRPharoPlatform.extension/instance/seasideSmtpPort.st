*seaside-pharo-email
seasideSmtpPort

	^ self seasideHandlerPreferenceAt: #smtpPort ifAbsent: [ SMTPClient defaultPortNumber ]
*seaside-pharo-email
seasideSmtpUsername

	^ self seasideHandlerPreferenceAt: #smtpUsername ifAbsent: [ nil ]
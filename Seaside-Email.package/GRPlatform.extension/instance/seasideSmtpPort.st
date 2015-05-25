*seaside-email
seasideSmtpPort

	"^ self seasideApplicationPreferenceAt: #smtpPort ifAbsent: [?]"
	self subclassResponsibility
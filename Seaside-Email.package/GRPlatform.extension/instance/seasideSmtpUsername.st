*seaside-email
seasideSmtpUsername

	"^ self seasideApplicationPreferenceAt: #smtpUsername ifAbsent: [?]"
	self subclassResponsibility
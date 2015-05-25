attributes
action: aUrlOrString
	"This attribute specifies a form processing agent. User agent behavior for a value other than an HTTP URI is undefined."
	self attributes 
		at: 'action'
		put: aUrlOrString
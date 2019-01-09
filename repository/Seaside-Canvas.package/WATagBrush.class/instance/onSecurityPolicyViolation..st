attributes-events
onSecurityPolicyViolation: anObject
	"Fired at elements when a Content Security Policy violation is generated."

	self document scriptGenerator
		event: 'securitypolicyviolation'
		do: anObject
		on: self
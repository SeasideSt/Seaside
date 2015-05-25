*seaside-email
seasideEmail
	^ self new
		name: 'Seaside-Email';
		description: 'Contains convenience classes for sending of emails and preventing header injections.';
		addDependency: 'Seaside-Core';
		url: #seasideUrl;
		yourself
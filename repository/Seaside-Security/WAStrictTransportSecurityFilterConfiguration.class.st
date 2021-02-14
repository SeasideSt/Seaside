"
I am the configuration for WAStrictTransportSecurityFilter.
"
Class {
	#name : #WAStrictTransportSecurityFilterConfiguration,
	#superclass : #WASystemConfiguration,
	#category : 'Seaside-Security'
}

{ #category : #description }
WAStrictTransportSecurityFilterConfiguration >> describeOn: config [
	(config integer: #maxAge)
		comment: 'The number of seconds the user agent should remember receipt of this header field from this server.';
		default: 3600 * 24 * 14. "two weeks"
	(config boolean: #includeSubDomains)
		comment: 'If true signals to the user agent that the STS Policy applies to this STS Server as well as any subdomains of the server''s fully qualified domain name.';
		default: false
]

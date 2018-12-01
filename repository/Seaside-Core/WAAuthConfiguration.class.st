"
WAAuthConfiguration defines attributes to store a username and password for an application. It is used by WAApplication to provide a basic single-account authentication mechanism for applications like the Seaside Configuration application. It changes to mainClass for the session to WAAuthMain, which adds a Decoration to check for authentication before displaying the root component.

You can implement your own authentication mechanism without using this configuration by subclassing WAApplication and implementing #verifyPassword:forUser: to lookup account details from a database or similar. You can then manually set WAAuthMain as your main class.

"
Class {
	#name : #WAAuthConfiguration,
	#superclass : #WASystemConfiguration,
	#category : 'Seaside-Core-Filter'
}

{ #category : #description }
WAAuthConfiguration >> describeOn: config [
	(config string: #login)
		group: #authentication;
		comment: 'The username for this application.'.
	(config password: #passwordHash)
		group: #authentication;
		comment: 'The password for this application.';
		label: 'Password'
]

protocol
isExpired: anObject key: aString
	| entry |
	entry := lastAccessTable at: aString ifAbsent: [ WARcLastAccessEntry new ].
	^entry isExpired: self timeout
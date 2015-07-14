protocol
isExpiredUpdating: anObject key: aString
	| entry |
	entry := lastAccessTable at: aString ifAbsent: [ WARcLastAccessEntry new ].
	^entry isExpiredUpdating: self timeout
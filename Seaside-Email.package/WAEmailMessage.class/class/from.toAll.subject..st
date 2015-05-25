instance creation
from: aFromEmailAddress toAll: aCollectionOfEmailAddress subject: aString
	^ self new
		from: aFromEmailAddress;
		addAllTo: aCollectionOfEmailAddress;
		subject: aString;
		yourself
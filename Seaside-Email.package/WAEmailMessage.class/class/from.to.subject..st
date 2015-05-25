instance creation
from: aFromEmailAddress to: aToEmailAddress subject: aString
	^ self new
		from: aFromEmailAddress;
		addTo: aToEmailAddress;
		subject: aString;
		yourself
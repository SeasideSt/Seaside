as yet unclassified
createServerOfClass: aServerClass withName: aName on: anArrayOfPortNumbers
	^self new
		serverClass: aServerClass;
		name: aName;
		ports: anArrayOfPortNumbers;
		yourself.
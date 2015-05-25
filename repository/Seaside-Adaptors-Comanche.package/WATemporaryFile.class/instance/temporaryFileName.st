accessing
temporaryFileName
	"Answer the name of the file in which my contents are stored in the directory #temporaryDirectory.
	
	Don't confuse this with #fileName which is the name of the file that the client sent."
	^ temporaryFileName ifNil: [ temporaryFileName := WAKeyGenerator current keyOfLength: 48 ]
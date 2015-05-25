I represent a file that was uploaded by the user via #fileInput.

Instance Variables
	contents:		<ByteArray>
	contentType:	<WAMimeType>
	fileName:		<String>

contents
	- the contents of the file, binary

contentType
	- the content type of the file
	
fileName
	- The name of the file the user agent uploaded. This is locale name on the machine of the client. The instance variable might include the full path on the file system, the accessor will never return the path.
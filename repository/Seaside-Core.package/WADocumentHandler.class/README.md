WADocumentHandler handles requests for images, text documents and binary files (byte arrays). This class is not normally used directly. A number of WA*Tag classes implement document:mimeType:fileName: which use WADocumentHandler. Given a document, #document:mimeType:fileName: creates a WADocumentHandler for the document, registers the handler with a Registry, and adds the correct url in the tag for the document.

Instance Variables:
	document	<WAMimeDocument>	MIMEDocument object representing this document and mimeType, generates stream used to write document for the response.
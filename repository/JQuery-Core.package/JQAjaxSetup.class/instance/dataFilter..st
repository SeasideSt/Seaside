options
dataFilter: anObject
	"A function to be used to handle the raw responsed data of XMLHttpRequest.This is a pre-filtering function to sanitize the response.You should return the sanitized data.The function gets passed two arguments: The raw data returned from the server, and the 'dataType' parameter."
	
	self optionAt: 'dataFilter' put: (anObject asFunction return: true)
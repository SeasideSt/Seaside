printing
javascriptContentOn: aStream
	"Generate the JavaScript string of the receiver. Override this method in subclasses to define custom JavaScript code. Note, if you run into this method, you likely use old Seaside code need to rename #printContentOn: to #javascriptContentOn:."
	
	self subclassResponsibility
private
assertLines: anArray
	"Streamed responses don't have content length information. They simply can't know."
	
	super assertLines: (anArray reject: [ :each | each beginsWithSubCollection: 'Content-Length' ])
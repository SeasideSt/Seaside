printing
javascriptOn: aRenderer
	"Generate the JavaScript code from the receiver by dispatching to the outermost surrounding decoration. Do not override this method, instead override #javascriptContentOn:."

	self decoration javascriptContentOn: aRenderer
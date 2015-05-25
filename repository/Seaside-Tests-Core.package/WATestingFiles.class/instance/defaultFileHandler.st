private
defaultFileHandler
	"Superclass could have implementation of (WAFileHandler default), 
	but that is not defined at time test runs when they are loaded in order."

	^ WADispatcher new register: WAFileHandler new at: 'files'
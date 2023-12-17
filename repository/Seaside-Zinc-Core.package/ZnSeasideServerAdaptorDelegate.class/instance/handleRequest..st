public
handleRequest: znRequest
	"I pass a Zinc HTTP Components ZnRequest to my Seaside Server Adaptor using #process:"

	^ self adaptor process: znRequest
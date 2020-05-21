initialize-release
server: znServer
	"I initialize the actual ZnServer instance that I will be using to znServer, 
	to prevent a fallback to #defaultZnServer"
	
	server := znServer.
	port := znServer port
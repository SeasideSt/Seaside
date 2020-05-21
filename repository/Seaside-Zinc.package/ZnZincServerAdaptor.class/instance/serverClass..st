initialize-release
serverClass: znServerClass
	"I initialize the actual ZnServer instance that I will be using, 
	by instanciating znServerClass using my port"
	
	self server: (znServerClass on: self port)
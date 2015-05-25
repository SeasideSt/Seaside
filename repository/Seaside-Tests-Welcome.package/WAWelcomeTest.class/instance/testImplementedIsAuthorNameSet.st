tests
testImplementedIsAuthorNameSet
	self shouldnt: [ GRPlatform current seasideIsAuthorNameSet ] raise: Error 
	
	
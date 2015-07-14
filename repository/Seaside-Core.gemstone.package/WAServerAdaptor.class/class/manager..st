instance creation
manager: aServerManager
	^ aServerManager register: 
		(self basicNew
			initializeWithManager: aServerManager;
			yourself)
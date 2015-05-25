processing
handleFiltered: aRequestContext 
	[ super handleFiltered: aRequestContext ] 
		on: GRDeprecatedApiNotification, GRPlatform current deprecationExceptionSet
		do: [ :notification | self deprecated: notification ]
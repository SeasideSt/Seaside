private
storeConfigurationValues
	
	handler configuration at: #maximumSize put: maximumSize.
	handler configuration at: #maximumRelativeAge put: maximumRelativeAge.
	handler configuration at: #maximumAbsoluteAge put: maximumAbsoluteAge.
	handler configuration at: #overflowAction put: overflowAction
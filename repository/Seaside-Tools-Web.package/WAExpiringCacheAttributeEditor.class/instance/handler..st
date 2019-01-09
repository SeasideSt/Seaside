accessing
handler: anApplication
	handler := anApplication.
	maximumSize := anApplication configuration at: #maximumSize.
	maximumRelativeAge := anApplication configuration at: #maximumRelativeAge.
	maximumAbsoluteAge := anApplication configuration at: #maximumAbsoluteAge.
	overflowAction := anApplication configuration at: #overflowAction
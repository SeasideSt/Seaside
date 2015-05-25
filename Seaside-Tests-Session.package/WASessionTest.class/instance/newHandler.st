private
newHandler
	^ WAApplication new
		preferenceAt: #trackingStrategy put: WAQueryFieldHandlerTrackingStrategy new;
		preferenceAt: #serverHostname put: 'www.seaside.st';
		yourself
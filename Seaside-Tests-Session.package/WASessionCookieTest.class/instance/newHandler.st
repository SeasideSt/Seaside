private
newHandler
	^ WAApplication new
		preferenceAt: #trackingStrategy put: WACookieIfSupportedSessionTrackingStrategy new;
		preferenceAt: #serverHostname put: 'www.seaside.st';
		yourself
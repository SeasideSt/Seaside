private
newHandler
	^ WARedirectingApplication new
		preferenceAt: #trackingStrategy put: WACookieIfSupportedSessionTrackingStrategy new;
		preferenceAt: #serverHostname put: 'www.seaside.st';
		yourself
private
createRegistryWithCookiesEnabled
	"We have an instance variable named 'registry' and GemStone does not like 
		method temps to have the same name as instance variables."
	| newRegistry |
	newRegistry := self createRegistry.
	newRegistry configuration at: #trackingStrategy put: WACookieIfSupportedSessionTrackingStrategy new.
	^ newRegistry
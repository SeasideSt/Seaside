tests
testIsVendorSpecifc
	| mimeType |
	mimeType := WAMimeType fromString: 'image/png'.
	self deny: mimeType isVendorSpecific.
	
	mimeType := WAMimeType fromString: 'image/vnd.microsoft.icon'.
	self assert: mimeType isVendorSpecific.
	
	mimeType := WAMimeType fromString: 'vnd.microsoft.icon/image'.
	self deny: mimeType isVendorSpecific
testing
isVendorSpecific
	"tests if the receiver is a vendor specific mimetype"

	^ self sub beginsWithSubCollection: 'vnd.'
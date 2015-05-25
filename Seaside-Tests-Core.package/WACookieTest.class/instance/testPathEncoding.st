tests
testPathEncoding
	| cookies cookie |
	cookies := WARequestCookie fromString: '$Version="1";
                 Customer="WILE_E_COYOTE"; $Path="/%20"' codec: GRNullCodec new.
	self assert: cookies size = 1.
	cookie := cookies first.
	self assert: cookie path = '/ '.
	self assert: cookie pathUnencoded = '/ '.
	self assert: cookie pathEncoded = '/%20'
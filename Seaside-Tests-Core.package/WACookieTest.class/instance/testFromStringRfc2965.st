tests
testFromStringRfc2965
	| cookies customer partNumber shipping |
	cookies := WARequestCookie fromString: '$Version="1";
                 Customer="WILE_E_COYOTE"; $Path="/acme"; $Port="1"; $Domain="www.1.com";
                 Part_Number="Rocket_Launcher_0001"; $Path="/acme/rockes"; $Port="2,3"; $Domain="www.2.com";
                 Shipping="FedEx"' codec: GRNullCodec new.
	self assert: cookies size = 3.
	
	customer := cookies detect: [ :each | each key = 'Customer' ].
	self assert: customer version = 1.
	self assert: customer value = 'WILE_E_COYOTE'.
	self assert: customer path = '/acme'.
	self assert: customer domain = 'www.1.com'.
	self assert: customer ports size = 1.
	self assert: customer ports first = 1.
	
	partNumber := cookies detect: [ :each | each key = 'Part_Number' ].
	self assert: partNumber version = 1.
	self assert: partNumber value = 'Rocket_Launcher_0001'.
	self assert: partNumber path = '/acme/rockes'.
	self assert: partNumber domain = 'www.2.com'.
	self assert: partNumber ports size = 2.
	self assert: partNumber ports first = 2.
	self assert: partNumber ports second = 3.
	
	shipping := cookies detect: [ :each | each key = 'Shipping' ].
	self assert: shipping version = 1.
	self assert: shipping value = 'FedEx'.
	self assert: shipping path = '/'.
	self assert: shipping domain isNil.
	self assert: shipping ports isNil
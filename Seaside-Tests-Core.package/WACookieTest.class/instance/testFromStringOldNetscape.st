tests
testFromStringOldNetscape
	| cookies customer partNumber shipping |
	cookies := WACookie fromString: 'Customer=WILE_E_COYOTE;
                 Part_Number=Rocket_Launcher_0001;
                 Shipping=FedEx' codec: GRNullCodec new.
	self assert: cookies size = 3.
	
	customer := cookies detect: [ :each | each key = 'Customer' ].
	self assert: customer value = 'WILE_E_COYOTE'.
	
	partNumber := cookies detect: [ :each | each key = 'Part_Number' ].
	self assert: partNumber value = 'Rocket_Launcher_0001'.
	
	shipping := cookies detect: [ :each | each key = 'Shipping' ].
	self assert: shipping value = 'FedEx'
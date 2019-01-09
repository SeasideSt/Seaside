building
buildWith: builder
	| windowSpec |
	windowSpec := self buildWindowWith: builder specs: {
		(0.0 @ 0.0 corner: 1.0 @ 0.5) -> [self buildAdaptorsListWith: builder].
		(0.0 @ 0.5 corner: 1.0 @ 1.0)-> [self buildInformationPaneWith: builder].
	}.
	^ builder build: windowSpec
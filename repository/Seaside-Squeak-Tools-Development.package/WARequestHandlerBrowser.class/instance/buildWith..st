building
buildWith: builder
	| windowSpec tool |
	windowSpec := self buildWindowWith: builder specs: {
		(0 @ 0 corner: 0.25 @ 1) -> [self buildDispatcherTreeWith: builder].
		(0.25 @ 0 corner: 1 @ 1) -> [self buildConfigurationPaneWith: builder].
"		(0.0 @ 0.0 corner: 1.0 @ 0.5) -> [self buildAdaptorsListWith: builder].
		(0.0 @ 0.5 corner: 1.0 @ 1.0) -> [self buildInformationPaneWith: builder].
"	}.
	tool := builder build: windowSpec.
	self changed: #expandRootsRequested.
	^ tool

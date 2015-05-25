building
buildWindowWith: builder

	^ builder pluggableWindowSpec new
		model: self;
		label: #label;
		children: OrderedCollection new;
		yourself

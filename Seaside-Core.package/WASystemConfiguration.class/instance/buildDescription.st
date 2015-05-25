description
buildDescription
	| d |
	d := WAConfigurationDescription new.
	self describeOn: d.
	^ description := d
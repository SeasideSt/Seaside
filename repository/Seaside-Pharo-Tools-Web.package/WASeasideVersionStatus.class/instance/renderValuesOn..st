rendering
renderValuesOn: html
	self renderLabel: 'Seaside Version' value: GRPlatform current seasideVersion greaseString on: html.
	self renderLabel: 'Grease Version' value: GRPlatform current versionString on: html.
	self renderLabel: 'Packages' value: [ self renderPackagesOn: html ] on: html
description
describeOn: config
	config at: #rootDecorationClasses addAll: (Array with: (GRPlatform current bindingOf: WAToolDecoration))
accessing
languageFiles
	languageFiles ifNil: [
		"Get language files, if it doesn't exist, then look in the:
		1. configuration
		2. in the default location
		3. return nil"
		"Note: only (1) is hardcoded at the moment, and this should all be changed."
		^ { FileLocator documents / 'Pharo' / 'images' / 'Seaside Gettext' / 'locale' / 'nl_BE' / 'LC_MESSAGES' / 'seaside-gettext-example.mo'. }.
	].
	^ languageFiles
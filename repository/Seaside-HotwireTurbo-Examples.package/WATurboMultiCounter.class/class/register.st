testing
register
	| app |
	app := (WAAdmin register: self asApplicationAt: 'turbocounter').
	app addLibrary: JQDevelopmentLibrary.
	"app addLibrary: TurboFileLibrary "
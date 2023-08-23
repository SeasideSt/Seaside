testing
register
	| app |
	app := (WAAdmin register: self asApplicationAt: '/examples/turbo/multicounter').
	app addLibrary: JQDevelopmentLibrary.
	"app addLibrary: TurboFileLibrary "
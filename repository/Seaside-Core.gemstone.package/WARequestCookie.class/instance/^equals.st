comparing
= other
	"cookies are identified by the triple name/domain/path"
	^ self species = other species
		and: [ self key = other key
		and: [ self domain = other domain
		and: [ self path = other path ] ] ]
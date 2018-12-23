private
seasidePackagesOn: json
	| packages |
	packages := SystemNavigation default allClasses
		select: [ :class | class package packageName beginsWith: 'Seaside' ]
		thenCollect: [ :class | class package ].
	json array: [
		packages do:[ :package |
			json object: [ 
				json
					key: 'name'
					value: package packageName ] ] ]
private
seasidePackagesOn: json

	json array:[	GRPackage grPackages do:[:grPackage |
		json object: [ 
			json key: 'name' value: grPackage name.
			json key: 'dependencies' value: [  
				json array:[ grPackage dependencies do:[:dep |
					json value:[ json string: dep name ]]]]]]]
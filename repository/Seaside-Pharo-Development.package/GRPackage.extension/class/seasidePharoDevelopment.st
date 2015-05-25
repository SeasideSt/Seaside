*seaside-pharo-development
seasidePharoDevelopment
	^ self new
		name: 'Seaside-Pharo-Development';
		addDependency: 'Seaside-Development';
		addDependency: 'Seaside-Pharo-Tools-Web';
		addDependency: 'Seaside-Pharo-Flow';
		url: #seasideUrl;
		yourself	"For WAWalkbackErrorHandler"
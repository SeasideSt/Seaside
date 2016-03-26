*Seaside-Pharo50-Tools-Web
seasidePharo50ToolsWeb
	^ self new
		name: 'Seaside-Pharo50-Tools-Web';
		description: 'Pharo-specific web-based administration tools for Seaside.';
		addDependency: 'Seaside-Tools-Web';
		addDependency: 'Seaside-Pharo-Core';
		addDependency: 'Seaside-Pharo-Canvas';
		url: #seasideUrl;
		yourself
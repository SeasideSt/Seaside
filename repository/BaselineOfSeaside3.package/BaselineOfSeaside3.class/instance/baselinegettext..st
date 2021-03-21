baselines
baselinegettext: spec

	spec for: #('pharo7.x' 'pharo8.x' 'pharo9.x') do:[
		spec
			baseline: 'Gettext'
			with:[ spec repository: 'github://pharo-contributions/Gettext/source' ].
				
		spec
			package: 'Seaside-Gettext-Core' with: [ spec requires: #('Gettext' 'Seaside-Session') ];
			package: 'Seaside-Gettext-Examples' with: [ spec requires: #('Seaside-Gettext-Core') ];
			package: 'Seaside-Pharo-Gettext-Core';
			package: 'Seaside-Gettext-Core' with:[ spec includes: 'Seaside-Pharo-Gettext-Core' ];
			package: 'Seaside-Gettext-Slime' with: [ spec requires: #('Seaside-Gettext-Core' 'Seaside-Pharo-Slime') ].
		
		spec
			group: 'Seaside-Gettext' with: #('Seaside-Gettext-Core');
			group: 'Gettext-Examples' with: #('Seaside-Gettext' 'Seaside-Gettext-Examples');
			group: 'CI' with: #('Seaside-Gettext' 'Gettext-Examples');
			group: 'Gettext-Slime' with: #('Seaside-Gettext-Slime')
	]
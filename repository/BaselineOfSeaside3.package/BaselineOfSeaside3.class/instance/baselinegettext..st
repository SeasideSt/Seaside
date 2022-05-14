baselines
baselinegettext: spec

	spec for: #common do:[				
		spec
			package: 'Seaside-Gettext-Core' with: [ spec requires: #('Gettext' 'Seaside-Session') ];
			package: 'Seaside-Gettext-Examples' with: [ spec requires: #('Seaside-Examples' 'Seaside-Gettext-Core') ].
		
		spec
			group: 'Seaside-Gettext' with: #('Seaside-Gettext-Core');
			group: 'Gettext-Examples' with: #('Seaside-Gettext' 'Seaside-Gettext-Examples');
			group: 'CI' with: #('Seaside-Gettext' 'Gettext-Examples')
	].

	spec for: #('pharo7.x' 'pharo8.x' 'pharo9.x') do:[		
		spec
			package: 'Seaside-Pharo-Gettext-Core';
			package: 'Seaside-Gettext-Core' with:[ spec includes: 'Seaside-Pharo-Gettext-Core' ];
			package: 'Seaside-Gettext-Slime' with: [ spec requires: #('Seaside-Gettext-Core' 'Seaside-Pharo-Slime') ].
		
		spec
			group: 'Gettext-Slime' with: #('Seaside-Gettext' 'Seaside-Gettext-Slime')
	]
baselines
baselinegettext: spec

	spec for: #('pharo8.x' 'pharo9.x' #gemstone) do:[				
		spec
			package: 'Seaside-Gettext-Core' with: [ spec requires: #('Seaside-Session') ];
			package: 'Seaside-Gettext-Examples' with: [ spec requires: #('Seaside-Examples' 'Seaside-Gettext-Core') ].
		
		spec
			group: 'Seaside-Gettext' with: #('Seaside-Gettext-Core');
			group: 'Gettext-Examples' with: #('Seaside-Gettext' 'Seaside-Gettext-Examples');
			group: 'CI' with: #('Seaside-Gettext' 'Gettext-Examples')
	].

	spec for: #('pharo8.x' 'pharo9.x') do:[		
		spec
			package: 'Seaside-Pharo-Gettext-Core';
			package: 'Seaside-Gettext-Core' with:[ spec includes: 'Seaside-Pharo-Gettext-Core' ];
			package: 'Seaside-Gettext-Slime' with: [ spec requires: #('Seaside-Gettext-Core' 'Seaside-Pharo-Slime') ].
		
		spec
			group: 'Gettext-Slime' with: #('Seaside-Gettext' 'Seaside-Gettext-Slime')
	]
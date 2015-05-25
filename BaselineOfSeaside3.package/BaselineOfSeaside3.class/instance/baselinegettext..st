baselines
baselinegettext: spec

	spec for: #'common' do: [	
		spec repository: 'http://www.smalltalkhub.com/mc/Seaside/Seaside30Addons/main'.
		
		spec
			project: 'Gettext-Project'
			with: [	spec
						loads: #('Core');
						className: 'ConfigurationOfGettext';
						repository: 'http://www.smalltalkhub.com/mc/PharoExtras/Gettext/main' ].
				
		spec
			package: 'Seaside-Gettext-Core' with: [ spec requires: #('Gettext-Project' 'Core') ];
			package: 'Seaside-Gettext-Examples' with: [ spec requires: #('Seaside-Gettext-Core') ].
		
		spec
			group: 'Gettext' with: #('Seaside-Gettext-Core');
			group: 'Gettext-Examples' with: #('Gettext' 'Seaside-Gettext-Examples')		
	
	].

	spec for: #(#squeak 'pharo1.x') do:[
		spec
			package: 'Seaside-Gettext-Slime' with: [ spec requires: #('Slime') ].
			
		spec 
			group: 'GettextSlime' with: #('Seaside-Gettext-Slime')
	].

	spec for: #pharo do: [ 
		spec
			package: 'Seaside-Pharo-Gettext-Core';
			package: 'Seaside-Gettext-Core' with:[spec includes: 'Seaside-Pharo-Gettext-Core'].
	].
baselines-311-312
baseline312gettext: spec

	spec for: #'squeakCommon' do: [	
		spec repository: 'http://www.smalltalkhub.com/mc/Seaside/Seaside30Addons/main'.
		
		spec
			project: 'Gettext-Project'
			with: [	spec
						className: 'ConfigurationOfGettext';
						repository: 'http://www.smalltalkhub.com/mc/PharoExtras/Gettext/main' ].
				
		spec
			package: 'Seaside-Gettext-Core' with: [ spec requires: #('Gettext-Project' 'Seaside-Session') ];
			package: 'Seaside-Gettext-Examples' with: [ spec requires: #('Seaside-Gettext-Core') ].
		
		spec
			group: 'Gettext' with: #('Seaside-Gettext-Core');
			group: 'Gettext-Examples' with: #('Gettext' 'Seaside-Gettext-Examples')		
	
	].

	spec for: #pharo do:[
		spec
			package: 'Seaside-Pharo-Gettext-Core';
			package: 'Seaside-Gettext-Core' with:[spec includes: 'Seaside-Pharo-Gettext-Core']
	].

	spec for: #(#'pharo1.x' #'pharo2.x' #'pharo3.x') do:[
		spec
			package: 'Seaside-Gettext-Slime' with: [ spec requires: #('Seaside-Gettext-Core' 'Seaside-Slime') ].
			
		spec 
			group: 'Gettext-Slime' with: #('Seaside-Gettext-Slime')
	].

	spec for: #(#'pharo4.x' #'pharo5.x') do:[
		spec
			package: 'Seaside-Gettext-Slime' with: [ spec requires: #('Seaside-Gettext-Core' 'Seaside-Pharo40-Slime') ].
			
		spec 
			group: 'Gettext-Slime' with: #('Seaside-Gettext-Slime')
	]
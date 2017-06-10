baselines-320
baseline320security: spec
	spec
		for: #pharo
		do: [ spec package: 'Cryptography' with: [ spec repository: 'http://mc.smalltalkhub.com/mc/Cryptography/Cryptography/main' ].
			spec
				package: 'Seaside-Security'
					with: [ spec
						requires: #('Seaside-Core' 'Cryptography');
						includes: #('Seaside-Pharo-Security') ];
				package: 'Seaside-Pharo-Security';
				package: 'Seaside-Tests-Security' with: [ spec requires: #('Seaside-Security') ].
			spec
				package: 'Seaside-Tests-Security' with: [ spec includes: #('Seaside-Tests-Pharo-Security') ];
				package: 'Seaside-Tests-Pharo-Security' ].
	spec
		for: #squeak
		do: [ spec package: 'Cryptography' with: [ spec repository: 'http://www.squeaksource.com/Cryptography' ].
			spec
				package: 'Seaside-Security'
					with: [ spec
						requires: #('Seaside-Core' 'Cryptography');
						includes: #('Seaside-Pharo-Security') ];
				package: 'Seaside-Pharo-Security';
				package: 'Seaside-Tests-Security' with: [ spec requires: #('Seaside-Security') ].
			spec
				package: 'Seaside-Tests-Security' with: [ spec includes: #('Seaside-Tests-Pharo-Security') ];
				package: 'Seaside-Tests-Pharo-Security' ].
	spec
		for: #squeakCommon
		do: [ spec
				group: 'Security' with: #('Seaside-Security');
				group: 'Security Tests' with: #('Seaside-Tests-Security') ]
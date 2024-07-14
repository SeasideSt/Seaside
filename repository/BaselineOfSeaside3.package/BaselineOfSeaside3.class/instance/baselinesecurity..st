baselines
baselinesecurity: spec

	spec
		for: #squeakCommon
		do: [ spec
				package: 'Seaside-Security'
					with: [ spec
						requires: #('Seaside-Core' 'Cryptography');
						includes: #('Seaside-Pharo-Security') ];
				package: 'Seaside-Pharo-Security';
				package: 'Seaside-Tests-Security' with: [ spec requires: #('Seaside-Security') ];
				package: 'Seaside-Tests-Security' with: [ spec includes: #('Seaside-Tests-Pharo-Security') ];
				package: 'Seaside-Tests-Pharo-Security'.

			spec
				group: 'Security' with: #('Seaside-Security');
				group: 'Security Tests' with: #('Seaside-Tests-Security') ].

	spec for: #pharo do: [ spec package: 'Cryptography' with: [ spec repository: 'github://pharo-contributions/Cryptography:0.3.2/source' ] ].

	spec for: #squeak do: [ spec package: 'Cryptography' with: [ spec repository: 'http://www.squeaksource.com/Cryptography' ] ]
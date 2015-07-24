baselines
baselinesecurity: spec

	spec for: #'squeakCommon' do: [
		
		spec
			package: 'Cryptography' with:[ 
				spec repository: 'http://smalltalkhub.com/mc/Cryptography/Cryptography/main' ].
		
		spec 
			package: 'Seaside-Security' with: [
				spec requires: #('Seaside-Core') ];
			package: 'Seaside-Tests-Security' with: [
				spec requires: #('Seaside-Security' ) ].
		
		spec 
			package: 'Seaside-Pharo-Security';
			package: 'Seaside-Security' with: [
				spec 
					requires: #('Cryptography');
					includes: #('Seaside-Pharo-Security').
				].
		spec
			package: 'Seaside-Tests-Pharo-Security';
			package: 'Seaside-Tests-Security' with: [
				spec includes: #('Seaside-Tests-Pharo-Security') ].
			
		spec
			group: 'Security' with: #('Seaside-Security');
			group: 'Tests' with: #('Seaside-Tests-Security') 
	]
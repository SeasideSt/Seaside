baselines
baselineob: spec

	spec
		for: #squeak
		do: [ spec
				project: 'OB'
				with: [ spec
						className: 'ConfigurationOfOmniBrowser';
						versionString: #stable;
						loads: #('Core');
						repository: 'http://www.squeaksource.com/MetacelloRepository' ].

			spec package: 'Seaside-Tools-OmniBrowser' with: [ spec requires: #('OB' 'Seaside-Tools-Core') ].

			spec group: 'OmniBrowser' with: #('Seaside-Tools-OmniBrowser') ]
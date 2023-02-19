baselines
baselinegettext: spec
  spec
    for: #(#'pharo8.x' #'pharo9.x' #'pharo10.x' #'pharo11.x' #'gemstone')
    do: [ 
      spec
        package: 'Seaside-Gettext-Core'
          with: [ spec requires: #('Seaside-Session') ];
        package: 'Seaside-Gettext-Examples'
          with: [ spec requires: #('Seaside-Examples' 'Seaside-Gettext-Core') ];
        package: 'Seaside-Tests-Gettext-Core'
          with: [ spec requires: #('Seaside-Gettext-Core') ];
        package: 'Seaside-Tests-Gettext-Examples'
          with: [ spec requires: #('Seaside-Gettext-Examples') ].
      spec
        group: 'Seaside-Gettext' with: #('Seaside-Gettext-Core');
        group: 'Gettext-Examples'
          with: #('Seaside-Gettext' 'Seaside-Gettext-Examples');
        group: 'Tests' with: #('Seaside-Tests-Gettext-Core' 'Gettext-Examples') ].
  spec
    for: #(#'pharo8.x' #'pharo9.x' #'pharo10.x' #'pharo11.x')
    do: [ 
      spec
        package: 'Seaside-Pharo-Gettext-Core';
        package: 'Seaside-Gettext-Core'
          with: [ spec includes: 'Seaside-Pharo-Gettext-Core' ];
        package: 'Seaside-Gettext-Slime'
          with: [ spec requires: #('Seaside-Gettext-Core' 'Seaside-Pharo-Slime') ];
        package: 'Seaside-Tests-Pharo-Gettext'
          with: [ spec requires: 'Seaside-Pharo-Gettext-Core' ].
      spec
        group: 'Gettext-Slime'
          with: #('Seaside-Gettext' 'Seaside-Gettext-Slime');
        group: 'Tests' with: #('Seaside-Tests-Pharo-Gettext') ].
  spec
    for: #(#'gemstone')
    do: [ 
      spec
        package: 'Seaside-GemStone-Gettext-Core';
        "package: 'Seaside-GemStone-Gettext-Examples';"
        package: 'Seaside-Gettext-Core'
          with: [ spec includes: #('Seaside-GemStone-Gettext-Core') ]";
		  package: 'Seaside-Gettext-Examples'
			with: [ spec includes: #('Seaside-GemStone-Gettext-Examples') ]" ]
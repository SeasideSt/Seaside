baselines
baselinegemstone: spec
  spec
    for: #'gemstone'
    do: [ 
      spec blessing: #'baseline'.
      spec
        project: 'GsCore'
        with: [ 
          spec
            className: 'ConfigurationOfGsCore';
            versionString: #'stable';
            repository:
                'http://seaside.gemtalksystems.com/ss/MetacelloRepository' ].
      spec
        package: 'Seaside-Core'
          with: [ 
              spec
                includes: #('Seaside-GemStone-Core');
                file: 'Seaside-Core.gemstone' ];
        package: 'Seaside-Development'
          with: [ spec includes: #('Seaside-GemStone-Development') ];
        package: 'Seaside-Email'
          with: [ spec includes: #('Seaside-GemStone-Email') ];
        package: 'Seaside-Flow'
          with: [ spec includes: #('Seaside-GemStone-Flow') ];
        package: 'Seaside-Environment'
          with: [ 
              spec
                includes:
                    #('Seaside-GemStone-Environment' 'Seaside-GemStone-Tools-Production');
                file: 'Seaside-Environment.gemstone' ];
        package: 'Seaside-Session'
          with: [ 
              spec
                includes: #('Seaside-GemStone-Session');
                file: 'Seaside-Session.gemstone' ];
        package: 'Seaside-Tools-Web'
          with: [ spec includes: #('Seaside-GemStone-Tools-Web') ];
        package: 'Seaside-Tests-Core'
          with: [ spec includes: #('Seaside-Tests-GemStone-Core') ];
        package: 'Seaside-Tests-Development'
          with: [ spec includes: #('Seaside-Tests-GemStone-Development') ];
        package: 'Seaside-Tests-Flow'
          with: [ 
              spec
                includes:
                  #('Seaside-Tests-GemStone-Continuation' 'Seaside-Tests-GemStone-Flow') ];
        package: 'Seaside-Tests-Functional'
          with: [ spec includes: #('Seaside-Tests-GemStone-Functional') ];
        package: 'Seaside-Tools-Core'
          with: [ spec file: 'Seaside-Tools-Core.gemstone' ];
        package: 'Seaside-GemStone-Basic-Development'
          with: [ spec requires: #('Seaside-Core') ];
        package: 'Seaside-GemStone-Continuation';
        package: 'Seaside-GemStone-Core'
          with: [ spec requires: #('Seaside-Core' 'GsCore') ];
        package: 'Seaside-GemStone-Development'
          with: [ 
              spec
                requires:
                  #('Seaside-Development' 'Seaside-GemStone-Basic-Development' 'Seaside-GemStone-Tools-Production') ];
        package: 'Seaside-GemStone-Email'
          with: [ spec requires: #('Seaside-Email') ];
        package: 'Seaside-GemStone-Environment'
          with: [ spec requires: #('Seaside-Environment') ];
        package: 'Seaside-GemStone-Flow'
          with: [ spec requires: #('Seaside-Flow' 'Seaside-GemStone-Continuation') ];
        package: 'Seaside-GemStone-ServiceTask'
          with: [ spec requires: #('Seaside-GemStone-Tools-Production') ];
        package: 'Seaside-GemStone-Session'
          with: [ spec requires: #('Seaside-Session') ];
        package: 'Seaside-GemStone-Tools-Production'
          with: [ spec requires: #('Seaside-Widgets' 'Seaside-GemStone-Basic-Development') ];
        package: 'Seaside-GemStone-Tools-Web'
          with: [ spec requires: #('Seaside-Tools-Web') ];
        package: 'Seaside-Tests-GemStone-Core'
          with: [ spec requires: #('Seaside-Tests-Core') ];
        package: 'Seaside-Tests-GemStone-Development'
          with: [ spec requires: #('Seaside-Tests-Development') ];
        package: 'Seaside-Tests-GemStone-Continuation'
          with: [ spec requires: #('Seaside-GemStone-Continuation') ];
        package: 'Seaside-Tests-GemStone-Flow'
          with: [ spec requires: #('Seaside-Tests-Flow') ];
        package: 'Seaside-Tests-GemStone-Functional'
          with: [ spec requires: #('Seaside-Tests-Functional') ].
      spec
        group: 'CI' overrides: #('Tests' 'Development Tests');
        group: 'Development' with: #('Seaside-GemStone-Basic-Development');
        group: 'Production' with: #('Seaside-GemStone-Tools-Production') ].
  spec
    for: #'gs2.4.x'
    do: [ 
      spec
        package: 'Seaside-Core'
          with: [ spec includes: #('Seaside-GemStone240-Core') ];
        package: 'Seaside-GemStone240-Core'
          with: [ 
              spec
                requires: #('Seaside-Core');
                includes: #('Seaside-GemStone-Core') ];
        package: 'Seaside-GemStone-Core'
          with: [ spec requires: #('Seaside-GemStone240-Core') ] ].
  spec
    for: #'gs3.x'
    do: [ 
      spec
        package: 'Seaside-Core'
          with: [ spec includes: #('Seaside-GemStone300-Core') ];
        package: 'Seaside-GemStone300-Core'
          with: [ 
              spec
                requires: #('Seaside-Core');
                includes: #('Seaside-GemStone-Core') ];
        package: 'Seaside-GemStone-Core'
          with: [ spec requires: #('Seaside-GemStone300-Core') ] ]
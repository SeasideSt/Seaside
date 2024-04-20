baselines
baselinefilesystem: spec

  spec
    for: #'common'
    do: [ 
      spec
        package: 'Seaside-FileSystem'
          with: [ spec requires: #('Seaside-Core') ];
        package: 'Seaside-Tests-FileSystem'
          with: [ spec requires: #('Seaside-FileSystem') ].
      spec
        group: 'Filesystem' with: #('Seaside-FileSystem');
        group: 'Filesystem Tests'
          with: #('Filesystem' 'Seaside-Tests-FileSystem');
        group: 'Tests' with: #('Filesystem Tests') ].
  spec
    for: #'pharo'
    do: [ 
      spec
        package: 'Seaside-Pharo-FileSystem';
        package: 'Seaside-FileSystem'
          with: [ spec includes: 'Seaside-Pharo-FileSystem' ] ].
  spec
    for: #'gemstone'
    do: [ 
      spec
        package: 'Seaside-GemStone-FileSystem';
        package: 'Seaside-FileSystem'
          with: [ spec includes: 'Seaside-GemStone-FileSystem' ].
      spec
        group: 'Filesystem' with: #('Seaside-FileSystem'). ]
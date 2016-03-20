baselines-311-312
baseline311gemstone: spec
  spec
    for: #'gs3.x'
    do: [ 
      spec
        baseline: 'Seaside3'
          with: [ spec repository: 'github://GsDevKit/Seaside31:gs_master/repository' ];
        import: 'Seaside3' ]
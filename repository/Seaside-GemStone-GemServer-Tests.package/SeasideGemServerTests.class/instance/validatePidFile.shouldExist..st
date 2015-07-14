private
validatePidFile: gemServer shouldExist: shouldExist
  | portCount |
  portCount := 0.
  gemServer ports
    do: [ :port | 
      | fileName |
      portCount := portCount + 1.
      fileName := gemServer gemPidFileName: port.
      ServerFileDirectory
        splitName: fileName
        to: [ :dirPath :fileName | 
          | dir x |
          dir := ServerFileDirectory on: dirPath.
          self assert: (x := dir fileExists: fileName) == shouldExist ] ].
  ^ portCount
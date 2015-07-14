private
isWindowsPath
	"'#:\*' match: fileName is broken on Squeak for WideString arguments"
	^ fileName notEmpty
		and: [ fileName first isLetter
		and: [ fileName size >= 3
		and: [ (fileName copyFrom: 2 to: 3) = ':\' ] ] ]
private
extractPackageName: fullPackageName
	^(fullPackageName findTokens: '.') first copyUpToLast: $-
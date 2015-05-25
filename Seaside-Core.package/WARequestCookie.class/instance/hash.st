comparing
hash
	"see #="

	^ (self key hash bitXor: self domain hash) bitXor: self path hash
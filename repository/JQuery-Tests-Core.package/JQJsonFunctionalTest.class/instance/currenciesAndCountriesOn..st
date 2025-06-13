private
currenciesAndCountriesOn: json

	json array: [
		self listOfCurrencyCodes do:[ :currencyCode |
			json object: [ 
				json key: 'currency' value: currencyCode.
				json key: 'countries' value: [  
					json array: [ (self countriesForCurrencyCode: currencyCode) do: [ :country |
						json value: [ json string: country ] ] ] ] ] ] ]
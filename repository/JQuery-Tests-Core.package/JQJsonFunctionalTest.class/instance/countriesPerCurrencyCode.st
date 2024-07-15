private
countriesPerCurrencyCode

	| dict |
	dict := Dictionary new
		  add: 'AFN' -> #( 'Afghanistan' );
		  add: 'ALL' -> #( 'Albania' );
		  add: 'DZD' -> #( 'Algeria' );
		  add:
			  'USD' -> #( 'American Samoa' 'British Indian Ocean Territory'
				     'East Timor' 'Guam' 'Marshall Islands' 'Micronesia, Federated States of'
				     'Northern Mariana Islands' 'Palau' 'Puerto Rico'
				     'Turks and Caicos Islands' 'United States' 'United States Minor Outlying Islands'
				     'Virgin Islands, British' 'Virgin Islands, U.S.' );
		  add: 'EUR'
			  -> #( 'Andorra' 'Austria' 'Belgium' 'Croatia' 'Cyprus' 'Estonia'
				     'Finland' 'France' 'French Guiana' 'French Southern territories'
				     'Germany' 'Greece' 'Guadeloupe' 'Holy See (Vatican City State)'
				     'Ireland' 'Italy' 'Latvia' 'Lithuania' 'Luxembourg'
				     'Malta' 'Martinique' 'Mayotte' 'Monaco' 'Netherlands'
				     'Portugal' 'Reunion' 'Saint Pierre and Miquelon'
				     'San Marino' 'Slovakia' 'Slovenia' 'Spain' );
		  add: 'AOA' -> #( 'Angola' );
		  add: 'XCD'
			  ->
				  #( 'Anguilla' 'Antarctica' 'Antigua and Barbuda'
				     'Dominica' 'Grenada' 'Montserrat' 'Saint Kitts and Nevis'
				     'Saint Lucia' 'Saint Vincent and the Grenadines' );
		  add: 'ARS' -> #( 'Argentina' );
		  add: 'AMD' -> #( 'Armenia' );
		  add: 'AWG' -> #( 'Aruba' );
		  add:
			  'AUD'
			  -> #( 'Australia' 'Christmas Island' 'Cocos (Keeling) Islands'
				     'Heard Island and McDonald Islands'
				     'Kiribati' 'Nauru' 'Norfolk Island' 'Tuvalu' );
		  add: 'AZN' -> #( 'Azerbaijan' );
		  add: 'BSD' -> #( 'Bahamas' );
		  add: 'BHD' -> #( 'Bahrain' );
		  add: 'BDT' -> #( 'Bangladesh' );
		  add: 'BBD' -> #( 'Barbados' );
		  add: 'BYR' -> #( 'Belarus' );
		  add: 'BZD' -> #( 'Belize' );
		  add: 'XOF' -> #( 'Benin' 'Burkina Faso' 'Ivory Coast' 'Mali' 'Niger' 'Senegal' 'Togo' );
		  add: 'BMD' -> #( 'Bermuda' );
		  add: 'BTN' -> #( 'Bhutan' );
		  add: 'BOB' -> #( 'Bolivia' );
		  add: 'BAM' -> #( 'Bosnia and Herzegovina' );
		  add: 'BWP' -> #( 'Botswana' );
		  add: 'NOK' -> #( 'Bouvet Island' 'Norway' 'Svalbard and Jan Mayen' );
		  add: 'BRL' -> #( 'Brazil' );
		  add: 'BND' -> #( 'Brunei' );
		  add: 'BGN' -> #( 'Bulgaria' );
		  add: 'BIF' -> #( 'Burundi' );
		  add: 'KHR' -> #( 'Cambodia' );
		  add: 'XAF' -> #( 'Cameroon' 'Central African Republic' 'Chad' 'Congo' 'Equatorial Guinea' 'Gabon' );
		  add: 'CAD' -> #( 'Canada' );
		  add: 'CVE' -> #( 'Cape Verde' );
		  add: 'KYD' -> #( 'Cayman Islands' );
		  add: 'CLP' -> #( 'Chile' );
		  add: 'CNY' -> #( 'China' );
		  add: 'COP' -> #( 'Colombia' );
		  add: 'KMF' -> #( 'Comoros' );
		  yourself.
	self addCountriesPerCurrencyCodeRemainingBecausePharo8LimitationOfLiteralsTo: dict.
	^ dict
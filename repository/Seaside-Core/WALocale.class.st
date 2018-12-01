"
A WALocale defines a users langauge and country.

Instance Variables
	country:		<String>
	language:		<String>

country
	- either an ISO 2 or ISO 3 country code

language
	- either an ISO 2 or ISO 3 language code

"
Class {
	#name : #WALocale,
	#superclass : #WAObject,
	#instVars : [
		'language',
		'country'
	],
	#classInstVars : [
		'iso2Languages',
		'iso3Languages',
		'iso2Countries',
		'iso3Countries'
	],
	#category : 'Seaside-Core-HTTP'
}

{ #category : #accessing }
WALocale class >> countryList [
	^ #(('AF' 'AFG' 'AFGHANISTAN') ('AL' 'ALB' 'ALBANIA') ('DZ' 'DZA' 'ALGERIA') ('AS' 'ASM' 'AMERICAN SAMOA') ('AD' 'AND' 'ANDORRA') ('AO' 'AGO' 'ANGOLA') ('AI' 'AIA' 'ANGUILLA') ('AQ' 'ATA' 'ANTARCTICA') ('AG' 'ATG' 'ANTIGUA AND BARBUDA') ('AR' 'ARG' 'ARGENTINA') ('AM' 'ARM' 'ARMENIA') ('AW' 'ABW' 'ARUBA') ('AU' 'AUS' 'AUSTRALIA') ('AT' 'AUT' 'AUSTRIA') ('AZ' 'AZE' 'AZERBAIJAN') ('BS' 'BHS' 'BAHAMAS') ('BH' 'BHR' 'BAHRAIN') ('BD' 'BGD' 'BANGLADESH') ('BB' 'BRB' 'BARBADOS') ('BY' 'BLR' 'BELARUS') ('BE' 'BEL' 'BELGIUM') ('BZ' 'BLZ' 'BELIZE') ('BJ' 'BEN' 'BENIN') ('BM' 'BMU' 'BERMUDA') ('BT' 'BTN' 'BHUTAN') ('BO' 'BOL' 'BOLIVIA') ('BA' 'BIH' 'BOSNIA AND HERZEGOWINA') ('BW' 'BWA' 'BOTSWANA') ('BV' 'BVT' 'BOUVET ISLAND') ('BR' 'BRA' 'BRAZIL') ('IO' 'IOT' 'BRITISH INDIAN OCEAN TERRITORY') ('BN' 'BRN' 'BRUNEI DARUSSALAM') ('BG' 'BGR' 'BULGARIA') ('BF' 'BFA' 'BURKINA FASO') ('BI' 'BDI' 'BURUNDI') ('KH' 'KHM' 'CAMBODIA') ('CM' 'CMR' 'CAMEROON') ('CA' 'CAN' 'CANADA') ('CV' 'CPV' 'CAPE VERDE') ('KY' 'CYM' 'CAYMAN ISLANDS') ('CF' 'CAF' 'CENTRAL AFRICAN REPUBLIC') ('TD' 'TCD' 'CHAD') ('CL' 'CHL' 'CHILE') ('CN' 'CHN' 'CHINA') ('CX' 'CXR' 'CHRISTMAS ISLAND') ('CC' 'CCK' 'COCOS (KEELING) ISLANDS') ('CO' 'COL' 'COLOMBIA') ('KM' 'COM' 'COMOROS') ('CG' 'COG' 'CONGO') ('CK' 'COK' 'COOK ISLANDS') ('CR' 'CRI' 'COSTA RICA') ('CI' 'CIV' 'COTE D''IVOIRE') ('HR' 'HRV' 'CROATIA (local name: Hrvatska)') ('CU' 'CUB' 'CUBA') ('CY' 'CYP' 'CYPRUS') ('CZ' 'CZE' 'CZECH REPUBLIC') ('DK' 'DNK' 'DENMARK') ('DJ' 'DJI' 'DJIBOUTI') ('DM' 'DMA' 'DOMINICA') ('DO' 'DOM' 'DOMINICAN REPUBLIC') ('TP' 'TMP' 'EAST TIMOR') ('EC' 'ECU' 'ECUADOR') ('EG' 'EGY' 'EGYPT') ('SV' 'SLV' 'EL SALVADOR') ('GQ' 'GNQ' 'EQUATORIAL GUINEA') ('ER' '   ' 'ERITREA') ('EE' 'EST' 'ESTONIA') ('ET' 'ETH' 'ETHIOPIA') ('FK' 'FLK' 'FALKLAND ISLANDS (MALVINAS)') ('FO' 'FRO' 'FAROE ISLANDS') ('FJ' 'FJI' 'FIJI') ('FI' 'FIN' 'FINLAND') ('FR' 'FRA' 'FRANCE') ('FX' 'FXX' 'FRANCE, METROPOLITAN') ('GF' 'GUF' 'FRENCH GUIANA') ('PF' 'PYF' 'FRENCH POLYNESIA') ('TF' 'ATF' 'FRENCH SOUTHERN TERRITORIES') ('GA' 'GAB' 'GABON') ('GM' 'GMB' 'GAMBIA') ('GE' 'GEO' 'GEORGIA') ('DE' 'DEU' 'GERMANY') ('GH' 'GHA' 'GHANA') ('GI' 'GIB' 'GIBRALTAR') ('GR' 'GRC' 'GREECE') ('GL' 'GRL' 'GREENLAND') ('GD' 'GRD' 'GRENADA') ('GP' 'GLP' 'GUADELOUPE') ('GU' 'GUM' 'GUAM') ('GT' 'GTM' 'GUATEMALA') ('GN' 'GIN' 'GUINEA') ('GW' 'GNB' 'GUINEA-BISSAU') ('GY' 'GUY' 'GUYANA') ('HT' 'HTI' 'HAITI') ('HM' 'HMD' 'HEARD AND MC DONALD ISLANDS') ('VA' 'VAT' 'HOLY SEE (VATICAN CITY STATE)') ('HN' 'HND' 'HONDURAS') ('HK' 'HKG' 'HONG KONG') ('HU' 'HUN' 'HUNGARY') ('IS' 'ISL' 'ICELAND') ('IN' 'IND' 'INDIA') ('ID' 'IDN' 'INDONESIA') ('IR' 'IRN' 'IRAN (ISLAMIC REPUBLIC OF)') ('IQ' 'IRQ' 'IRAQ') ('IE' 'IRL' 'IRELAND') ('IL' 'ISR' 'ISRAEL') ('IT' 'ITA' 'ITALY') ('JM' 'JAM' 'JAMAICA') ('JP' 'JPN' 'JAPAN') ('JO' 'JOR' 'JORDAN') ('KZ' 'KAZ' 'KAZAKHSTAN') ('KE' 'KEN' 'KENYA') ('KI' 'KIR' 'KIRIBATI') ('KP' 'PRK' 'KOREA, DEMOCRATIC PEOPLE''S REPUBLIC OF') ('KR' 'KOR' 'KOREA, REPUBLIC OF') ('KW' 'KWT' 'KUWAIT') ('KG' 'KGZ' 'KYRGYZSTAN') ('LA' 'LAO' 'LAO PEOPLE''S DEMOCRATIC REPUBLIC') ('LV' 'LVA' 'LATVIA') ('LB' 'LBN' 'LEBANON') ('LS' 'LSO' 'LESOTHO') ('LR' 'LBR' 'LIBERIA') ('LY' 'LBY' 'LIBYAN ARAB JAMAHIRIYA') ('LI' 'LIE' 'LIECHTENSTEIN') ('LT' 'LTU' 'LITHUANIA') ('LU' 'LUX' 'LUXEMBOURG') ('MO' 'MAC' 'MACAU') ('MK' 'MKD' 'MACEDONIA, THE FORMER YUGOSLAV REPUBLIC OF') ('MG' 'MDG' 'MADAGASCAR') ('MW' 'MWI' 'MALAWI') ('MY' 'MYS' 'MALAYSIA') ('MV' 'MDV' 'MALDIVES') ('ML' 'MLI' 'MALI') ('MT' 'MLT' 'MALTA') ('MH' 'MHL' 'MARSHALL ISLANDS') ('MQ' 'MTQ' 'MARTINIQUE') ('MR' 'MRT' 'MAURITANIA') ('MU' 'MUS' 'MAURITIUS') ('YT' 'MYT' 'MAYOTTE') ('MX' 'MEX' 'MEXICO') ('FM' 'FSM' 'MICRONESIA, FEDERATED STATES OF') ('MD' 'MDA' 'MOLDOVA, REPUBLIC OF') ('MC' 'MCO' 'MONACO') ('MN' 'MNG' 'MONGOLIA') ('MS' 'MSR' 'MONTSERRAT') ('MA' 'MAR' 'MOROCCO') ('MZ' 'MOZ' 'MOZAMBIQUE') ('MM' 'MMR' 'MYANMAR') ('NA' 'NAM' 'NAMIBIA') ('NR' 'NRU' 'NAURU') ('NP' 'NPL' 'NEPAL') ('NL' 'NLD' 'NETHERLANDS') ('AN' 'ANT' 'NETHERLANDS ANTILLES') ('NC' 'NCL' 'NEW CALEDONIA') ('NZ' 'NZL' 'NEW ZEALAND') ('NI' 'NIC' 'NICARAGUA') ('NE' 'NER' 'NIGER') ('NG' 'NGA' 'NIGERIA') ('NU' 'NIU' 'NIUE') ('NF' 'NFK' 'NORFOLK ISLAND') ('MP' 'MNP' 'NORTHERN MARIANA ISLANDS') ('NO' 'NOR' 'NORWAY') ('OM' 'OMN' 'OMAN') ('PK' 'PAK' 'PAKISTAN') ('PW' 'PLW' 'PALAU') ('PA' 'PAN' 'PANAMA') ('PG' 'PNG' 'PAPUA NEW GUINEA') ('PY' 'PRY' 'PARAGUAY') ('PE' 'PER' 'PERU') ('PH' 'PHL' 'PHILIPPINES') ('PN' 'PCN' 'PITCAIRN') ('PL' 'POL' 'POLAND') ('PT' 'PRT' 'PORTUGAL') ('PR' 'PRI' 'PUERTO RICO') ('QA' 'QAT' 'QATAR') ('RE' 'REU' 'REUNION') ('RO' 'ROM' 'ROMANIA') ('RU' 'RUS' 'RUSSIAN FEDERATION') ('RW' 'RWA' 'RWANDA') ('KN' 'KNA' 'SAINT KITTS AND NEVIS') ('LC' 'LCA' 'SAINT LUCIA') ('VC' 'VCT' 'SAINT VINCENT AND THE GRENADINES') ('WS' 'WSM' 'SAMOA') ('SM' 'SMR' 'SAN MARINO') ('ST' 'STP' 'SAO TOME AND PRINCIPE') ('SA' 'SAU' 'SAUDI ARABIA') ('SN' 'SEN' 'SENEGAL') ('SC' 'SYC' 'SEYCHELLES') ('SL' 'SLE' 'SIERRA LEONE') ('SG' 'SGP' 'SINGAPORE') ('SK' 'SVK' 'SLOVAKIA (Slovak Republic)') ('SI' 'SVN' 'SLOVENIA') ('SB' 'SLB' 'SOLOMON ISLANDS') ('SO' 'SOM' 'SOMALIA') ('ZA' 'ZAF' 'SOUTH AFRICA') ('GS' 'SGS' 'SOUTH GEORGIA AND THE SOUTH SANDWICH ISLANDS') ('ES' 'ESP' 'SPAIN') ('LK' 'LKA' 'SRI LANKA') ('SH' 'SHN' 'ST. HELENA') ('PM' 'SPM' 'ST. PIERRE AND MIQUELON') ('SD' 'SDN' 'SUDAN') ('SR' 'SUR' 'SURINAME') ('SJ' 'SJM' 'SVALBARD AND JAN MAYEN ISLANDS') ('SZ' 'SWZ' 'SWAZILAND') ('SE' 'SWE' 'SWEDEN') ('CH' 'CHE' 'SWITZERLAND') ('SY' 'SYR' 'SYRIAN ARAB REPUBLIC') ('TW' 'TWN' 'TAIWAN, PROVINCE OF CHINA') ('TJ' 'TJK' 'TAJIKISTAN') ('TZ' 'TZA' 'TANZANIA, UNITED REPUBLIC OF') ('TH' 'THA' 'THAILAND') ('TG' 'TGO' 'TOGO') ('TK' 'TKL' 'TOKELAU') ('TO' 'TON' 'TONGA') ('TT' 'TTO' 'TRINIDAD AND TOBAGO') ('TN' 'TUN' 'TUNISIA') ('TR' 'TUR' 'TURKEY') ('TM' 'TKM' 'TURKMENISTAN') ('TC' 'TCA' 'TURKS AND CAICOS ISLANDS') ('TV' 'TUV' 'TUVALU') ('UG' 'UGA' 'UGANDA') ('UA' 'UKR' 'UKRAINE') ('AE' 'ARE' 'UNITED ARAB EMIRATES') ('GB' 'GBR' 'UNITED KINGDOM') ('US' 'USA' 'UNITED STATES') ('UM' 'UMI' 'UNITED STATES MINOR OUTLYING ISLANDS') ('UY' 'URY' 'URUGUAY') ('UZ' 'UZB' 'UZBEKISTAN') ('VU' 'VUT' 'VANUATU') ('VE' 'VEN' 'VENEZUELA') ('VN' 'VNM' 'VIET NAM') ('VG' 'VGB' 'VIRGIN ISLANDS (BRITISH)') ('VI' 'VIR' 'VIRGIN ISLANDS (U.S.)') ('WF' 'WLF' 'WALLIS AND FUTUNA ISLANDS') ('EH' 'ESH' 'WESTERN SAHARA') ('YE' 'YEM' 'YEMEN') ('YU' 'YUG' 'YUGOSLAVIA') ('ZR' 'ZAR' 'ZAIRE') ('ZM' 'ZMB' 'ZAMBIA') ('ZW' 'ZWE' 'ZIMBABWE'))
]

{ #category : #'instance creation' }
WALocale class >> fromString: aString [
	| language country delimiter |
	delimiter := (aString includes: $_)
		ifTrue: [ $_ ]
		ifFalse: [ $- ].
	language := aString copyUpTo: delimiter.
	country := aString copyAfter: delimiter.
	country isEmpty ifTrue: [ country := nil ].
	^ self
		language: language
		country: country
]

{ #category : #'class initialization' }
WALocale class >> initialize [
	self initializeLangaugeList.
	self initializeCountryList
]

{ #category : #'class initialization' }
WALocale class >> initializeCountryList [
	iso2Countries := Dictionary new.
	iso3Countries := Dictionary new.
	self countryList do: [ :each |
		iso2Countries
			at: each first
			put: each third.
		iso3Countries
			at: each second
			put: each third ]
]

{ #category : #'class initialization' }
WALocale class >> initializeLangaugeList [
	iso2Languages := Dictionary new.
	iso3Languages := Dictionary new.
	
	self languageList do: [ :each |
		each size > 2
			ifTrue: [
				iso2Languages at: each first put: each third.
				iso3Languages at: each second put: each third ]
			ifFalse: [
				iso3Languages at: each first put: each second ] ]
]

{ #category : #accessing }
WALocale class >> iso2Countries [
	^ iso2Countries
]

{ #category : #accessing }
WALocale class >> iso2Languages [
	^ iso2Languages
]

{ #category : #accessing }
WALocale class >> iso3Countries [
	^ iso3Countries
]

{ #category : #accessing }
WALocale class >> iso3Languages [
	^ iso3Languages
]

{ #category : #'instance creation' }
WALocale class >> language: aLanguageString [
	^ self new
		language: aLanguageString;
		yourself
]

{ #category : #'instance creation' }
WALocale class >> language: aLanguageString country: aCountryString [
	^ self new
		language: aLanguageString;
		country: aCountryString;
		yourself
]

{ #category : #accessing }
WALocale class >> languageList [
	^ #(('aa' 'aar' 'Afar') ('ab' 'abk' 'Abkhazian') ('ace' 'Achinese') ('ach' 'Acoli') ('ada' 'Adangme') ('ady' 'Adyghe; Adygei') ('afa' 'Afro-Asiatic (Other)') ('afh' 'Afrihili') ('af' 'afr' 'Afrikaans') ('ain' 'Ainu') ('ak' 'aka' 'Akan') ('akk' 'Akkadian') ('sq' 'alb' 'Albanian') ('ale' 'Aleut') ('alg' 'Algonquian languages') ('alt' 'Southern Altai') ('am' 'amh' 'Amharic') ('ang' 'English, Old (ca.450-1100)') ('anp' 'Angika') ('apa' 'Apache languages') ('ar' 'ara' 'Arabic') ('arc' 'Official Aramaic (700-300 BCE); Imperial Aramaic (700-300 BCE)') ('an' 'arg' 'Aragonese') ('hy' 'arm' 'Armenian') ('arn' 'Mapudungun; Mapuche') ('arp' 'Arapaho') ('art' 'Artificial (Other)') ('arw' 'Arawak') ('as' 'asm' 'Assamese') ('ast' 'Asturian; Bable; Leonese; Asturleonese') ('ath' 'Athapascan languages') ('aus' 'Australian languages') ('av' 'ava' 'Avaric') ('ae' 'ave' 'Avestan') ('awa' 'Awadhi') ('ay' 'aym' 'Aymara') ('az' 'aze' 'Azerbaijani') ('bad' 'Banda languages') ('bai' 'Bamileke languages') ('ba' 'bak' 'Bashkir') ('bal' 'Baluchi') ('bm' 'bam' 'Bambara') ('ban' 'Balinese') ('eu' 'baq' 'Basque') ('bas' 'Basa') ('bat' 'Baltic (Other)') ('bej' 'Beja; Bedawiyet') ('be' 'bel' 'Belarusian') ('bem' 'Bemba') ('bn' 'ben' 'Bengali') ('ber' 'Berber (Other)') ('bho' 'Bhojpuri') ('bh' 'bih' 'Bihari') ('bik' 'Bikol') ('bin' 'Bini; Edo') ('bi' 'bis' 'Bislama') ('bla' 'Siksika') ('bnt' 'Bantu (Other)') ('bs' 'bos' 'Bosnian') ('bra' 'Braj') ('br' 'bre' 'Breton') ('btk' 'Batak languages') ('bua' 'Buriat') ('bug' 'Buginese') ('bg' 'bul' 'Bulgarian') ('my' 'bur' 'Burmese') ('byn' 'Blin; Bilin') ('cad' 'Caddo') ('cai' 'Central American Indian (Other)') ('car' 'Galibi Carib') ('ca' 'cat' 'Catalan; Valencian') ('cau' 'Caucasian (Other)') ('ceb' 'Cebuano') ('cel' 'Celtic (Other)') ('ch' 'cha' 'Chamorro') ('chb' 'Chibcha') ('ce' 'che' 'Chechen') ('chg' 'Chagatai') ('zh' 'chi' 'Chinese') ('chk' 'Chuukese') ('chm' 'Mari') ('chn' 'Chinook jargon') ('cho' 'Choctaw') ('chp' 'Chipewyan; Dene Suline') ('chr' 'Cherokee') ('cu' 'chu' 'Church Slavic; Old Slavonic; Church Slavonic; Old Bulgarian; Old Church Slavonic') ('cv' 'chv' 'Chuvash') ('chy' 'Cheyenne') ('cmc' 'Chamic languages') ('cop' 'Coptic') ('kw' 'cor' 'Cornish') ('co' 'cos' 'Corsican') ('cpe' 'Creoles and pidgins, English based (Other)') ('cpf' 'Creoles and pidgins, French-based (Other)') ('cpp' 'Creoles and pidgins, Portuguese-based (Other)') ('cr' 'cre' 'Cree') ('crh' 'Crimean Tatar; Crimean Turkish') ('crp' 'Creoles and pidgins (Other)') ('csb' 'Kashubian') ('cus' 'Cushitic (Other)') ('cs' 'cze' 'Czech') ('dak' 'Dakota') ('da' 'dan' 'Danish') ('dar' 'Dargwa') ('day' 'Land Dayak languages') ('del' 'Delaware') ('den' 'Slave (Athapascan)') ('dgr' 'Dogrib') ('din' 'Dinka') ('dv' 'div' 'Divehi; Dhivehi; Maldivian') ('doi' 'Dogri') ('dra' 'Dravidian (Other)') ('dsb' 'Lower Sorbian') ('dua' 'Duala') ('dum' 'Dutch, Middle (ca.1050-1350)') ('nl' 'dut' 'Dutch; Flemish') ('dyu' 'Dyula') ('dz' 'dzo' 'Dzongkha') ('efi' 'Efik') ('egy' 'Egyptian (Ancient)') ('eka' 'Ekajuk') ('elx' 'Elamite') ('en' 'eng' 'English') ('enm' 'English, Middle (1100-1500)') ('eo' 'epo' 'Esperanto') ('et' 'est' 'Estonian') ('ee' 'ewe' 'Ewe') ('ewo' 'Ewondo') ('fan' 'Fang') ('fo' 'fao' 'Faroese') ('fat' 'Fanti') ('fj' 'fij' 'Fijian') ('fil' 'Filipino; Pilipino') ('fi' 'fin' 'Finnish') ('fiu' 'Finno-Ugrian (Other)') ('fon' 'Fon') ('fr' 'fre' 'French') ('frm' 'French, Middle (ca.1400-1600)') ('fro' 'French, Old (842-ca.1400)') ('frr' 'Northern Frisian') ('frs' 'Eastern Frisian') ('fy' 'fry' 'Western Frisian') ('ff' 'ful' 'Fulah') ('fur' 'Friulian') ('gaa' 'Ga') ('gay' 'Gayo') ('gba' 'Gbaya') ('gem' 'Germanic (Other)') ('ka' 'geo' 'Georgian') ('de' 'ger' 'German') ('gez' 'Geez') ('gil' 'Gilbertese') ('gd' 'gla' 'Gaelic; Scottish Gaelic') ('ga' 'gle' 'Irish') ('gl' 'glg' 'Galician') ('gv' 'glv' 'Manx') ('gmh' 'German, Middle High (ca.1050-1500)') ('goh' 'German, Old High (ca.750-1050)') ('gon' 'Gondi') ('gor' 'Gorontalo') ('got' 'Gothic') ('grb' 'Grebo') ('grc' 'Greek, Ancient (to 1453)') ('el' 'gre' 'Greek, Modern (1453-)') ('gn' 'grn' 'Guarani') ('gsw' 'Swiss German; Alemannic; Alsatian') ('gu' 'guj' 'Gujarati') ('gwi' 'Gwich''in') ('hai' 'Haida') ('ht' 'hat' 'Haitian; Haitian Creole') ('ha' 'hau' 'Hausa') ('haw' 'Hawaiian') ('he' 'heb' 'Hebrew') ('hz' 'her' 'Herero') ('hil' 'Hiligaynon') ('him' 'Himachali') ('hi' 'hin' 'Hindi') ('hit' 'Hittite') ('hmn' 'Hmong') ('ho' 'hmo' 'Hiri Motu') ('hsb' 'Upper Sorbian') ('hu' 'hun' 'Hungarian') ('hup' 'Hupa') ('iba' 'Iban') ('ig' 'ibo' 'Igbo') ('is' 'ice' 'Icelandic') ('io' 'ido' 'Ido') ('ii' 'iii' 'Sichuan Yi; Nuosu') ('ijo' 'Ijo languages') ('iu' 'iku' 'Inuktitut') ('ie' 'ile' 'Interlingue; Occidental') ('ilo' 'Iloko') ('ia' 'ina' 'Interlingua (International Auxiliary Language Association)') ('inc' 'Indic (Other)') ('id' 'ind' 'Indonesian') ('ine' 'Indo-European (Other)') ('inh' 'Ingush') ('ik' 'ipk' 'Inupiaq') ('ira' 'Iranian (Other)') ('iro' 'Iroquoian languages') ('it' 'ita' 'Italian') ('jv' 'jav' 'Javanese') ('jbo' 'Lojban') ('ja' 'jpn' 'Japanese') ('jpr' 'Judeo-Persian') ('jrb' 'Judeo-Arabic') ('kaa' 'Kara-Kalpak') ('kab' 'Kabyle') ('kac' 'Kachin; Jingpho') ('kl' 'kal' 'Kalaallisut; Greenlandic') ('kam' 'Kamba') ('kn' 'kan' 'Kannada') ('kar' 'Karen languages') ('ks' 'kas' 'Kashmiri') ('kr' 'kau' 'Kanuri') ('kaw' 'Kawi') ('kk' 'kaz' 'Kazakh') ('kbd' 'Kabardian') ('kha' 'Khasi') ('khi' 'Khoisan (Other)') ('km' 'khm' 'Central Khmer') ('kho' 'Khotanese') ('ki' 'kik' 'Kikuyu; Gikuyu') ('rw' 'kin' 'Kinyarwanda') ('ky' 'kir' 'Kirghiz; Kyrgyz') ('kmb' 'Kimbundu') ('kok' 'Konkani') ('kv' 'kom' 'Komi') ('kg' 'kon' 'Kongo') ('ko' 'kor' 'Korean') ('kos' 'Kosraean') ('kpe' 'Kpelle') ('krc' 'Karachay-Balkar') ('krl' 'Karelian') ('kro' 'Kru languages') ('kru' 'Kurukh') ('kj' 'kua' 'Kuanyama; Kwanyama') ('kum' 'Kumyk') ('ku' 'kur' 'Kurdish') ('kut' 'Kutenai') ('lad' 'Ladino') ('lah' 'Lahnda') ('lam' 'Lamba') ('lo' 'lao' 'Lao') ('la' 'lat' 'Latin') ('lv' 'lav' 'Latvian') ('lez' 'Lezghian') ('li' 'lim' 'Limburgan; Limburger; Limburgish') ('ln' 'lin' 'Lingala') ('lt' 'lit' 'Lithuanian') ('lol' 'Mongo') ('loz' 'Lozi') ('lb' 'ltz' 'Luxembourgish; Letzeburgesch') ('lua' 'Luba-Lulua') ('lu' 'lub' 'Luba-Katanga') ('lg' 'lug' 'Ganda') ('lui' 'Luiseno') ('lun' 'Lunda') ('luo' 'Luo (Kenya and Tanzania)') ('lus' 'Lushai') ('mk' 'mac' 'Macedonian') ('mad' 'Madurese') ('mag' 'Magahi') ('mh' 'mah' 'Marshallese') ('mai' 'Maithili') ('mak' 'Makasar') ('ml' 'mal' 'Malayalam') ('man' 'Mandingo') ('mi' 'mao' 'Maori') ('map' 'Austronesian (Other)') ('mr' 'mar' 'Marathi') ('mas' 'Masai') ('ms' 'may' 'Malay') ('mdf' 'Moksha') ('mdr' 'Mandar') ('men' 'Mende') ('mga' 'Irish, Middle (900-1200)') ('mic' 'Mi''kmaq; Micmac') ('min' 'Minangkabau') ('mis' 'Uncoded languages') ('mkh' 'Mon-Khmer (Other)') ('mg' 'mlg' 'Malagasy') ('mt' 'mlt' 'Maltese') ('mnc' 'Manchu') ('mni' 'Manipuri') ('mno' 'Manobo languages') ('moh' 'Mohawk') ('mo' 'mol' 'Moldavian') ('mn' 'mon' 'Mongolian') ('mos' 'Mossi') ('mul' 'Multiple languages') ('mun' 'Munda languages') ('mus' 'Creek') ('mwl' 'Mirandese') ('mwr' 'Marwari') ('myn' 'Mayan languages') ('myv' 'Erzya') ('nah' 'Nahuatl languages') ('nai' 'North American Indian') ('nap' 'Neapolitan') ('na' 'nau' 'Nauru') ('nv' 'nav' 'Navajo; Navaho') ('nr' 'nbl' 'Ndebele, South; South Ndebele') ('nd' 'nde' 'Ndebele, North; North Ndebele') ('ng' 'ndo' 'Ndonga') ('nds' 'Low German; Low Saxon; German, Low; Saxon, Low') ('ne' 'nep' 'Nepali') ('new' 'Nepal Bhasa; Newari') ('nia' 'Nias') ('nic' 'Niger-Kordofanian (Other)') ('niu' 'Niuean') ('nn' 'nno' 'Norwegian Nynorsk; Nynorsk, Norwegian') ('nb' 'nob' 'Bokmål, Norwegian; Norwegian Bokmål') ('nog' 'Nogai') ('non' 'Norse, Old') ('no' 'nor' 'Norwegian') ('nqo' 'N''Ko') ('nso' 'Pedi; Sepedi; Northern Sotho') ('nub' 'Nubian languages') ('nwc' 'Classical Newari; Old Newari; Classical Nepal Bhasa') ('ny' 'nya' 'Chichewa; Chewa; Nyanja') ('nym' 'Nyamwezi') ('nyn' 'Nyankole') ('nyo' 'Nyoro') ('nzi' 'Nzima') ('oc' 'oci' 'Occitan (post 1500); Provençal') ('oj' 'oji' 'Ojibwa') ('or' 'ori' 'Oriya') ('om' 'orm' 'Oromo') ('osa' 'Osage') ('os' 'oss' 'Ossetian; Ossetic') ('ota' 'Turkish, Ottoman (1500-1928)') ('oto' 'Otomian languages') ('paa' 'Papuan (Other)') ('pag' 'Pangasinan') ('pal' 'Pahlavi') ('pam' 'Pampanga; Kapampangan') ('pa' 'pan' 'Panjabi; Punjabi') ('pap' 'Papiamento') ('pau' 'Palauan') ('peo' 'Persian, Old (ca.600-400 B.C.)') ('fa' 'per' 'Persian') ('phi' 'Philippine (Other)') ('phn' 'Phoenician') ('pi' 'pli' 'Pali') ('pl' 'pol' 'Polish') ('pon' 'Pohnpeian') ('pt' 'por' 'Portuguese') ('pra' 'Prakrit languages') ('pro' 'Provençal, Old (to 1500)') ('ps' 'pus' 'Pushto; Pashto') ('qaa-qtz' 'Reserved for local use') ('qu' 'que' 'Quechua') ('raj' 'Rajasthani') ('rap' 'Rapanui') ('rar' 'Rarotongan; Cook Islands Maori') ('roa' 'Romance (Other)') ('rm' 'roh' 'Romansh') ('rom' 'Romany') ('ro' 'rum' 'Romanian') ('rn' 'run' 'Rundi') ('rup' 'Aromanian; Arumanian; Macedo-Romanian') ('ru' 'rus' 'Russian') ('sad' 'Sandawe') ('sg' 'sag' 'Sango') ('sah' 'Yakut') ('sai' 'South American Indian (Other)') ('sal' 'Salishan languages') ('sam' 'Samaritan Aramaic') ('sa' 'san' 'Sanskrit') ('sas' 'Sasak') ('sat' 'Santali') ('sr' 'scc' 'Serbian') ('scn' 'Sicilian') ('sco' 'Scots') ('hr' 'scr' 'Croatian') ('sel' 'Selkup') ('sem' 'Semitic (Other)') ('sga' 'Irish, Old (to 900)') ('sgn' 'Sign Languages') ('shn' 'Shan') ('sid' 'Sidamo') ('si' 'sin' 'Sinhala; Sinhalese') ('sio' 'Siouan languages') ('sit' 'Sino-Tibetan (Other)') ('sla' 'Slavic (Other)') ('sk' 'slo' 'Slovak') ('sl' 'slv' 'Slovenian') ('sma' 'Southern Sami') ('se' 'sme' 'Northern Sami') ('smi' 'Sami languages (Other)') ('smj' 'Lule Sami') ('smn' 'Inari Sami') ('sm' 'smo' 'Samoan') ('sms' 'Skolt Sami') ('sn' 'sna' 'Shona') ('sd' 'snd' 'Sindhi') ('snk' 'Soninke') ('sog' 'Sogdian') ('so' 'som' 'Somali') ('son' 'Songhai languages') ('st' 'sot' 'Sotho, Southern') ('es' 'spa' 'Spanish; Castilian') ('sc' 'srd' 'Sardinian') ('srn' 'Sranan Tongo') ('srr' 'Serer') ('ssa' 'Nilo-Saharan (Other)') ('ss' 'ssw' 'Swati') ('suk' 'Sukuma') ('su' 'sun' 'Sundanese') ('sus' 'Susu') ('sux' 'Sumerian') ('sw' 'swa' 'Swahili') ('sv' 'swe' 'Swedish') ('syc' 'Classical Syriac') ('syr' 'Syriac') ('ty' 'tah' 'Tahitian') ('tai' 'Tai (Other)') ('ta' 'tam' 'Tamil') ('tt' 'tat' 'Tatar') ('te' 'tel' 'Telugu') ('tem' 'Timne') ('ter' 'Tereno') ('tet' 'Tetum') ('tg' 'tgk' 'Tajik') ('tl' 'tgl' 'Tagalog') ('th' 'tha' 'Thai') ('bo' 'tib' 'Tibetan') ('tig' 'Tigre') ('ti' 'tir' 'Tigrinya') ('tiv' 'Tiv') ('tkl' 'Tokelau') ('tlh' 'Klingon; tlhIngan-Hol') ('tli' 'Tlingit') ('tmh' 'Tamashek') ('tog' 'Tonga (Nyasa)') ('to' 'ton' 'Tonga (Tonga Islands)') ('tpi' 'Tok Pisin') ('tsi' 'Tsimshian') ('tn' 'tsn' 'Tswana') ('ts' 'tso' 'Tsonga') ('tk' 'tuk' 'Turkmen') ('tum' 'Tumbuka') ('tup' 'Tupi languages') ('tr' 'tur' 'Turkish') ('tut' 'Altaic (Other)') ('tvl' 'Tuvalu') ('tw' 'twi' 'Twi') ('tyv' 'Tuvinian') ('udm' 'Udmurt') ('uga' 'Ugaritic') ('ug' 'uig' 'Uighur; Uyghur') ('uk' 'ukr' 'Ukrainian') ('umb' 'Umbundu') ('und' 'Undetermined') ('ur' 'urd' 'Urdu') ('uz' 'uzb' 'Uzbek') ('vai' 'Vai') ('ve' 'ven' 'Venda') ('vi' 'vie' 'Vietnamese') ('vo' 'vol' 'Volapük') ('vot' 'Votic') ('wak' 'Wakashan languages') ('wal' 'Walamo') ('war' 'Waray') ('was' 'Washo') ('cy' 'wel' 'Welsh') ('wen' 'Sorbian languages') ('wa' 'wln' 'Walloon') ('wo' 'wol' 'Wolof') ('xal' 'Kalmyk; Oirat') ('xh' 'xho' 'Xhosa') ('yao' 'Yao') ('yap' 'Yapese') ('yi' 'yid' 'Yiddish') ('yo' 'yor' 'Yoruba') ('ypk' 'Yupik languages') ('zap' 'Zapotec') ('zbl' 'Blissymbols; Blissymbolics; Bliss') ('zen' 'Zenaga') ('za' 'zha' 'Zhuang; Chuang') ('znd' 'Zande languages') ('zu' 'zul' 'Zulu') ('zun' 'Zuni') ('zxx' 'No linguistic content') ('zza' 'Zaza; Dimili; Dimli; Kirdki; Kirmanjki; Zazaki'))
]

{ #category : #accessing }
WALocale >> country [
	^ country
]

{ #category : #accessing }
WALocale >> country: aString [
	country := aString
]

{ #category : #accessing }
WALocale >> countryName [
	"answers the country name in english and all capitals"

	^ self country size = 2
		ifTrue: [ self class iso2Countries at: self country ]
		ifFalse: [ self class iso3Countries at: self country ]
]

{ #category : #converting }
WALocale >> greaseString [
	^ country isNil
		ifTrue: [
			"optimization, no need for allocation at all"
			language ]
		ifFalse: [
			| string stream |
			"allocate with correct size, avoid copy"
			string := String new: language size + 1 + country size.
			stream := WriteStream on: string.
			stream
				nextPutAll: language;
				nextPut: $-;
				nextPutAll: country.
			"no need for #contents because we allocated with the correct size"
			^ string ]
]

{ #category : #accessing }
WALocale >> language [
	^ language
]

{ #category : #accessing }
WALocale >> language: aString [
	language := aString
]

{ #category : #accessing }
WALocale >> languageName [
	"answers the language name in english and all capitals"

	^ self language size = 2
		ifTrue: [ self class iso2Languages at: self language ]
		ifFalse: [ self class iso3Languages at: self language ]
]

{ #category : #printing }
WALocale >> printOn: aStream [ 
	super printOn: aStream.
	aStream
		nextPut: $(;
		nextPutAll: self greaseString;
		nextPut: $)
]

{ #category : #copying }
WALocale >> withoutCountry [
	"Answer a copy with the language but no country."
	^ WALocale language: self language country: nil
]

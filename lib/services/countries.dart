class CountriesApi {
  static int chosenPresetLength = 255;
  static List<String> chosenPreset = [
    "AD", "AE", "AF", "AG", "AI", "AL", "AM", "AO", "AQ", "AR", "AS", "AT", "AU", "AW", "AX", "AZ", "BA", "BB", "BD", "BE", "BF", "BG", "BH", "BI", "BJ",
    "BL", "BM", "BN", "BO", "BQ", "BR", "BS", "BT", "BV", "BW", "BY", "BZ", "CA", "CC", "CD", "CF", "CG", "CH", "CI", "CK", "CL", "CM", "CN", "CO", "CR",
    "CU", "CV", "CW", "CX", "CY", "CZ", "DE", "DJ", "DK", "DM", "DO", "DZ", "EC", "EE", "EG", "EH", "ER", "ES", "ET", "EU", "FI", "FJ", "FK", "FM", "FO",
    "FR", "GA", "GB-ENG", "GB-NIR", "GB-SCT", "GB-WLS", "GB", "GD", "GE", "GF", "GG", "GH", "GI", "GL", "GM", "GN", "GP", "GQ", "GR", "GS", "GT", "GU", "GW", "GY", "HK", 
    "HM", "HN", "HR", "HT", "HU", "ID", "IE", "IL", "IM", "IN", "IO", "IQ", "IR", "IS", "IT", "JE", "JM", "JO", "JP", "KE", "KG", "KH", "KI", "KM", "KN",
    "KP", "KR", "KW", "KY", "KZ", "LA", "LB", "LC", "LI", "LK", "LR", "LS", "LT", "LU", "LV", "LY", "MA", "MC", "MD", "ME", "MF", "MG", "MH", "MK", "ML",
    "MM", "MN", "MO", "MP", "MQ", "MR", "MS", "MT", "MU", "MV", "MW", "MX", "MY", "MZ", "NA", "NC", "NE", "NF", "NG", "NI", "NL", "NO", "NP", "NR", "NU",
    "NZ", "OM", "PA", "PE", "PF", "PG", "PH", "PK", "PL", "PM", "PN", "PR", "PS", "PT", "PW", "PY", "QA", "RE", "RO", "RS", "RU", "RW", "SA", "SB", "SC",
    "SD", "SE", "SG", "SH", "SI", "SJ", "SK", "SL", "SM", "SN", "SO", "SR", "SS", "ST", "SV", "SX", "SY", "SZ", "TC", "TD", "TF", "TG", "TH", "TJ", "TK",
    "TL", "TM", "TN", "TO", "TR", "TT", "TV", "TW", "TZ", "UA", "UG", "UM", "US", "UY", "UZ", "VA", "VC", "VE", "VG", "VI", "VN", "VU", "WF", "WS", "XK",
    "YE", "YT", "ZA", "ZM", "ZW",
  ];

  static List<String> allCountries = [
    "AD", "AE", "AF", "AG", "AI", "AL", "AM", "AO", "AQ", "AR", "AS", "AT", "AU", "AW", "AX", "AZ", "BA", "BB", "BD", "BE", "BF", "BG", "BH", "BI", "BJ",
    "BL", "BM", "BN", "BO", "BQ", "BR", "BS", "BT", "BV", "BW", "BY", "BZ", "CA", "CC", "CD", "CF", "CG", "CH", "CI", "CK", "CL", "CM", "CN", "CO", "CR",
    "CU", "CV", "CW", "CX", "CY", "CZ", "DE", "DJ", "DK", "DM", "DO", "DZ", "EC", "EE", "EG", "EH", "ER", "ES", "ET", "EU", "FI", "FJ", "FK", "FM", "FO",
    "FR", "GA", "GB-ENG", "GB-NIR", "GB-SCT", "GB-WLS", "GB", "GD", "GE", "GF", "GG", "GH", "GI", "GL", "GM", "GN", "GP", "GQ", "GR", "GS", "GT", "GU", "GW", "GY", "HK", 
    "HM", "HN", "HR", "HT", "HU", "ID", "IE", "IL", "IM", "IN", "IO", "IQ", "IR", "IS", "IT", "JE", "JM", "JO", "JP", "KE", "KG", "KH", "KI", "KM", "KN",
    "KP", "KR", "KW", "KY", "KZ", "LA", "LB", "LC", "LI", "LK", "LR", "LS", "LT", "LU", "LV", "LY", "MA", "MC", "MD", "ME", "MF", "MG", "MH", "MK", "ML",
    "MM", "MN", "MO", "MP", "MQ", "MR", "MS", "MT", "MU", "MV", "MW", "MX", "MY", "MZ", "NA", "NC", "NE", "NF", "NG", "NI", "NL", "NO", "NP", "NR", "NU",
    "NZ", "OM", "PA", "PE", "PF", "PG", "PH", "PK", "PL", "PM", "PN", "PR", "PS", "PT", "PW", "PY", "QA", "RE", "RO", "RS", "RU", "RW", "SA", "SB", "SC",
    "SD", "SE", "SG", "SH", "SI", "SJ", "SK", "SL", "SM", "SN", "SO", "SR", "SS", "ST", "SV", "SX", "SY", "SZ", "TC", "TD", "TF", "TG", "TH", "TJ", "TK",
    "TL", "TM", "TN", "TO", "TR", "TT", "TV", "TW", "TZ", "UA", "UG", "UM", "US", "UY", "UZ", "VA", "VC", "VE", "VG", "VI", "VN", "VU", "WF", "WS", "XK",
    "YE", "YT", "ZA", "ZM", "ZW",
  ]; // length: 255

  static List<String> sporclePreset = [
    "AD", "AE", "AF", "AG", "AL", "AM", "AO", "AR", "AT", "AU", "AZ", "BA", "BB", "BD", "BE", "BF", "BG", "BH", "BI", "BJ", "BN", "BO", "BR",
    "BS", "BT", "BW", "BY", "BZ", "CA", "CD", "CF", "CG", "CH", "CI", "CL", "CM", "CN", "CO", "CR", "CU", "CV", "CY", "CZ", "DE", "DJ", "DK", "DM",
    "DO", "DZ", "EC", "EE", "EG", "ER", "ES", "ET", "FI", "FJ", "FM", "FO", "FR", "GA", "GB", "GD", "GE", "GG", "GH", "GI", "GL", "GM", "GN", "GQ",
    "GR", "GT", "GU", "GW", "GY", "HK", "HN", "HR", "HT", "HU", "ID", "IE", "IL", "IN", "IQ", "IR", "IS", "IT", "JM", "JO", "JP", "KE", "KG", "KH", "KI",
    "KM", "KN", "KP", "KR", "KW", "KZ", "LA", "LB", "LC", "LI", "LK", "LR", "LS", "LT", "LU", "LV", "LY", "MA", "MC", "MD", "ME", "MG", "MH", "MK", "ML",
    "MM", "MN", "MR", "MT", "MU", "MV", "MW", "MX", "MY", "MZ", "NA", "NE", "NG", "NI", "NL", "NO", "NP", "NR", "NZ", "OM", "PA", "PE", "PG", "PH",
    "PK", "PL", "PS", "PT", "PW", "PY", "QA", "RO", "RS", "RU", "RW", "SA", "SB", "SC", "SD", "SE", "SG", "SI", "SK", "SL", "SM", "SN", "SO", "SR", "SS",
    "ST", "SV", "SY", "SZ", "TD", "TG", "TH", "TJ", "TM", "TN", "TO", "TR", "TT", "TV", "TW", "TZ", "UA", "UG", "US", "UY", "UZ", "VA", "VC", "VE", "VN",
    "VU", "WS", "XK", "YE", "ZA", "ZM", "ZW",
  ];
  
  static List<String> europePreset = [];

  static List<String> africaPreset = [];

  static List<String> asiaPreset = [];

  static String? getNameFromKey(String key) {
    Map<String, String> countriesMap = {
      "AD": "Andorra",
      "AE": "UAE", //United Arab Emirates
      "AF": "Afghanistan",
      "AG": "Antigua and Barbuda",
      "AI": "Anguilla",
      "AL": "Albania",
      "AM": "Armenia",
      "AO": "Angola",
      "AQ": "Antarctica",
      "AR": "Argentina",
      "AS": "American Samoa",
      "AT": "Austria",
      "AU": "Australia",
      "AW": "Aruba",
      "AX": "\u00c5land Islands",
      "AZ": "Azerbaijan",
      "BA": "Bosnia and Herzegovina",
      "BB": "Barbados",
      "BD": "Bangladesh",
      "BE": "Belgium",
      "BF": "Burkina Faso",
      "BG": "Bulgaria",
      "BH": "Bahrain",
      "BI": "Burundi",
      "BJ": "Benin",
      "BL": "Saint Barthélemy",
      "BM": "Bermuda",
      "BN": "Brunei", // Brunei Darussalam
      "BO": "Bolivia",
      "BQ": "Caribbean Netherlands",
      "BR": "Brazil",
      "BS": "Bahamas",
      "BT": "Bhutan",
      "BV": "Bouvet Island",
      "BW": "Botswana",
      "BY": "Belarus",
      "BZ": "Belize",
      "CA": "Canada",
      "CC": "Cocos Islands", // Cocos (Keeling) Islands
      "CD": "DRC", // Democratic Republic of the Congo
      "CF": "Central African Republic",
      "CG": "Republic of the Congo",
      "CH": "Switzerland",
      "CI": "Ivory Coast", // C\u00f4te d'Ivoire
      "CK": "Cook Islands",
      "CL": "Chile",
      "CM": "Cameroon",
      "CN": "China",
      "CO": "Colombia",
      "CR": "Costa Rica",
      "CU": "Cuba",
      "CV": "Cape Verde",
      "CW": "Cura\u00e7ao",
      "CX": "Christmas Island",
      "CY": "Cyprus",
      "CZ": "Czechia", // Czech Republic
      "DE": "Germany",
      "DJ": "Djibouti",
      "DK": "Denmark",
      "DM": "Dominica",
      "DO": "Dominican Republic",
      "DZ": "Algeria",
      "EC": "Ecuador",
      "EE": "Estonia",
      "EG": "Egypt",
      "EH": "Western Sahara",
      "ER": "Eritrea",
      "ES": "Spain",
      "ET": "Ethiopia",
      "EU": "Europe",
      "FI": "Finland",
      "FJ": "Fiji",
      "FK": "Falkland Islands (Malvinas)",
      "FM": "Micronesia",
      "FO": "Faroe Islands",
      "FR": "France",
      "GA": "Gabon",
      "GB-ENG": "England",
      "GB-NIR": "Northern Ireland",
      "GB-SCT": "Scotland",
      "GB-WLS": "Wales",
      "GB": "UK", // United Kingdom
      "GD": "Grenada",
      "GE": "Georgia",
      "GF": "French Guiana",
      "GG": "Guernsey",
      "GH": "Ghana",
      "GI": "Gibraltar",
      "GL": "Greenland",
      "GM": "Gambia",
      "GN": "Guinea",
      "GP": "Guadeloupe",
      "GQ": "Equatorial Guinea",
      "GR": "Greece",
      "GS": "South Georgia and the South Sandwich Islands",
      "GT": "Guatemala",
      "GU": "Guam",
      "GW": "Guinea Bissau",
      "GY": "Guyana",
      "HK": "Hong Kong",
      "HM": "Heard Island and McDonald Islands",
      "HN": "Honduras",
      "HR": "Croatia",
      "HT": "Haiti",
      "HU": "Hungary",
      "ID": "Indonesia",
      "IE": "Ireland",
      "IL": "Israel",
      "IM": "Isle of Man",
      "IN": "India",
      "IO": "British Indian Ocean Territory",
      "IQ": "Iraq",
      "IR": "Iran",
      "IS": "Iceland",
      "IT": "Italy",
      "JE": "Jersey",
      "JM": "Jamaica",
      "JO": "Jordan",
      "JP": "Japan",
      "KE": "Kenya",
      "KG": "Kyrgyzstan",
      "KH": "Cambodia",
      "KI": "Kiribati",
      "KM": "Comoros",
      "KN": "Saint Kitts and Nevis",
      "KP": "North Korea",
      "KR": "South Korea",
      "KW": "Kuwait",
      "KY": "Cayman Islands",
      "KZ": "Kazakhstan",
      "LA": "Laos", // (Lao People's Democratic Republic)
      "LB": "Lebanon",
      "LC": "Saint Lucia",
      "LI": "Liechtenstein",
      "LK": "Sri Lanka",
      "LR": "Liberia",
      "LS": "Lesotho",
      "LT": "Lithuania",
      "LU": "Luxembourg",
      "LV": "Latvia",
      "LY": "Libya",
      "MA": "Morocco",
      "MC": "Monaco",
      "MD": "Moldova",
      "ME": "Montenegro",
      "MF": "Saint Martin",
      "MG": "Madagascar",
      "MH": "Marshall Islands",
      "MK": "North Macedonia",
      "ML": "Mali",
      "MM": "Myanmar",
      "MN": "Mongolia",
      "MO": "Macao",
      "MP": "Northern Mariana Islands",
      "MQ": "Martinique",
      "MR": "Mauritania",
      "MS": "Montserrat",
      "MT": "Malta",
      "MU": "Mauritius",
      "MV": "Maldives",
      "MW": "Malawi",
      "MX": "Mexico",
      "MY": "Malaysia",
      "MZ": "Mozambique",
      "NA": "Namibia",
      "NC": "New Caledonia",
      "NE": "Niger",
      "NF": "Norfolk Island",
      "NG": "Nigeria",
      "NI": "Nicaragua",
      "NL": "Netherlands",
      "NO": "Norway",
      "NP": "Nepal",
      "NR": "Nauru",
      "NU": "Niue",
      "NZ": "New Zealand",
      "OM": "Oman",
      "PA": "Panama",
      "PE": "Peru",
      "PF": "French Polynesia",
      "PG": "Papua New Guinea",
      "PH": "Philippines",
      "PK": "Pakistan",
      "PL": "Poland",
      "PM": "Saint Pierre and Miquelon",
      "PN": "Pitcairn",
      "PR": "Puerto Rico",
      "PS": "Palestine",
      "PT": "Portugal",
      "PW": "Palau",
      "PY": "Paraguay",
      "QA": "Qatar",
      "RE": "Réunion",
      "RO": "Romania",
      "RS": "Serbia",
      "RU": "Russia",
      "RW": "Rwanda",
      "SA": "Saudi Arabia",
      "SB": "Solomon Islands",
      "SC": "Seychelles",
      "SD": "Sudan",
      "SE": "Sweden",
      "SG": "Singapore",
      "SH": "Saint Helena, Ascension and Tristan da Cunha",
      "SI": "Slovenia",
      "SJ": "Svalbard and Jan Mayen Islands",
      "SK": "Slovakia",
      "SL": "Sierra Leone",
      "SM": "San Marino",
      "SN": "Senegal",
      "SO": "Somalia",
      "SR": "Suriname",
      "SS": "South Sudan",
      "ST": "Sao Tome and Principe",
      "SV": "El Salvador",
      "SX": "Sint Maarten (Dutch part)",
      "SY": "Syria",
      "SZ": "Eswatini", // Swaziland
      "TC": "Turks and Caicos Islands",
      "TD": "Chad",
      "TF": "French Southern Territories",
      "TG": "Togo",
      "TH": "Thailand",
      "TJ": "Tajikistan",
      "TK": "Tokelau",
      "TL": "Timor-Leste",
      "TM": "Turkmenistan",
      "TN": "Tunisia",
      "TO": "Tonga",
      "TR": "Turkey",
      "TT": "Trinidad and Tobago",
      "TV": "Tuvalu",
      "TW": "Taiwan",
      "TZ": "Tanzania",
      "UA": "Ukraine",
      "UG": "Uganda",
      "UM": "US Minor Outlying Islands",
      "US": "US", //United States
      "UY": "Uruguay",
      "UZ": "Uzbekistan",
      "VA": "Vatican", // Holy See (Vatican City State)
      "VC": "Saint Vincent and the Grenadines",
      "VE": "Venezuela",
      "VG": "Virgin Islands, British",
      "VI": "Virgin Islands, U.S.",
      "VN": "Vietnam",
      "VU": "Vanuatu",
      "WF": "Wallis and Futuna Islands",
      "WS": "Samoa",
      "XK": "Kosovo",
      "YE": "Yemen",
      "YT": "Mayotte",
      "ZA": "South Africa",
      "ZM": "Zambia",
      "ZW": "Zimbabwe"
    };
    return countriesMap[key];
  }
}

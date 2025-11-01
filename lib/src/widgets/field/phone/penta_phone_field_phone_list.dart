part of 'penta_phone_field.dart';

class PhoneList {
  const PhoneList._();

  static Map<PentaPhoneFieldCountryCodesEnum, PentaPhoneFieldPhoneInfo>
  phoneList({
    String languageCode = 'en',
  }) => {
    PentaPhoneFieldCountryCodesEnum.afghanistan: PentaPhoneFieldPhoneInfo(
      countryName: _getCountryNameByLanguage(
        countryCode: PentaPhoneFieldCountryCodesEnum.afghanistan,
        languageCode: languageCode,
      ),
      countryCode: 'AF',
      dialCode: '+93',
      flag: '🇦🇫',
      minLength: 9,
      maxLength: 9,
    ),
    PentaPhoneFieldCountryCodesEnum.albania: PentaPhoneFieldPhoneInfo(
      countryName: _getCountryNameByLanguage(
        countryCode: PentaPhoneFieldCountryCodesEnum.albania,
        languageCode: languageCode,
      ),
      countryCode: 'AL',
      dialCode: '+355',
      flag: '🇦🇱',
      minLength: 8,
      maxLength: 9,
    ),
    PentaPhoneFieldCountryCodesEnum.algeria: PentaPhoneFieldPhoneInfo(
      countryName: _getCountryNameByLanguage(
        countryCode: PentaPhoneFieldCountryCodesEnum.algeria,
        languageCode: languageCode,
      ),
      countryCode: 'DZ',
      dialCode: '+213',
      flag: '🇩🇿',
      minLength: 9,
      maxLength: 9,
    ),
    PentaPhoneFieldCountryCodesEnum.andorra: PentaPhoneFieldPhoneInfo(
      countryName: _getCountryNameByLanguage(
        countryCode: PentaPhoneFieldCountryCodesEnum.andorra,
        languageCode: languageCode,
      ),
      countryCode: 'AD',
      dialCode: '+376',
      flag: '🇦🇩',
      minLength: 6,
      maxLength: 6,
    ),
    PentaPhoneFieldCountryCodesEnum.angola: PentaPhoneFieldPhoneInfo(
      countryName: _getCountryNameByLanguage(
        countryCode: PentaPhoneFieldCountryCodesEnum.angola,
        languageCode: languageCode,
      ),
      countryCode: 'AO',
      dialCode: '+244',
      flag: '🇦🇴',
      minLength: 9,
      maxLength: 9,
    ),
    PentaPhoneFieldCountryCodesEnum.antiguaAndBarbuda: PentaPhoneFieldPhoneInfo(
      countryName: _getCountryNameByLanguage(
        countryCode: PentaPhoneFieldCountryCodesEnum.antiguaAndBarbuda,
        languageCode: languageCode,
      ),
      countryCode: 'AG',
      dialCode: '+1268',
      flag: '🇦🇬',
      minLength: 7,
      maxLength: 7,
    ),
    PentaPhoneFieldCountryCodesEnum.argentina: PentaPhoneFieldPhoneInfo(
      countryName: _getCountryNameByLanguage(
        countryCode: PentaPhoneFieldCountryCodesEnum.argentina,
        languageCode: languageCode,
      ),
      countryCode: 'AR',
      dialCode: '+54',
      flag: '🇦🇷',
      minLength: 10,
      maxLength: 10,
    ),
    PentaPhoneFieldCountryCodesEnum.armenia: PentaPhoneFieldPhoneInfo(
      countryName: _getCountryNameByLanguage(
        countryCode: PentaPhoneFieldCountryCodesEnum.armenia,
        languageCode: languageCode,
      ),
      countryCode: 'AM',
      dialCode: '+374',
      flag: '🇦🇲',
      minLength: 8,
      maxLength: 8,
    ),
    PentaPhoneFieldCountryCodesEnum.australia: PentaPhoneFieldPhoneInfo(
      countryName: _getCountryNameByLanguage(
        countryCode: PentaPhoneFieldCountryCodesEnum.australia,
        languageCode: languageCode,
      ),
      countryCode: 'AU',
      dialCode: '+61',
      flag: '🇦🇺',
      minLength: 9,
      maxLength: 9,
    ),
    PentaPhoneFieldCountryCodesEnum.austria: PentaPhoneFieldPhoneInfo(
      countryName: _getCountryNameByLanguage(
        countryCode: PentaPhoneFieldCountryCodesEnum.austria,
        languageCode: languageCode,
      ),
      countryCode: 'AT',
      dialCode: '+43',
      flag: '🇦🇹',
      minLength: 10,
      maxLength: 13,
    ),
    PentaPhoneFieldCountryCodesEnum.azerbaijan: PentaPhoneFieldPhoneInfo(
      countryName: _getCountryNameByLanguage(
        countryCode: PentaPhoneFieldCountryCodesEnum.azerbaijan,
        languageCode: languageCode,
      ),
      countryCode: 'AZ',
      dialCode: '+994',
      flag: '🇦🇿',
      minLength: 9,
      maxLength: 9,
    ),
    PentaPhoneFieldCountryCodesEnum.bahamas: PentaPhoneFieldPhoneInfo(
      countryName: _getCountryNameByLanguage(
        countryCode: PentaPhoneFieldCountryCodesEnum.bahamas,
        languageCode: languageCode,
      ),
      countryCode: 'BS',
      dialCode: '+1242',
      flag: '🇧🇸',
      minLength: 7,
      maxLength: 7,
    ),
    PentaPhoneFieldCountryCodesEnum.bahrain: PentaPhoneFieldPhoneInfo(
      countryName: _getCountryNameByLanguage(
        countryCode: PentaPhoneFieldCountryCodesEnum.bahrain,
        languageCode: languageCode,
      ),
      countryCode: 'BH',
      dialCode: '+973',
      flag: '🇧🇭',
      minLength: 8,
      maxLength: 8,
    ),
    PentaPhoneFieldCountryCodesEnum.bangladesh: PentaPhoneFieldPhoneInfo(
      countryName: _getCountryNameByLanguage(
        countryCode: PentaPhoneFieldCountryCodesEnum.bangladesh,
        languageCode: languageCode,
      ),
      countryCode: 'BD',
      dialCode: '+880',
      flag: '🇧🇩',
      minLength: 10,
      maxLength: 10,
    ),
    PentaPhoneFieldCountryCodesEnum.barbados: PentaPhoneFieldPhoneInfo(
      countryName: _getCountryNameByLanguage(
        countryCode: PentaPhoneFieldCountryCodesEnum.barbados,
        languageCode: languageCode,
      ),
      countryCode: 'BB',
      dialCode: '+1246',
      flag: '🇧🇧',
      minLength: 7,
      maxLength: 7,
    ),
    PentaPhoneFieldCountryCodesEnum.belarus: PentaPhoneFieldPhoneInfo(
      countryName: _getCountryNameByLanguage(
        countryCode: PentaPhoneFieldCountryCodesEnum.belarus,
        languageCode: languageCode,
      ),
      countryCode: 'BY',
      dialCode: '+375',
      flag: '🇧🇾',
      minLength: 9,
      maxLength: 9,
    ),
    PentaPhoneFieldCountryCodesEnum.belgium: PentaPhoneFieldPhoneInfo(
      countryName: _getCountryNameByLanguage(
        countryCode: PentaPhoneFieldCountryCodesEnum.belgium,
        languageCode: languageCode,
      ),
      countryCode: 'BE',
      dialCode: '+32',
      flag: '🇧🇪',
      minLength: 8,
      maxLength: 9,
    ),
    PentaPhoneFieldCountryCodesEnum.belize: PentaPhoneFieldPhoneInfo(
      countryName: _getCountryNameByLanguage(
        countryCode: PentaPhoneFieldCountryCodesEnum.belize,
        languageCode: languageCode,
      ),
      countryCode: 'BZ',
      dialCode: '+501',
      flag: '🇧🇿',
      minLength: 7,
      maxLength: 7,
    ),
    PentaPhoneFieldCountryCodesEnum.benin: PentaPhoneFieldPhoneInfo(
      countryName: _getCountryNameByLanguage(
        countryCode: PentaPhoneFieldCountryCodesEnum.benin,
        languageCode: languageCode,
      ),
      countryCode: 'BJ',
      dialCode: '+229',
      flag: '🇧🇯',
      minLength: 8,
      maxLength: 8,
    ),
    PentaPhoneFieldCountryCodesEnum.bhutan: PentaPhoneFieldPhoneInfo(
      countryName: _getCountryNameByLanguage(
        countryCode: PentaPhoneFieldCountryCodesEnum.bhutan,
        languageCode: languageCode,
      ),
      countryCode: 'BT',
      dialCode: '+975',
      flag: '🇧🇹',
      minLength: 8,
      maxLength: 8,
    ),
    PentaPhoneFieldCountryCodesEnum.bolivia: PentaPhoneFieldPhoneInfo(
      countryName: _getCountryNameByLanguage(
        countryCode: PentaPhoneFieldCountryCodesEnum.bolivia,
        languageCode: languageCode,
      ),
      countryCode: 'BO',
      dialCode: '+591',
      flag: '🇧🇴',
      minLength: 8,
      maxLength: 8,
    ),
    PentaPhoneFieldCountryCodesEnum
        .bosniaAndHerzegovina: PentaPhoneFieldPhoneInfo(
      countryName: _getCountryNameByLanguage(
        countryCode: PentaPhoneFieldCountryCodesEnum.bosniaAndHerzegovina,
        languageCode: languageCode,
      ),
      countryCode: 'BA',
      dialCode: '+387',
      flag: '🇧🇦',
      minLength: 8,
      maxLength: 8,
    ),
    PentaPhoneFieldCountryCodesEnum.botswana: PentaPhoneFieldPhoneInfo(
      countryName: _getCountryNameByLanguage(
        countryCode: PentaPhoneFieldCountryCodesEnum.botswana,
        languageCode: languageCode,
      ),
      countryCode: 'BW',
      dialCode: '+267',
      flag: '🇧🇼',
      minLength: 8,
      maxLength: 8,
    ),
    PentaPhoneFieldCountryCodesEnum.brazil: PentaPhoneFieldPhoneInfo(
      countryName: _getCountryNameByLanguage(
        countryCode: PentaPhoneFieldCountryCodesEnum.brazil,
        languageCode: languageCode,
      ),
      countryCode: 'BR',
      dialCode: '+55',
      flag: '🇧🇷',
      minLength: 10,
      maxLength: 11,
    ),
    PentaPhoneFieldCountryCodesEnum.brunei: PentaPhoneFieldPhoneInfo(
      countryName: _getCountryNameByLanguage(
        countryCode: PentaPhoneFieldCountryCodesEnum.brunei,
        languageCode: languageCode,
      ),
      countryCode: 'BN',
      dialCode: '+673',
      flag: '🇧🇳',
      minLength: 7,
      maxLength: 7,
    ),
    PentaPhoneFieldCountryCodesEnum.bulgaria: PentaPhoneFieldPhoneInfo(
      countryName: _getCountryNameByLanguage(
        countryCode: PentaPhoneFieldCountryCodesEnum.bulgaria,
        languageCode: languageCode,
      ),
      countryCode: 'BG',
      dialCode: '+359',
      flag: '🇧🇬',
      minLength: 8,
      maxLength: 9,
    ),
    PentaPhoneFieldCountryCodesEnum.burkinaFaso: PentaPhoneFieldPhoneInfo(
      countryName: _getCountryNameByLanguage(
        countryCode: PentaPhoneFieldCountryCodesEnum.burkinaFaso,
        languageCode: languageCode,
      ),
      countryCode: 'BF',
      dialCode: '+226',
      flag: '🇧🇫',
      minLength: 8,
      maxLength: 8,
    ),
    PentaPhoneFieldCountryCodesEnum.burundi: PentaPhoneFieldPhoneInfo(
      countryName: _getCountryNameByLanguage(
        countryCode: PentaPhoneFieldCountryCodesEnum.burundi,
        languageCode: languageCode,
      ),
      countryCode: 'BI',
      dialCode: '+257',
      flag: '🇧🇮',
      minLength: 8,
      maxLength: 8,
    ),
    PentaPhoneFieldCountryCodesEnum.cambodia: PentaPhoneFieldPhoneInfo(
      countryName: _getCountryNameByLanguage(
        countryCode: PentaPhoneFieldCountryCodesEnum.cambodia,
        languageCode: languageCode,
      ),
      countryCode: 'KH',
      dialCode: '+855',
      flag: '🇰🇭',
      minLength: 8,
      maxLength: 9,
    ),
    PentaPhoneFieldCountryCodesEnum.cameroon: PentaPhoneFieldPhoneInfo(
      countryName: _getCountryNameByLanguage(
        countryCode: PentaPhoneFieldCountryCodesEnum.cameroon,
        languageCode: languageCode,
      ),
      countryCode: 'CM',
      dialCode: '+237',
      flag: '🇨🇲',
      minLength: 8,
      maxLength: 8,
    ),
    PentaPhoneFieldCountryCodesEnum.canada: PentaPhoneFieldPhoneInfo(
      countryName: _getCountryNameByLanguage(
        countryCode: PentaPhoneFieldCountryCodesEnum.canada,
        languageCode: languageCode,
      ),
      countryCode: 'CA',
      dialCode: '+1',
      flag: '🇨🇦',
      minLength: 10,
      maxLength: 10,
    ),
    PentaPhoneFieldCountryCodesEnum.capeVerde: PentaPhoneFieldPhoneInfo(
      countryName: _getCountryNameByLanguage(
        countryCode: PentaPhoneFieldCountryCodesEnum.capeVerde,
        languageCode: languageCode,
      ),
      countryCode: 'CV',
      dialCode: '+238',
      flag: '🇨🇻',
      minLength: 7,
      maxLength: 7,
    ),
    PentaPhoneFieldCountryCodesEnum
        .centralAfricanRepublic: PentaPhoneFieldPhoneInfo(
      countryName: _getCountryNameByLanguage(
        countryCode: PentaPhoneFieldCountryCodesEnum.centralAfricanRepublic,
        languageCode: languageCode,
      ),
      countryCode: 'CF',
      dialCode: '+236',
      flag: '🇨🇫',
      minLength: 8,
      maxLength: 8,
    ),
    PentaPhoneFieldCountryCodesEnum.chad: PentaPhoneFieldPhoneInfo(
      countryName: _getCountryNameByLanguage(
        countryCode: PentaPhoneFieldCountryCodesEnum.chad,
        languageCode: languageCode,
      ),
      countryCode: 'TD',
      dialCode: '+235',
      flag: '🇹🇩',
      minLength: 8,
      maxLength: 8,
    ),
    PentaPhoneFieldCountryCodesEnum.chile: PentaPhoneFieldPhoneInfo(
      countryName: _getCountryNameByLanguage(
        countryCode: PentaPhoneFieldCountryCodesEnum.chile,
        languageCode: languageCode,
      ),
      countryCode: 'CL',
      dialCode: '+56',
      flag: '🇨🇱',
      minLength: 9,
      maxLength: 9,
    ),
    PentaPhoneFieldCountryCodesEnum.china: PentaPhoneFieldPhoneInfo(
      countryName: _getCountryNameByLanguage(
        countryCode: PentaPhoneFieldCountryCodesEnum.china,
        languageCode: languageCode,
      ),
      countryCode: 'CN',
      dialCode: '+86',
      flag: '🇨🇳',
      minLength: 11,
      maxLength: 11,
    ),
    PentaPhoneFieldCountryCodesEnum.colombia: PentaPhoneFieldPhoneInfo(
      countryName: _getCountryNameByLanguage(
        countryCode: PentaPhoneFieldCountryCodesEnum.colombia,
        languageCode: languageCode,
      ),
      countryCode: 'CO',
      dialCode: '+57',
      flag: '🇨🇴',
      minLength: 10,
      maxLength: 10,
    ),
    PentaPhoneFieldCountryCodesEnum.comoros: PentaPhoneFieldPhoneInfo(
      countryName: _getCountryNameByLanguage(
        countryCode: PentaPhoneFieldCountryCodesEnum.comoros,
        languageCode: languageCode,
      ),
      countryCode: 'KM',
      dialCode: '+269',
      flag: '🇰🇲',
      minLength: 7,
      maxLength: 7,
    ),
    PentaPhoneFieldCountryCodesEnum.congo: PentaPhoneFieldPhoneInfo(
      countryName: _getCountryNameByLanguage(
        countryCode: PentaPhoneFieldCountryCodesEnum.congo,
        languageCode: languageCode,
      ),
      countryCode: 'CG',
      dialCode: '+242',
      flag: '🇨🇬',
      minLength: 9,
      maxLength: 9,
    ),
    PentaPhoneFieldCountryCodesEnum.costaRica: PentaPhoneFieldPhoneInfo(
      countryName: _getCountryNameByLanguage(
        countryCode: PentaPhoneFieldCountryCodesEnum.costaRica,
        languageCode: languageCode,
      ),
      countryCode: 'CR',
      dialCode: '+506',
      flag: '🇨🇷',
      minLength: 8,
      maxLength: 8,
    ),
    PentaPhoneFieldCountryCodesEnum.croatia: PentaPhoneFieldPhoneInfo(
      countryName: _getCountryNameByLanguage(
        countryCode: PentaPhoneFieldCountryCodesEnum.croatia,
        languageCode: languageCode,
      ),
      countryCode: 'HR',
      dialCode: '+385',
      flag: '🇭🇷',
      minLength: 8,
      maxLength: 9,
    ),
    PentaPhoneFieldCountryCodesEnum.cuba: PentaPhoneFieldPhoneInfo(
      countryName: _getCountryNameByLanguage(
        countryCode: PentaPhoneFieldCountryCodesEnum.cuba,
        languageCode: languageCode,
      ),
      countryCode: 'CU',
      dialCode: '+53',
      flag: '🇨🇺',
      minLength: 8,
      maxLength: 8,
    ),
    PentaPhoneFieldCountryCodesEnum.cyprus: PentaPhoneFieldPhoneInfo(
      countryName: _getCountryNameByLanguage(
        countryCode: PentaPhoneFieldCountryCodesEnum.cyprus,
        languageCode: languageCode,
      ),
      countryCode: 'CY',
      dialCode: '+357',
      flag: '🇨🇾',
      minLength: 8,
      maxLength: 8,
    ),
    PentaPhoneFieldCountryCodesEnum.czechRepublic: PentaPhoneFieldPhoneInfo(
      countryName: _getCountryNameByLanguage(
        countryCode: PentaPhoneFieldCountryCodesEnum.czechRepublic,
        languageCode: languageCode,
      ),
      countryCode: 'CZ',
      dialCode: '+420',
      flag: '🇨🇿',
      minLength: 9,
      maxLength: 9,
    ),
    PentaPhoneFieldCountryCodesEnum
        .democraticRepublicOfCongo: PentaPhoneFieldPhoneInfo(
      countryName: _getCountryNameByLanguage(
        countryCode: PentaPhoneFieldCountryCodesEnum.democraticRepublicOfCongo,
        languageCode: languageCode,
      ),
      countryCode: 'CD',
      dialCode: '+243',
      flag: '🇨🇩',
      minLength: 9,
      maxLength: 9,
    ),
    PentaPhoneFieldCountryCodesEnum.denmark: PentaPhoneFieldPhoneInfo(
      countryName: _getCountryNameByLanguage(
        countryCode: PentaPhoneFieldCountryCodesEnum.denmark,
        languageCode: languageCode,
      ),
      countryCode: 'DK',
      dialCode: '+45',
      flag: '🇩🇰',
      minLength: 8,
      maxLength: 8,
    ),
    PentaPhoneFieldCountryCodesEnum.djibouti: PentaPhoneFieldPhoneInfo(
      countryName: _getCountryNameByLanguage(
        countryCode: PentaPhoneFieldCountryCodesEnum.djibouti,
        languageCode: languageCode,
      ),
      countryCode: 'DJ',
      dialCode: '+253',
      flag: '🇩🇯',
      minLength: 8,
      maxLength: 8,
    ),
    PentaPhoneFieldCountryCodesEnum.dominica: PentaPhoneFieldPhoneInfo(
      countryName: _getCountryNameByLanguage(
        countryCode: PentaPhoneFieldCountryCodesEnum.dominica,
        languageCode: languageCode,
      ),
      countryCode: 'DM',
      dialCode: '+1767',
      flag: '🇩🇲',
      minLength: 7,
      maxLength: 7,
    ),
    PentaPhoneFieldCountryCodesEnum.dominicanRepublic: PentaPhoneFieldPhoneInfo(
      countryName: _getCountryNameByLanguage(
        countryCode: PentaPhoneFieldCountryCodesEnum.dominicanRepublic,
        languageCode: languageCode,
      ),
      countryCode: 'DO',
      dialCode: '+1809',
      flag: '🇩🇴',
      minLength: 7,
      maxLength: 7,
    ),
    PentaPhoneFieldCountryCodesEnum.eastTimor: PentaPhoneFieldPhoneInfo(
      countryName: _getCountryNameByLanguage(
        countryCode: PentaPhoneFieldCountryCodesEnum.eastTimor,
        languageCode: languageCode,
      ),
      countryCode: 'TL',
      dialCode: '+670',
      flag: '🇹🇱',
      minLength: 8,
      maxLength: 8,
    ),
    PentaPhoneFieldCountryCodesEnum.ecuador: PentaPhoneFieldPhoneInfo(
      countryName: _getCountryNameByLanguage(
        countryCode: PentaPhoneFieldCountryCodesEnum.ecuador,
        languageCode: languageCode,
      ),
      countryCode: 'EC',
      dialCode: '+593',
      flag: '🇪🇨',
      minLength: 9,
      maxLength: 9,
    ),
    PentaPhoneFieldCountryCodesEnum.egypt: PentaPhoneFieldPhoneInfo(
      countryName: _getCountryNameByLanguage(
        countryCode: PentaPhoneFieldCountryCodesEnum.egypt,
        languageCode: languageCode,
      ),
      countryCode: 'EG',
      dialCode: '+20',
      flag: '🇪🇬',
      minLength: 10,
      maxLength: 10,
    ),
    PentaPhoneFieldCountryCodesEnum.elSalvador: PentaPhoneFieldPhoneInfo(
      countryName: _getCountryNameByLanguage(
        countryCode: PentaPhoneFieldCountryCodesEnum.elSalvador,
        languageCode: languageCode,
      ),
      countryCode: 'SV',
      dialCode: '+503',
      flag: '🇸🇻',
      minLength: 8,
      maxLength: 8,
    ),
    PentaPhoneFieldCountryCodesEnum.equatorialGuinea: PentaPhoneFieldPhoneInfo(
      countryName: _getCountryNameByLanguage(
        countryCode: PentaPhoneFieldCountryCodesEnum.equatorialGuinea,
        languageCode: languageCode,
      ),
      countryCode: 'GQ',
      dialCode: '+240',
      flag: '🇬🇶',
      minLength: 9,
      maxLength: 9,
    ),
    PentaPhoneFieldCountryCodesEnum.eritrea: PentaPhoneFieldPhoneInfo(
      countryName: _getCountryNameByLanguage(
        countryCode: PentaPhoneFieldCountryCodesEnum.eritrea,
        languageCode: languageCode,
      ),
      countryCode: 'ER',
      dialCode: '+291',
      flag: '🇪🇷',
      minLength: 7,
      maxLength: 7,
    ),
    PentaPhoneFieldCountryCodesEnum.estonia: PentaPhoneFieldPhoneInfo(
      countryName: _getCountryNameByLanguage(
        countryCode: PentaPhoneFieldCountryCodesEnum.estonia,
        languageCode: languageCode,
      ),
      countryCode: 'EE',
      dialCode: '+372',
      flag: '🇪🇪',
      minLength: 8,
      maxLength: 8,
    ),
    PentaPhoneFieldCountryCodesEnum.eswatini: PentaPhoneFieldPhoneInfo(
      countryName: _getCountryNameByLanguage(
        countryCode: PentaPhoneFieldCountryCodesEnum.eswatini,
        languageCode: languageCode,
      ),
      countryCode: 'SZ',
      dialCode: '+268',
      flag: '🇸🇿',
      minLength: 8,
      maxLength: 8,
    ),
    PentaPhoneFieldCountryCodesEnum.ethiopia: PentaPhoneFieldPhoneInfo(
      countryName: _getCountryNameByLanguage(
        countryCode: PentaPhoneFieldCountryCodesEnum.ethiopia,
        languageCode: languageCode,
      ),
      countryCode: 'ET',
      dialCode: '+251',
      flag: '🇪🇹',
      minLength: 9,
      maxLength: 9,
    ),
    PentaPhoneFieldCountryCodesEnum.fiji: PentaPhoneFieldPhoneInfo(
      countryName: _getCountryNameByLanguage(
        countryCode: PentaPhoneFieldCountryCodesEnum.fiji,
        languageCode: languageCode,
      ),
      countryCode: 'FJ',
      dialCode: '+679',
      flag: '🇫🇯',
      minLength: 7,
      maxLength: 7,
    ),
    PentaPhoneFieldCountryCodesEnum.finland: PentaPhoneFieldPhoneInfo(
      countryName: _getCountryNameByLanguage(
        countryCode: PentaPhoneFieldCountryCodesEnum.finland,
        languageCode: languageCode,
      ),
      countryCode: 'FI',
      dialCode: '+358',
      flag: '🇫🇮',
      minLength: 9,
      maxLength: 9,
    ),
    PentaPhoneFieldCountryCodesEnum.france: PentaPhoneFieldPhoneInfo(
      countryName: _getCountryNameByLanguage(
        countryCode: PentaPhoneFieldCountryCodesEnum.france,
        languageCode: languageCode,
      ),
      countryCode: 'FR',
      dialCode: '+33',
      flag: '🇫🇷',
      minLength: 9,
      maxLength: 9,
    ),
    PentaPhoneFieldCountryCodesEnum.gabon: PentaPhoneFieldPhoneInfo(
      countryName: _getCountryNameByLanguage(
        countryCode: PentaPhoneFieldCountryCodesEnum.gabon,
        languageCode: languageCode,
      ),
      countryCode: 'GA',
      dialCode: '+241',
      flag: '🇬🇦',
      minLength: 8,
      maxLength: 8,
    ),
    PentaPhoneFieldCountryCodesEnum.gambia: PentaPhoneFieldPhoneInfo(
      countryName: _getCountryNameByLanguage(
        countryCode: PentaPhoneFieldCountryCodesEnum.gambia,
        languageCode: languageCode,
      ),
      countryCode: 'GM',
      dialCode: '+220',
      flag: '🇬🇲',
      minLength: 7,
      maxLength: 7,
    ),
    PentaPhoneFieldCountryCodesEnum.georgia: PentaPhoneFieldPhoneInfo(
      countryName: _getCountryNameByLanguage(
        countryCode: PentaPhoneFieldCountryCodesEnum.georgia,
        languageCode: languageCode,
      ),
      countryCode: 'GE',
      dialCode: '+995',
      flag: '🇬🇪',
      minLength: 9,
      maxLength: 9,
    ),
    PentaPhoneFieldCountryCodesEnum.germany: PentaPhoneFieldPhoneInfo(
      countryName: _getCountryNameByLanguage(
        countryCode: PentaPhoneFieldCountryCodesEnum.germany,
        languageCode: languageCode,
      ),
      countryCode: 'DE',
      dialCode: '+49',
      flag: '🇩🇪',
      minLength: 10,
      maxLength: 13,
    ),
    PentaPhoneFieldCountryCodesEnum.ghana: PentaPhoneFieldPhoneInfo(
      countryName: _getCountryNameByLanguage(
        countryCode: PentaPhoneFieldCountryCodesEnum.ghana,
        languageCode: languageCode,
      ),
      countryCode: 'GH',
      dialCode: '+233',
      flag: '🇬🇭',
      minLength: 9,
      maxLength: 9,
    ),
    PentaPhoneFieldCountryCodesEnum.greece: PentaPhoneFieldPhoneInfo(
      countryName: _getCountryNameByLanguage(
        countryCode: PentaPhoneFieldCountryCodesEnum.greece,
        languageCode: languageCode,
      ),
      countryCode: 'GR',
      dialCode: '+30',
      flag: '🇬🇷',
      minLength: 10,
      maxLength: 10,
    ),
    PentaPhoneFieldCountryCodesEnum.grenada: PentaPhoneFieldPhoneInfo(
      countryName: _getCountryNameByLanguage(
        countryCode: PentaPhoneFieldCountryCodesEnum.grenada,
        languageCode: languageCode,
      ),
      countryCode: 'GD',
      dialCode: '+1473',
      flag: '🇬🇩',
      minLength: 7,
      maxLength: 7,
    ),
    PentaPhoneFieldCountryCodesEnum.guatemala: PentaPhoneFieldPhoneInfo(
      countryName: _getCountryNameByLanguage(
        countryCode: PentaPhoneFieldCountryCodesEnum.guatemala,
        languageCode: languageCode,
      ),
      countryCode: 'GT',
      dialCode: '+502',
      flag: '🇬🇹',
      minLength: 8,
      maxLength: 8,
    ),
    PentaPhoneFieldCountryCodesEnum.guinea: PentaPhoneFieldPhoneInfo(
      countryName: _getCountryNameByLanguage(
        countryCode: PentaPhoneFieldCountryCodesEnum.guinea,
        languageCode: languageCode,
      ),
      countryCode: 'GN',
      dialCode: '+224',
      flag: '🇬🇳',
      minLength: 9,
      maxLength: 9,
    ),
    PentaPhoneFieldCountryCodesEnum.guineaBissau: PentaPhoneFieldPhoneInfo(
      countryName: _getCountryNameByLanguage(
        countryCode: PentaPhoneFieldCountryCodesEnum.guineaBissau,
        languageCode: languageCode,
      ),
      countryCode: 'GW',
      dialCode: '+245',
      flag: '🇬🇼',
      minLength: 7,
      maxLength: 7,
    ),
    PentaPhoneFieldCountryCodesEnum.guyana: PentaPhoneFieldPhoneInfo(
      countryName: _getCountryNameByLanguage(
        countryCode: PentaPhoneFieldCountryCodesEnum.guyana,
        languageCode: languageCode,
      ),
      countryCode: 'GY',
      dialCode: '+592',
      flag: '🇬🇾',
      minLength: 7,
      maxLength: 7,
    ),
    PentaPhoneFieldCountryCodesEnum.haiti: PentaPhoneFieldPhoneInfo(
      countryName: _getCountryNameByLanguage(
        countryCode: PentaPhoneFieldCountryCodesEnum.haiti,
        languageCode: languageCode,
      ),
      countryCode: 'HT',
      dialCode: '+509',
      flag: '🇭🇹',
      minLength: 8,
      maxLength: 8,
    ),
    PentaPhoneFieldCountryCodesEnum.honduras: PentaPhoneFieldPhoneInfo(
      countryName: _getCountryNameByLanguage(
        countryCode: PentaPhoneFieldCountryCodesEnum.honduras,
        languageCode: languageCode,
      ),
      countryCode: 'HN',
      dialCode: '+504',
      flag: '🇭🇳',
      minLength: 8,
      maxLength: 8,
    ),
    PentaPhoneFieldCountryCodesEnum.hungary: PentaPhoneFieldPhoneInfo(
      countryName: _getCountryNameByLanguage(
        countryCode: PentaPhoneFieldCountryCodesEnum.hungary,
        languageCode: languageCode,
      ),
      countryCode: 'HU',
      dialCode: '+36',
      flag: '🇭🇺',
      minLength: 9,
      maxLength: 9,
    ),
    PentaPhoneFieldCountryCodesEnum.iceland: PentaPhoneFieldPhoneInfo(
      countryName: _getCountryNameByLanguage(
        countryCode: PentaPhoneFieldCountryCodesEnum.iceland,
        languageCode: languageCode,
      ),
      countryCode: 'IS',
      dialCode: '+354',
      flag: '🇮🇸',
      minLength: 7,
      maxLength: 7,
    ),
    PentaPhoneFieldCountryCodesEnum.india: PentaPhoneFieldPhoneInfo(
      countryName: _getCountryNameByLanguage(
        countryCode: PentaPhoneFieldCountryCodesEnum.india,
        languageCode: languageCode,
      ),
      countryCode: 'IN',
      dialCode: '+91',
      flag: '🇮🇳',
      minLength: 10,
      maxLength: 10,
    ),
    PentaPhoneFieldCountryCodesEnum.indonesia: PentaPhoneFieldPhoneInfo(
      countryName: _getCountryNameByLanguage(
        countryCode: PentaPhoneFieldCountryCodesEnum.indonesia,
        languageCode: languageCode,
      ),
      countryCode: 'ID',
      dialCode: '+62',
      flag: '🇮🇩',
      minLength: 9,
      maxLength: 12,
    ),
    PentaPhoneFieldCountryCodesEnum.iran: PentaPhoneFieldPhoneInfo(
      countryName: _getCountryNameByLanguage(
        countryCode: PentaPhoneFieldCountryCodesEnum.iran,
        languageCode: languageCode,
      ),
      countryCode: 'IR',
      dialCode: '+98',
      flag: '🇮🇷',
      minLength: 10,
      maxLength: 10,
    ),
    PentaPhoneFieldCountryCodesEnum.iraq: PentaPhoneFieldPhoneInfo(
      countryName: _getCountryNameByLanguage(
        countryCode: PentaPhoneFieldCountryCodesEnum.iraq,
        languageCode: languageCode,
      ),
      countryCode: 'IQ',
      dialCode: '+964',
      flag: '🇮🇶',
      minLength: 10,
      maxLength: 10,
    ),
    PentaPhoneFieldCountryCodesEnum.ireland: PentaPhoneFieldPhoneInfo(
      countryName: _getCountryNameByLanguage(
        countryCode: PentaPhoneFieldCountryCodesEnum.ireland,
        languageCode: languageCode,
      ),
      countryCode: 'IE',
      dialCode: '+353',
      flag: '🇮🇪',
      minLength: 9,
      maxLength: 9,
    ),
    PentaPhoneFieldCountryCodesEnum.israel: PentaPhoneFieldPhoneInfo(
      countryName: _getCountryNameByLanguage(
        countryCode: PentaPhoneFieldCountryCodesEnum.israel,
        languageCode: languageCode,
      ),
      countryCode: 'IL',
      dialCode: '+972',
      flag: '🇮🇱',
      minLength: 9,
      maxLength: 9,
    ),
    PentaPhoneFieldCountryCodesEnum.italy: PentaPhoneFieldPhoneInfo(
      countryName: _getCountryNameByLanguage(
        countryCode: PentaPhoneFieldCountryCodesEnum.italy,
        languageCode: languageCode,
      ),
      countryCode: 'IT',
      dialCode: '+39',
      flag: '🇮🇹',
      minLength: 10,
      maxLength: 10,
    ),
    PentaPhoneFieldCountryCodesEnum.ivoryCoast: PentaPhoneFieldPhoneInfo(
      countryName: _getCountryNameByLanguage(
        countryCode: PentaPhoneFieldCountryCodesEnum.ivoryCoast,
        languageCode: languageCode,
      ),
      countryCode: 'CI',
      dialCode: '+225',
      flag: '🇨🇮',
      minLength: 8,
      maxLength: 8,
    ),
    PentaPhoneFieldCountryCodesEnum.jamaica: PentaPhoneFieldPhoneInfo(
      countryName: _getCountryNameByLanguage(
        countryCode: PentaPhoneFieldCountryCodesEnum.jamaica,
        languageCode: languageCode,
      ),
      countryCode: 'JM',
      dialCode: '+1876',
      flag: '🇯🇲',
      minLength: 7,
      maxLength: 7,
    ),
    PentaPhoneFieldCountryCodesEnum.japan: PentaPhoneFieldPhoneInfo(
      countryName: _getCountryNameByLanguage(
        countryCode: PentaPhoneFieldCountryCodesEnum.japan,
        languageCode: languageCode,
      ),
      countryCode: 'JP',
      dialCode: '+81',
      flag: '🇯🇵',
      minLength: 10,
      maxLength: 10,
    ),
    PentaPhoneFieldCountryCodesEnum.jordan: PentaPhoneFieldPhoneInfo(
      countryName: _getCountryNameByLanguage(
        countryCode: PentaPhoneFieldCountryCodesEnum.jordan,
        languageCode: languageCode,
      ),
      countryCode: 'JO',
      dialCode: '+962',
      flag: '🇯🇴',
      minLength: 9,
      maxLength: 9,
    ),
    PentaPhoneFieldCountryCodesEnum.kazakhstan: PentaPhoneFieldPhoneInfo(
      countryName: _getCountryNameByLanguage(
        countryCode: PentaPhoneFieldCountryCodesEnum.kazakhstan,
        languageCode: languageCode,
      ),
      countryCode: 'KZ',
      dialCode: '+7',
      flag: '🇰🇿',
      minLength: 10,
      maxLength: 10,
    ),
    PentaPhoneFieldCountryCodesEnum.kenya: PentaPhoneFieldPhoneInfo(
      countryName: _getCountryNameByLanguage(
        countryCode: PentaPhoneFieldCountryCodesEnum.kenya,
        languageCode: languageCode,
      ),
      countryCode: 'KE',
      dialCode: '+254',
      flag: '🇰🇪',
      minLength: 9,
      maxLength: 9,
    ),
    PentaPhoneFieldCountryCodesEnum.kiribati: PentaPhoneFieldPhoneInfo(
      countryName: _getCountryNameByLanguage(
        countryCode: PentaPhoneFieldCountryCodesEnum.kiribati,
        languageCode: languageCode,
      ),
      countryCode: 'KI',
      dialCode: '+686',
      flag: '🇰🇮',
      minLength: 8,
      maxLength: 8,
    ),
    PentaPhoneFieldCountryCodesEnum.kuwait: PentaPhoneFieldPhoneInfo(
      countryName: _getCountryNameByLanguage(
        countryCode: PentaPhoneFieldCountryCodesEnum.kuwait,
        languageCode: languageCode,
      ),
      countryCode: 'KW',
      dialCode: '+965',
      flag: '🇰🇼',
      minLength: 8,
      maxLength: 8,
    ),
    PentaPhoneFieldCountryCodesEnum.kyrgyzstan: PentaPhoneFieldPhoneInfo(
      countryName: _getCountryNameByLanguage(
        countryCode: PentaPhoneFieldCountryCodesEnum.kyrgyzstan,
        languageCode: languageCode,
      ),
      countryCode: 'KG',
      dialCode: '+996',
      flag: '🇰🇬',
      minLength: 9,
      maxLength: 9,
    ),
    PentaPhoneFieldCountryCodesEnum.laos: PentaPhoneFieldPhoneInfo(
      countryName: _getCountryNameByLanguage(
        countryCode: PentaPhoneFieldCountryCodesEnum.laos,
        languageCode: languageCode,
      ),
      countryCode: 'LA',
      dialCode: '+856',
      flag: '🇱🇦',
      minLength: 10,
      maxLength: 10,
    ),
    PentaPhoneFieldCountryCodesEnum.latvia: PentaPhoneFieldPhoneInfo(
      countryName: _getCountryNameByLanguage(
        countryCode: PentaPhoneFieldCountryCodesEnum.latvia,
        languageCode: languageCode,
      ),
      countryCode: 'LV',
      dialCode: '+371',
      flag: '🇱🇻',
      minLength: 8,
      maxLength: 8,
    ),
    PentaPhoneFieldCountryCodesEnum.lebanon: PentaPhoneFieldPhoneInfo(
      countryName: _getCountryNameByLanguage(
        countryCode: PentaPhoneFieldCountryCodesEnum.lebanon,
        languageCode: languageCode,
      ),
      countryCode: 'LB',
      dialCode: '+961',
      flag: '🇱🇧',
      minLength: 8,
      maxLength: 8,
    ),
    PentaPhoneFieldCountryCodesEnum.lesotho: PentaPhoneFieldPhoneInfo(
      countryName: _getCountryNameByLanguage(
        countryCode: PentaPhoneFieldCountryCodesEnum.lesotho,
        languageCode: languageCode,
      ),
      countryCode: 'LS',
      dialCode: '+266',
      flag: '🇱🇸',
      minLength: 8,
      maxLength: 8,
    ),
    PentaPhoneFieldCountryCodesEnum.liberia: PentaPhoneFieldPhoneInfo(
      countryName: _getCountryNameByLanguage(
        countryCode: PentaPhoneFieldCountryCodesEnum.liberia,
        languageCode: languageCode,
      ),
      countryCode: 'LR',
      dialCode: '+231',
      flag: '🇱🇷',
      minLength: 8,
      maxLength: 8,
    ),
    PentaPhoneFieldCountryCodesEnum.libya: PentaPhoneFieldPhoneInfo(
      countryName: _getCountryNameByLanguage(
        countryCode: PentaPhoneFieldCountryCodesEnum.libya,
        languageCode: languageCode,
      ),
      countryCode: 'LY',
      dialCode: '+218',
      flag: '🇱🇾',
      minLength: 9,
      maxLength: 9,
    ),
    PentaPhoneFieldCountryCodesEnum.liechtenstein: PentaPhoneFieldPhoneInfo(
      countryName: _getCountryNameByLanguage(
        countryCode: PentaPhoneFieldCountryCodesEnum.liechtenstein,
        languageCode: languageCode,
      ),
      countryCode: 'LI',
      dialCode: '+423',
      flag: '🇱🇮',
      minLength: 7,
      maxLength: 7,
    ),
    PentaPhoneFieldCountryCodesEnum.lithuania: PentaPhoneFieldPhoneInfo(
      countryName: _getCountryNameByLanguage(
        countryCode: PentaPhoneFieldCountryCodesEnum.lithuania,
        languageCode: languageCode,
      ),
      countryCode: 'LT',
      dialCode: '+370',
      flag: '🇱🇹',
      minLength: 8,
      maxLength: 8,
    ),
    PentaPhoneFieldCountryCodesEnum.luxembourg: PentaPhoneFieldPhoneInfo(
      countryName: _getCountryNameByLanguage(
        countryCode: PentaPhoneFieldCountryCodesEnum.luxembourg,
        languageCode: languageCode,
      ),
      countryCode: 'LU',
      dialCode: '+352',
      flag: '🇱🇺',
      minLength: 9,
      maxLength: 9,
    ),
    PentaPhoneFieldCountryCodesEnum.madagascar: PentaPhoneFieldPhoneInfo(
      countryName: _getCountryNameByLanguage(
        countryCode: PentaPhoneFieldCountryCodesEnum.madagascar,
        languageCode: languageCode,
      ),
      countryCode: 'MG',
      dialCode: '+261',
      flag: '🇲🇬',
      minLength: 9,
      maxLength: 9,
    ),
    PentaPhoneFieldCountryCodesEnum.malawi: PentaPhoneFieldPhoneInfo(
      countryName: _getCountryNameByLanguage(
        countryCode: PentaPhoneFieldCountryCodesEnum.malawi,
        languageCode: languageCode,
      ),
      countryCode: 'MW',
      dialCode: '+265',
      flag: '🇲🇼',
      minLength: 9,
      maxLength: 9,
    ),
    PentaPhoneFieldCountryCodesEnum.malaysia: PentaPhoneFieldPhoneInfo(
      countryName: _getCountryNameByLanguage(
        countryCode: PentaPhoneFieldCountryCodesEnum.malaysia,
        languageCode: languageCode,
      ),
      countryCode: 'MY',
      dialCode: '+60',
      flag: '🇲🇾',
      minLength: 9,
      maxLength: 10,
    ),
    PentaPhoneFieldCountryCodesEnum.maldives: PentaPhoneFieldPhoneInfo(
      countryName: _getCountryNameByLanguage(
        countryCode: PentaPhoneFieldCountryCodesEnum.maldives,
        languageCode: languageCode,
      ),
      countryCode: 'MV',
      dialCode: '+960',
      flag: '🇲🇻',
      minLength: 7,
      maxLength: 7,
    ),
    PentaPhoneFieldCountryCodesEnum.mali: PentaPhoneFieldPhoneInfo(
      countryName: _getCountryNameByLanguage(
        countryCode: PentaPhoneFieldCountryCodesEnum.mali,
        languageCode: languageCode,
      ),
      countryCode: 'ML',
      dialCode: '+223',
      flag: '🇲🇱',
      minLength: 8,
      maxLength: 8,
    ),
    PentaPhoneFieldCountryCodesEnum.malta: PentaPhoneFieldPhoneInfo(
      countryName: _getCountryNameByLanguage(
        countryCode: PentaPhoneFieldCountryCodesEnum.malta,
        languageCode: languageCode,
      ),
      countryCode: 'MT',
      dialCode: '+356',
      flag: '🇲🇹',
      minLength: 8,
      maxLength: 8,
    ),
    PentaPhoneFieldCountryCodesEnum.marshallIslands: PentaPhoneFieldPhoneInfo(
      countryName: _getCountryNameByLanguage(
        countryCode: PentaPhoneFieldCountryCodesEnum.marshallIslands,
        languageCode: languageCode,
      ),
      countryCode: 'MH',
      dialCode: '+692',
      flag: '🇲🇭',
      minLength: 7,
      maxLength: 7,
    ),
    PentaPhoneFieldCountryCodesEnum.mauritania: PentaPhoneFieldPhoneInfo(
      countryName: _getCountryNameByLanguage(
        countryCode: PentaPhoneFieldCountryCodesEnum.mauritania,
        languageCode: languageCode,
      ),
      countryCode: 'MR',
      dialCode: '+222',
      flag: '🇲🇷',
      minLength: 8,
      maxLength: 8,
    ),
    PentaPhoneFieldCountryCodesEnum.mauritius: PentaPhoneFieldPhoneInfo(
      countryName: _getCountryNameByLanguage(
        countryCode: PentaPhoneFieldCountryCodesEnum.mauritius,
        languageCode: languageCode,
      ),
      countryCode: 'MU',
      dialCode: '+230',
      flag: '🇲🇺',
      minLength: 8,
      maxLength: 8,
    ),
    PentaPhoneFieldCountryCodesEnum.mexico: PentaPhoneFieldPhoneInfo(
      countryName: _getCountryNameByLanguage(
        countryCode: PentaPhoneFieldCountryCodesEnum.mexico,
        languageCode: languageCode,
      ),
      countryCode: 'MX',
      dialCode: '+52',
      flag: '🇲🇽',
      minLength: 10,
      maxLength: 10,
    ),
    PentaPhoneFieldCountryCodesEnum.micronesia: PentaPhoneFieldPhoneInfo(
      countryName: _getCountryNameByLanguage(
        countryCode: PentaPhoneFieldCountryCodesEnum.micronesia,
        languageCode: languageCode,
      ),
      countryCode: 'FM',
      dialCode: '+691',
      flag: '🇫🇲',
      minLength: 7,
      maxLength: 7,
    ),
    PentaPhoneFieldCountryCodesEnum.moldova: PentaPhoneFieldPhoneInfo(
      countryName: _getCountryNameByLanguage(
        countryCode: PentaPhoneFieldCountryCodesEnum.moldova,
        languageCode: languageCode,
      ),
      countryCode: 'MD',
      dialCode: '+373',
      flag: '🇲🇩',
      minLength: 8,
      maxLength: 8,
    ),
    PentaPhoneFieldCountryCodesEnum.monaco: PentaPhoneFieldPhoneInfo(
      countryName: _getCountryNameByLanguage(
        countryCode: PentaPhoneFieldCountryCodesEnum.monaco,
        languageCode: languageCode,
      ),
      countryCode: 'MC',
      dialCode: '+377',
      flag: '🇲🇨',
      minLength: 8,
      maxLength: 8,
    ),
    PentaPhoneFieldCountryCodesEnum.mongolia: PentaPhoneFieldPhoneInfo(
      countryName: _getCountryNameByLanguage(
        countryCode: PentaPhoneFieldCountryCodesEnum.mongolia,
        languageCode: languageCode,
      ),
      countryCode: 'MN',
      dialCode: '+976',
      flag: '🇲🇳',
      minLength: 8,
      maxLength: 8,
    ),
    PentaPhoneFieldCountryCodesEnum.montenegro: PentaPhoneFieldPhoneInfo(
      countryName: _getCountryNameByLanguage(
        countryCode: PentaPhoneFieldCountryCodesEnum.montenegro,
        languageCode: languageCode,
      ),
      countryCode: 'ME',
      dialCode: '+382',
      flag: '🇲🇪',
      minLength: 8,
      maxLength: 8,
    ),
    PentaPhoneFieldCountryCodesEnum.morocco: PentaPhoneFieldPhoneInfo(
      countryName: _getCountryNameByLanguage(
        countryCode: PentaPhoneFieldCountryCodesEnum.morocco,
        languageCode: languageCode,
      ),
      countryCode: 'MA',
      dialCode: '+212',
      flag: '🇲🇦',
      minLength: 9,
      maxLength: 9,
    ),
    PentaPhoneFieldCountryCodesEnum.mozambique: PentaPhoneFieldPhoneInfo(
      countryName: _getCountryNameByLanguage(
        countryCode: PentaPhoneFieldCountryCodesEnum.mozambique,
        languageCode: languageCode,
      ),
      countryCode: 'MZ',
      dialCode: '+258',
      flag: '🇲🇿',
      minLength: 9,
      maxLength: 9,
    ),
    PentaPhoneFieldCountryCodesEnum.myanmar: PentaPhoneFieldPhoneInfo(
      countryName: _getCountryNameByLanguage(
        countryCode: PentaPhoneFieldCountryCodesEnum.myanmar,
        languageCode: languageCode,
      ),
      countryCode: 'MM',
      dialCode: '+95',
      flag: '🇲🇲',
      minLength: 9,
      maxLength: 10,
    ),
    PentaPhoneFieldCountryCodesEnum.namibia: PentaPhoneFieldPhoneInfo(
      countryName: _getCountryNameByLanguage(
        countryCode: PentaPhoneFieldCountryCodesEnum.namibia,
        languageCode: languageCode,
      ),
      countryCode: 'NA',
      dialCode: '+264',
      flag: '🇳🇦',
      minLength: 9,
      maxLength: 9,
    ),
    PentaPhoneFieldCountryCodesEnum.nauru: PentaPhoneFieldPhoneInfo(
      countryName: _getCountryNameByLanguage(
        countryCode: PentaPhoneFieldCountryCodesEnum.nauru,
        languageCode: languageCode,
      ),
      countryCode: 'NR',
      dialCode: '+674',
      flag: '🇳🇷',
      minLength: 7,
      maxLength: 7,
    ),
    PentaPhoneFieldCountryCodesEnum.nepal: PentaPhoneFieldPhoneInfo(
      countryName: _getCountryNameByLanguage(
        countryCode: PentaPhoneFieldCountryCodesEnum.nepal,
        languageCode: languageCode,
      ),
      countryCode: 'NP',
      dialCode: '+977',
      flag: '🇳🇵',
      minLength: 10,
      maxLength: 10,
    ),
    PentaPhoneFieldCountryCodesEnum.netherlands: PentaPhoneFieldPhoneInfo(
      countryName: _getCountryNameByLanguage(
        countryCode: PentaPhoneFieldCountryCodesEnum.netherlands,
        languageCode: languageCode,
      ),
      countryCode: 'NL',
      dialCode: '+31',
      flag: '🇳🇱',
      minLength: 9,
      maxLength: 9,
    ),
    PentaPhoneFieldCountryCodesEnum.newZealand: PentaPhoneFieldPhoneInfo(
      countryName: _getCountryNameByLanguage(
        countryCode: PentaPhoneFieldCountryCodesEnum.newZealand,
        languageCode: languageCode,
      ),
      countryCode: 'NZ',
      dialCode: '+64',
      flag: '🇳🇿',
      minLength: 9,
      maxLength: 9,
    ),
    PentaPhoneFieldCountryCodesEnum.nicaragua: PentaPhoneFieldPhoneInfo(
      countryName: _getCountryNameByLanguage(
        countryCode: PentaPhoneFieldCountryCodesEnum.nicaragua,
        languageCode: languageCode,
      ),
      countryCode: 'NI',
      dialCode: '+505',
      flag: '🇳🇮',
      minLength: 8,
      maxLength: 8,
    ),
    PentaPhoneFieldCountryCodesEnum.niger: PentaPhoneFieldPhoneInfo(
      countryName: _getCountryNameByLanguage(
        countryCode: PentaPhoneFieldCountryCodesEnum.niger,
        languageCode: languageCode,
      ),
      countryCode: 'NE',
      dialCode: '+227',
      flag: '🇳🇪',
      minLength: 8,
      maxLength: 8,
    ),
    PentaPhoneFieldCountryCodesEnum.nigeria: PentaPhoneFieldPhoneInfo(
      countryName: _getCountryNameByLanguage(
        countryCode: PentaPhoneFieldCountryCodesEnum.nigeria,
        languageCode: languageCode,
      ),
      countryCode: 'NG',
      dialCode: '+234',
      flag: '🇳🇬',
      minLength: 10,
      maxLength: 10,
    ),
    PentaPhoneFieldCountryCodesEnum.northKorea: PentaPhoneFieldPhoneInfo(
      countryName: _getCountryNameByLanguage(
        countryCode: PentaPhoneFieldCountryCodesEnum.northKorea,
        languageCode: languageCode,
      ),
      countryCode: 'KP',
      dialCode: '+850',
      flag: '🇰🇵',
      minLength: 9,
      maxLength: 9,
    ),
    PentaPhoneFieldCountryCodesEnum.northMacedonia: PentaPhoneFieldPhoneInfo(
      countryName: _getCountryNameByLanguage(
        countryCode: PentaPhoneFieldCountryCodesEnum.northMacedonia,
        languageCode: languageCode,
      ),
      countryCode: 'MK',
      dialCode: '+389',
      flag: '🇲🇰',
      minLength: 8,
      maxLength: 8,
    ),
    PentaPhoneFieldCountryCodesEnum.norway: PentaPhoneFieldPhoneInfo(
      countryName: _getCountryNameByLanguage(
        countryCode: PentaPhoneFieldCountryCodesEnum.norway,
        languageCode: languageCode,
      ),
      countryCode: 'NO',
      dialCode: '+47',
      flag: '🇳🇴',
      minLength: 8,
      maxLength: 8,
    ),
    PentaPhoneFieldCountryCodesEnum.oman: PentaPhoneFieldPhoneInfo(
      countryName: _getCountryNameByLanguage(
        countryCode: PentaPhoneFieldCountryCodesEnum.oman,
        languageCode: languageCode,
      ),
      countryCode: 'OM',
      dialCode: '+968',
      flag: '🇴🇲',
      minLength: 8,
      maxLength: 8,
    ),
    PentaPhoneFieldCountryCodesEnum.pakistan: PentaPhoneFieldPhoneInfo(
      countryName: _getCountryNameByLanguage(
        countryCode: PentaPhoneFieldCountryCodesEnum.pakistan,
        languageCode: languageCode,
      ),
      countryCode: 'PK',
      dialCode: '+92',
      flag: '🇵🇰',
      minLength: 10,
      maxLength: 10,
    ),
    PentaPhoneFieldCountryCodesEnum.palau: PentaPhoneFieldPhoneInfo(
      countryName: _getCountryNameByLanguage(
        countryCode: PentaPhoneFieldCountryCodesEnum.palau,
        languageCode: languageCode,
      ),
      countryCode: 'PW',
      dialCode: '+680',
      flag: '🇵🇼',
      minLength: 7,
      maxLength: 7,
    ),
    PentaPhoneFieldCountryCodesEnum.panama: PentaPhoneFieldPhoneInfo(
      countryName: _getCountryNameByLanguage(
        countryCode: PentaPhoneFieldCountryCodesEnum.panama,
        languageCode: languageCode,
      ),
      countryCode: 'PA',
      dialCode: '+507',
      flag: '🇵🇦',
      minLength: 8,
      maxLength: 8,
    ),
    PentaPhoneFieldCountryCodesEnum.papuaNewGuinea: PentaPhoneFieldPhoneInfo(
      countryName: _getCountryNameByLanguage(
        countryCode: PentaPhoneFieldCountryCodesEnum.papuaNewGuinea,
        languageCode: languageCode,
      ),
      countryCode: 'PG',
      dialCode: '+675',
      flag: '🇵🇬',
      minLength: 8,
      maxLength: 8,
    ),
    PentaPhoneFieldCountryCodesEnum.paraguay: PentaPhoneFieldPhoneInfo(
      countryName: _getCountryNameByLanguage(
        countryCode: PentaPhoneFieldCountryCodesEnum.paraguay,
        languageCode: languageCode,
      ),
      countryCode: 'PY',
      dialCode: '+595',
      flag: '🇵🇾',
      minLength: 9,
      maxLength: 9,
    ),
    PentaPhoneFieldCountryCodesEnum.peru: PentaPhoneFieldPhoneInfo(
      countryName: _getCountryNameByLanguage(
        countryCode: PentaPhoneFieldCountryCodesEnum.peru,
        languageCode: languageCode,
      ),
      countryCode: 'PE',
      dialCode: '+51',
      flag: '🇵🇪',
      minLength: 9,
      maxLength: 9,
    ),
    PentaPhoneFieldCountryCodesEnum.philippines: PentaPhoneFieldPhoneInfo(
      countryName: _getCountryNameByLanguage(
        countryCode: PentaPhoneFieldCountryCodesEnum.philippines,
        languageCode: languageCode,
      ),
      countryCode: 'PH',
      dialCode: '+63',
      flag: '🇵🇭',
      minLength: 10,
      maxLength: 10,
    ),
    PentaPhoneFieldCountryCodesEnum.poland: PentaPhoneFieldPhoneInfo(
      countryName: _getCountryNameByLanguage(
        countryCode: PentaPhoneFieldCountryCodesEnum.poland,
        languageCode: languageCode,
      ),
      countryCode: 'PL',
      dialCode: '+48',
      flag: '🇵🇱',
      minLength: 9,
      maxLength: 9,
    ),
    PentaPhoneFieldCountryCodesEnum.portugal: PentaPhoneFieldPhoneInfo(
      countryName: _getCountryNameByLanguage(
        countryCode: PentaPhoneFieldCountryCodesEnum.portugal,
        languageCode: languageCode,
      ),
      countryCode: 'PT',
      dialCode: '+351',
      flag: '🇵🇹',
      minLength: 9,
      maxLength: 9,
    ),
    PentaPhoneFieldCountryCodesEnum.qatar: PentaPhoneFieldPhoneInfo(
      countryName: _getCountryNameByLanguage(
        countryCode: PentaPhoneFieldCountryCodesEnum.qatar,
        languageCode: languageCode,
      ),
      countryCode: 'QA',
      dialCode: '+974',
      flag: '🇶🇦',
      minLength: 8,
      maxLength: 8,
    ),
    PentaPhoneFieldCountryCodesEnum.romania: PentaPhoneFieldPhoneInfo(
      countryName: _getCountryNameByLanguage(
        countryCode: PentaPhoneFieldCountryCodesEnum.romania,
        languageCode: languageCode,
      ),
      countryCode: 'RO',
      dialCode: '+40',
      flag: '🇷🇴',
      minLength: 9,
      maxLength: 9,
    ),
    PentaPhoneFieldCountryCodesEnum.russia: PentaPhoneFieldPhoneInfo(
      countryName: _getCountryNameByLanguage(
        countryCode: PentaPhoneFieldCountryCodesEnum.russia,
        languageCode: languageCode,
      ),
      countryCode: 'RU',
      dialCode: '+7',
      flag: '🇷🇺',
      minLength: 10,
      maxLength: 10,
    ),
    PentaPhoneFieldCountryCodesEnum.rwanda: PentaPhoneFieldPhoneInfo(
      countryName: _getCountryNameByLanguage(
        countryCode: PentaPhoneFieldCountryCodesEnum.rwanda,
        languageCode: languageCode,
      ),
      countryCode: 'RW',
      dialCode: '+250',
      flag: '🇷🇼',
      minLength: 9,
      maxLength: 9,
    ),
    PentaPhoneFieldCountryCodesEnum
        .saintKittsAndNevis: PentaPhoneFieldPhoneInfo(
      countryName: _getCountryNameByLanguage(
        countryCode: PentaPhoneFieldCountryCodesEnum.saintKittsAndNevis,
        languageCode: languageCode,
      ),
      countryCode: 'KN',
      dialCode: '+1869',
      flag: '🇰🇳',
      minLength: 7,
      maxLength: 7,
    ),
    PentaPhoneFieldCountryCodesEnum.saintLucia: PentaPhoneFieldPhoneInfo(
      countryName: _getCountryNameByLanguage(
        countryCode: PentaPhoneFieldCountryCodesEnum.saintLucia,
        languageCode: languageCode,
      ),
      countryCode: 'LC',
      dialCode: '+1758',
      flag: '🇱🇨',
      minLength: 7,
      maxLength: 7,
    ),
    PentaPhoneFieldCountryCodesEnum
        .saintVincentAndTheGrenadines: PentaPhoneFieldPhoneInfo(
      countryName: _getCountryNameByLanguage(
        countryCode:
            PentaPhoneFieldCountryCodesEnum.saintVincentAndTheGrenadines,
        languageCode: languageCode,
      ),
      countryCode: 'VC',
      dialCode: '+1784',
      flag: '🇻🇨',
      minLength: 7,
      maxLength: 7,
    ),
    PentaPhoneFieldCountryCodesEnum.samoa: PentaPhoneFieldPhoneInfo(
      countryName: _getCountryNameByLanguage(
        countryCode: PentaPhoneFieldCountryCodesEnum.samoa,
        languageCode: languageCode,
      ),
      countryCode: 'WS',
      dialCode: '+685',
      flag: '🇼🇸',
      minLength: 7,
      maxLength: 7,
    ),
    PentaPhoneFieldCountryCodesEnum.sanMarino: PentaPhoneFieldPhoneInfo(
      countryName: _getCountryNameByLanguage(
        countryCode: PentaPhoneFieldCountryCodesEnum.sanMarino,
        languageCode: languageCode,
      ),
      countryCode: 'SM',
      dialCode: '+378',
      flag: '🇸🇲',
      minLength: 8,
      maxLength: 8,
    ),
    PentaPhoneFieldCountryCodesEnum
        .saoTomeAndPrincipe: PentaPhoneFieldPhoneInfo(
      countryName: _getCountryNameByLanguage(
        countryCode: PentaPhoneFieldCountryCodesEnum.saoTomeAndPrincipe,
        languageCode: languageCode,
      ),
      countryCode: 'ST',
      dialCode: '+239',
      flag: '🇸🇹',
      minLength: 7,
      maxLength: 7,
    ),
    PentaPhoneFieldCountryCodesEnum.saudiArabia: PentaPhoneFieldPhoneInfo(
      countryName: _getCountryNameByLanguage(
        countryCode: PentaPhoneFieldCountryCodesEnum.saudiArabia,
        languageCode: languageCode,
      ),
      countryCode: 'SA',
      dialCode: '+966',
      flag: '🇸🇦',
      minLength: 9,
      maxLength: 9,
    ),
    PentaPhoneFieldCountryCodesEnum.senegal: PentaPhoneFieldPhoneInfo(
      countryName: _getCountryNameByLanguage(
        countryCode: PentaPhoneFieldCountryCodesEnum.senegal,
        languageCode: languageCode,
      ),
      countryCode: 'SN',
      dialCode: '+221',
      flag: '🇸🇳',
      minLength: 9,
      maxLength: 9,
    ),
    PentaPhoneFieldCountryCodesEnum.serbia: PentaPhoneFieldPhoneInfo(
      countryName: _getCountryNameByLanguage(
        countryCode: PentaPhoneFieldCountryCodesEnum.serbia,
        languageCode: languageCode,
      ),
      countryCode: 'RS',
      dialCode: '+381',
      flag: '🇷🇸',
      minLength: 8,
      maxLength: 8,
    ),
    PentaPhoneFieldCountryCodesEnum.seychelles: PentaPhoneFieldPhoneInfo(
      countryName: _getCountryNameByLanguage(
        countryCode: PentaPhoneFieldCountryCodesEnum.seychelles,
        languageCode: languageCode,
      ),
      countryCode: 'SC',
      dialCode: '+248',
      flag: '🇸🇨',
      minLength: 7,
      maxLength: 7,
    ),
    PentaPhoneFieldCountryCodesEnum.sierraLeone: PentaPhoneFieldPhoneInfo(
      countryName: _getCountryNameByLanguage(
        countryCode: PentaPhoneFieldCountryCodesEnum.sierraLeone,
        languageCode: languageCode,
      ),
      countryCode: 'SL',
      dialCode: '+232',
      flag: '🇸🇱',
      minLength: 8,
      maxLength: 8,
    ),
    PentaPhoneFieldCountryCodesEnum.singapore: PentaPhoneFieldPhoneInfo(
      countryName: _getCountryNameByLanguage(
        countryCode: PentaPhoneFieldCountryCodesEnum.singapore,
        languageCode: languageCode,
      ),
      countryCode: 'SG',
      dialCode: '+65',
      flag: '🇸🇬',
      minLength: 8,
      maxLength: 8,
    ),
    PentaPhoneFieldCountryCodesEnum.slovakia: PentaPhoneFieldPhoneInfo(
      countryName: _getCountryNameByLanguage(
        countryCode: PentaPhoneFieldCountryCodesEnum.slovakia,
        languageCode: languageCode,
      ),
      countryCode: 'SK',
      dialCode: '+421',
      flag: '🇸🇰',
      minLength: 9,
      maxLength: 9,
    ),
    PentaPhoneFieldCountryCodesEnum.slovenia: PentaPhoneFieldPhoneInfo(
      countryName: _getCountryNameByLanguage(
        countryCode: PentaPhoneFieldCountryCodesEnum.slovenia,
        languageCode: languageCode,
      ),
      countryCode: 'SI',
      dialCode: '+386',
      flag: '🇸🇮',
      minLength: 8,
      maxLength: 8,
    ),
    PentaPhoneFieldCountryCodesEnum.solomonIslands: PentaPhoneFieldPhoneInfo(
      countryName: _getCountryNameByLanguage(
        countryCode: PentaPhoneFieldCountryCodesEnum.solomonIslands,
        languageCode: languageCode,
      ),
      countryCode: 'SB',
      dialCode: '+677',
      flag: '🇸🇧',
      minLength: 7,
      maxLength: 7,
    ),
    PentaPhoneFieldCountryCodesEnum.somalia: PentaPhoneFieldPhoneInfo(
      countryName: _getCountryNameByLanguage(
        countryCode: PentaPhoneFieldCountryCodesEnum.somalia,
        languageCode: languageCode,
      ),
      countryCode: 'SO',
      dialCode: '+252',
      flag: '🇸🇴',
      minLength: 8,
      maxLength: 8,
    ),
    PentaPhoneFieldCountryCodesEnum.southAfrica: PentaPhoneFieldPhoneInfo(
      countryName: _getCountryNameByLanguage(
        countryCode: PentaPhoneFieldCountryCodesEnum.southAfrica,
        languageCode: languageCode,
      ),
      countryCode: 'ZA',
      dialCode: '+27',
      flag: '🇿🇦',
      minLength: 9,
      maxLength: 9,
    ),
    PentaPhoneFieldCountryCodesEnum.southKorea: PentaPhoneFieldPhoneInfo(
      countryName: _getCountryNameByLanguage(
        countryCode: PentaPhoneFieldCountryCodesEnum.southKorea,
        languageCode: languageCode,
      ),
      countryCode: 'KR',
      dialCode: '+82',
      flag: '🇰🇷',
      minLength: 10,
      maxLength: 10,
    ),
    PentaPhoneFieldCountryCodesEnum.southSudan: PentaPhoneFieldPhoneInfo(
      countryName: _getCountryNameByLanguage(
        countryCode: PentaPhoneFieldCountryCodesEnum.southSudan,
        languageCode: languageCode,
      ),
      countryCode: 'SS',
      dialCode: '+211',
      flag: '🇸🇸',
      minLength: 9,
      maxLength: 9,
    ),
    PentaPhoneFieldCountryCodesEnum.spain: PentaPhoneFieldPhoneInfo(
      countryName: _getCountryNameByLanguage(
        countryCode: PentaPhoneFieldCountryCodesEnum.spain,
        languageCode: languageCode,
      ),
      countryCode: 'ES',
      dialCode: '+34',
      flag: '🇪🇸',
      minLength: 9,
      maxLength: 9,
    ),
    PentaPhoneFieldCountryCodesEnum.sriLanka: PentaPhoneFieldPhoneInfo(
      countryName: _getCountryNameByLanguage(
        countryCode: PentaPhoneFieldCountryCodesEnum.sriLanka,
        languageCode: languageCode,
      ),
      countryCode: 'LK',
      dialCode: '+94',
      flag: '🇱🇰',
      minLength: 9,
      maxLength: 9,
    ),
    PentaPhoneFieldCountryCodesEnum.sudan: PentaPhoneFieldPhoneInfo(
      countryName: _getCountryNameByLanguage(
        countryCode: PentaPhoneFieldCountryCodesEnum.sudan,
        languageCode: languageCode,
      ),
      countryCode: 'SD',
      dialCode: '+249',
      flag: '🇸🇩',
      minLength: 9,
      maxLength: 9,
    ),
    PentaPhoneFieldCountryCodesEnum.suriname: PentaPhoneFieldPhoneInfo(
      countryName: _getCountryNameByLanguage(
        countryCode: PentaPhoneFieldCountryCodesEnum.suriname,
        languageCode: languageCode,
      ),
      countryCode: 'SR',
      dialCode: '+597',
      flag: '🇸🇷',
      minLength: 7,
      maxLength: 7,
    ),
    PentaPhoneFieldCountryCodesEnum.sweden: PentaPhoneFieldPhoneInfo(
      countryName: _getCountryNameByLanguage(
        countryCode: PentaPhoneFieldCountryCodesEnum.sweden,
        languageCode: languageCode,
      ),
      countryCode: 'SE',
      dialCode: '+46',
      flag: '🇸🇪',
      minLength: 9,
      maxLength: 9,
    ),
    PentaPhoneFieldCountryCodesEnum.switzerland: PentaPhoneFieldPhoneInfo(
      countryName: _getCountryNameByLanguage(
        countryCode: PentaPhoneFieldCountryCodesEnum.switzerland,
        languageCode: languageCode,
      ),
      countryCode: 'CH',
      dialCode: '+41',
      flag: '🇨🇭',
      minLength: 9,
      maxLength: 9,
    ),
    PentaPhoneFieldCountryCodesEnum.syria: PentaPhoneFieldPhoneInfo(
      countryName: _getCountryNameByLanguage(
        countryCode: PentaPhoneFieldCountryCodesEnum.syria,
        languageCode: languageCode,
      ),
      countryCode: 'SY',
      dialCode: '+963',
      flag: '🇸🇾',
      minLength: 9,
      maxLength: 9,
    ),
    PentaPhoneFieldCountryCodesEnum.taiwan: PentaPhoneFieldPhoneInfo(
      countryName: _getCountryNameByLanguage(
        countryCode: PentaPhoneFieldCountryCodesEnum.taiwan,
        languageCode: languageCode,
      ),
      countryCode: 'TW',
      dialCode: '+886',
      flag: '🇹🇼',
      minLength: 9,
      maxLength: 9,
    ),
    PentaPhoneFieldCountryCodesEnum.tajikistan: PentaPhoneFieldPhoneInfo(
      countryName: _getCountryNameByLanguage(
        countryCode: PentaPhoneFieldCountryCodesEnum.tajikistan,
        languageCode: languageCode,
      ),
      countryCode: 'TJ',
      dialCode: '+992',
      flag: '🇹🇯',
      minLength: 9,
      maxLength: 9,
    ),
    PentaPhoneFieldCountryCodesEnum.tanzania: PentaPhoneFieldPhoneInfo(
      countryName: _getCountryNameByLanguage(
        countryCode: PentaPhoneFieldCountryCodesEnum.tanzania,
        languageCode: languageCode,
      ),
      countryCode: 'TZ',
      dialCode: '+255',
      flag: '🇹🇿',
      minLength: 9,
      maxLength: 9,
    ),
    PentaPhoneFieldCountryCodesEnum.thailand: PentaPhoneFieldPhoneInfo(
      countryName: _getCountryNameByLanguage(
        countryCode: PentaPhoneFieldCountryCodesEnum.thailand,
        languageCode: languageCode,
      ),
      countryCode: 'TH',
      dialCode: '+66',
      flag: '🇹🇭',
      minLength: 9,
      maxLength: 9,
    ),
    PentaPhoneFieldCountryCodesEnum.togo: PentaPhoneFieldPhoneInfo(
      countryName: _getCountryNameByLanguage(
        countryCode: PentaPhoneFieldCountryCodesEnum.togo,
        languageCode: languageCode,
      ),
      countryCode: 'TG',
      dialCode: '+228',
      flag: '🇹🇬',
      minLength: 8,
      maxLength: 8,
    ),
    PentaPhoneFieldCountryCodesEnum.tonga: PentaPhoneFieldPhoneInfo(
      countryName: _getCountryNameByLanguage(
        countryCode: PentaPhoneFieldCountryCodesEnum.tonga,
        languageCode: languageCode,
      ),
      countryCode: 'TO',
      dialCode: '+676',
      flag: '🇹🇴',
      minLength: 7,
      maxLength: 7,
    ),
    PentaPhoneFieldCountryCodesEnum.trinidadAndTobago: PentaPhoneFieldPhoneInfo(
      countryName: _getCountryNameByLanguage(
        countryCode: PentaPhoneFieldCountryCodesEnum.trinidadAndTobago,
        languageCode: languageCode,
      ),
      countryCode: 'TT',
      dialCode: '+1868',
      flag: '🇹🇹',
      minLength: 7,
      maxLength: 7,
    ),
    PentaPhoneFieldCountryCodesEnum.tunisia: PentaPhoneFieldPhoneInfo(
      countryName: _getCountryNameByLanguage(
        countryCode: PentaPhoneFieldCountryCodesEnum.tunisia,
        languageCode: languageCode,
      ),
      countryCode: 'TN',
      dialCode: '+216',
      flag: '🇹🇳',
      minLength: 8,
      maxLength: 8,
    ),
    PentaPhoneFieldCountryCodesEnum.turkey: PentaPhoneFieldPhoneInfo(
      countryName: _getCountryNameByLanguage(
        countryCode: PentaPhoneFieldCountryCodesEnum.turkey,
        languageCode: languageCode,
      ),
      countryCode: 'TR',
      dialCode: '+90',
      flag: '🇹🇷',
      minLength: 10,
      maxLength: 10,
    ),
    PentaPhoneFieldCountryCodesEnum.turkmenistan: PentaPhoneFieldPhoneInfo(
      countryName: _getCountryNameByLanguage(
        countryCode: PentaPhoneFieldCountryCodesEnum.turkmenistan,
        languageCode: languageCode,
      ),
      countryCode: 'TM',
      dialCode: '+993',
      flag: '🇹🇲',
      minLength: 8,
      maxLength: 8,
    ),
    PentaPhoneFieldCountryCodesEnum.tuvalu: PentaPhoneFieldPhoneInfo(
      countryName: _getCountryNameByLanguage(
        countryCode: PentaPhoneFieldCountryCodesEnum.tuvalu,
        languageCode: languageCode,
      ),
      countryCode: 'TV',
      dialCode: '+688',
      flag: '🇹🇻',
      minLength: 6,
      maxLength: 6,
    ),
    PentaPhoneFieldCountryCodesEnum.uganda: PentaPhoneFieldPhoneInfo(
      countryName: _getCountryNameByLanguage(
        countryCode: PentaPhoneFieldCountryCodesEnum.uganda,
        languageCode: languageCode,
      ),
      countryCode: 'UG',
      dialCode: '+256',
      flag: '🇺🇬',
      minLength: 9,
      maxLength: 9,
    ),
    PentaPhoneFieldCountryCodesEnum.ukraine: PentaPhoneFieldPhoneInfo(
      countryName: _getCountryNameByLanguage(
        countryCode: PentaPhoneFieldCountryCodesEnum.ukraine,
        languageCode: languageCode,
      ),
      countryCode: 'UA',
      dialCode: '+380',
      flag: '🇺🇦',
      minLength: 9,
      maxLength: 9,
    ),
    PentaPhoneFieldCountryCodesEnum
        .unitedArabEmirates: PentaPhoneFieldPhoneInfo(
      countryName: _getCountryNameByLanguage(
        countryCode: PentaPhoneFieldCountryCodesEnum.unitedArabEmirates,
        languageCode: languageCode,
      ),
      countryCode: 'AE',
      dialCode: '+971',
      flag: '🇦🇪',
      minLength: 9,
      maxLength: 9,
    ),
    PentaPhoneFieldCountryCodesEnum.unitedKingdom: PentaPhoneFieldPhoneInfo(
      countryName: _getCountryNameByLanguage(
        countryCode: PentaPhoneFieldCountryCodesEnum.unitedKingdom,
        languageCode: languageCode,
      ),
      countryCode: 'GB',
      dialCode: '+44',
      flag: '🇬🇧',
      minLength: 10,
      maxLength: 10,
    ),
    PentaPhoneFieldCountryCodesEnum.unitedStates: PentaPhoneFieldPhoneInfo(
      countryName: _getCountryNameByLanguage(
        countryCode: PentaPhoneFieldCountryCodesEnum.unitedStates,
        languageCode: languageCode,
      ),
      countryCode: 'US',
      dialCode: '+1',
      flag: '🇺🇸',
      minLength: 10,
      maxLength: 10,
    ),
    PentaPhoneFieldCountryCodesEnum.uruguay: PentaPhoneFieldPhoneInfo(
      countryName: _getCountryNameByLanguage(
        countryCode: PentaPhoneFieldCountryCodesEnum.uruguay,
        languageCode: languageCode,
      ),
      countryCode: 'UY',
      dialCode: '+598',
      flag: '🇺🇾',
      minLength: 8,
      maxLength: 8,
    ),
    PentaPhoneFieldCountryCodesEnum.uzbekistan: PentaPhoneFieldPhoneInfo(
      countryName: _getCountryNameByLanguage(
        countryCode: PentaPhoneFieldCountryCodesEnum.uzbekistan,
        languageCode: languageCode,
      ),
      countryCode: 'UZ',
      dialCode: '+998',
      flag: '🇺🇿',
      minLength: 9,
      maxLength: 9,
    ),
    PentaPhoneFieldCountryCodesEnum.vanuatu: PentaPhoneFieldPhoneInfo(
      countryName: _getCountryNameByLanguage(
        countryCode: PentaPhoneFieldCountryCodesEnum.vanuatu,
        languageCode: languageCode,
      ),
      countryCode: 'VU',
      dialCode: '+678',
      flag: '🇻🇺',
      minLength: 7,
      maxLength: 7,
    ),
    PentaPhoneFieldCountryCodesEnum.vaticanCity: PentaPhoneFieldPhoneInfo(
      countryName: _getCountryNameByLanguage(
        countryCode: PentaPhoneFieldCountryCodesEnum.vaticanCity,
        languageCode: languageCode,
      ),
      countryCode: 'VA',
      dialCode: '+379',
      flag: '🇻🇦',
      minLength: 10,
      maxLength: 10,
    ),
    PentaPhoneFieldCountryCodesEnum.venezuela: PentaPhoneFieldPhoneInfo(
      countryName: _getCountryNameByLanguage(
        countryCode: PentaPhoneFieldCountryCodesEnum.venezuela,
        languageCode: languageCode,
      ),
      countryCode: 'VE',
      dialCode: '+58',
      flag: '🇻🇪',
      minLength: 10,
      maxLength: 10,
    ),
    PentaPhoneFieldCountryCodesEnum.vietnam: PentaPhoneFieldPhoneInfo(
      countryName: _getCountryNameByLanguage(
        countryCode: PentaPhoneFieldCountryCodesEnum.vietnam,
        languageCode: languageCode,
      ),
      countryCode: 'VN',
      dialCode: '+84',
      flag: '🇻🇳',
      minLength: 9,
      maxLength: 10,
    ),
    PentaPhoneFieldCountryCodesEnum.yemen: PentaPhoneFieldPhoneInfo(
      countryName: _getCountryNameByLanguage(
        countryCode: PentaPhoneFieldCountryCodesEnum.yemen,
        languageCode: languageCode,
      ),
      countryCode: 'YE',
      dialCode: '+967',
      flag: '🇾🇪',
      minLength: 9,
      maxLength: 9,
    ),
    PentaPhoneFieldCountryCodesEnum.zambia: PentaPhoneFieldPhoneInfo(
      countryName: _getCountryNameByLanguage(
        countryCode: PentaPhoneFieldCountryCodesEnum.zambia,
        languageCode: languageCode,
      ),
      countryCode: 'ZM',
      dialCode: '+260',
      flag: '🇿🇲',
      minLength: 9,
      maxLength: 9,
    ),
    PentaPhoneFieldCountryCodesEnum.zimbabwe: PentaPhoneFieldPhoneInfo(
      countryName: _getCountryNameByLanguage(
        countryCode: PentaPhoneFieldCountryCodesEnum.zimbabwe,
        languageCode: languageCode,
      ),
      countryCode: 'ZW',
      dialCode: '+263',
      flag: '🇿🇼',
      minLength: 9,
      maxLength: 9,
    ),
  };

  static String _getCountryNameByLanguage({
    required PentaPhoneFieldCountryCodesEnum countryCode,
    String languageCode = 'en',
  }) {
    switch (languageCode.toLowerCase()) {
      case 'tr':
        return _TurkishTrCountryNames.names[countryCode] ?? countryCode.name;
      case 'de':
        return _GermanDeCountryNames.names[countryCode] ?? countryCode.name;
      case 'fr':
        return _FrenchFrCountryNames.names[countryCode] ?? countryCode.name;
      case 'es':
        return _SpanishEsCountryNames.names[countryCode] ?? countryCode.name;
      case 'ru':
        return _RussianRuCountryNames.names[countryCode] ?? countryCode.name;
      case 'ja':
        return _JapaneseJpCountryNames.names[countryCode] ?? countryCode.name;
      case 'ko':
        return _KoreanKrCountryNames.names[countryCode] ?? countryCode.name;
      case 'it':
        return _ItalianItCountryNames.names[countryCode] ?? countryCode.name;
      case 'pt':
        return _PortuguesePtCountryNames.names[countryCode] ?? countryCode.name;
      case 'nl':
        return _DutchNlCountryNames.names[countryCode] ?? countryCode.name;
      case 'ar':
        return _ArabicSaCountryNames.names[countryCode] ?? countryCode.name;
      case 'hi':
        return _HindiInCountryNames.names[countryCode] ?? countryCode.name;
      case 'zh':
        return _ChineseCnCountryNames.names[countryCode] ?? countryCode.name;
      case 'bn':
        return _BengaliBdCountryNames.names[countryCode] ?? countryCode.name;
      case 'id':
        return _IndonesianIdCountryNames.names[countryCode] ?? countryCode.name;
      case 'vi':
        return _VietnameseVnCountryNames.names[countryCode] ?? countryCode.name;
      case 'th':
        return _ThaiThCountryNames.names[countryCode] ?? countryCode.name;
      case 'pl':
        return _PolishPlCountryNames.names[countryCode] ?? countryCode.name;
      case 'uk':
        return _UkrainianUaCountryNames.names[countryCode] ?? countryCode.name;
      case 'el':
        return _GreekGrCountryNames.names[countryCode] ?? countryCode.name;
      case 'sv':
        return _SwedishSeCountryNames.names[countryCode] ?? countryCode.name;
      case 'ur':
        return _UrduPkCountryNames.names[countryCode] ?? countryCode.name;
      case 'fa':
        return _PersianIrCountryNames.names[countryCode] ?? countryCode.name;
      case 'en':
      default:
        return _EnglishGbCountryNames.names[countryCode] ?? countryCode.name;
    }
  }
}

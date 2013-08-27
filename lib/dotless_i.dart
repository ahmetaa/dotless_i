library dotless_i;

const LATIN_CAPITAL_LETTER_I_CODE = 0x49;
const LATIN_SMALL_LETTER_I_CODE = 0x69;
const LATIN_SMALL_LETTER_DOTLESS_I = "ı";
const LATIN_CAPITAL_LETTER_I_WITH_DOT_ABOVE = "İ";

/**
 * Returns upper case form of a Turkish String.
 */
String toUpperCaseTr(String input) {
  if(input.length==0) return "";
  if(input.length==1) return _toUpper1Length(input);
  var buffer = new StringBuffer();
  List<int> toAppend = new List<int>();
  for(int codeUnit in input.codeUnits) {
    if(codeUnit==LATIN_SMALL_LETTER_I_CODE) {
      if(toAppend.length>0){
        buffer.write(new String.fromCharCodes(toAppend).toUpperCase());
        toAppend.clear();
      }
      buffer.write(LATIN_CAPITAL_LETTER_I_WITH_DOT_ABOVE);
    } else
    toAppend.add(codeUnit);
  }
  if(toAppend.length>0){
    buffer.write(new String.fromCharCodes(toAppend).toUpperCase());
  }
  return buffer.toString();
}

String _toUpper1Length(String input) {
  if(input.codeUnitAt(0)==LATIN_SMALL_LETTER_I_CODE)
    return LATIN_CAPITAL_LETTER_I_WITH_DOT_ABOVE;
  else return input.toUpperCase();
}

/**
 * Returns lower case form of a Turkish String.
 */
String toLowerCaseTr(String input) {
  if(input.length==0) return "";
  if(input.length==1) return _toLower1Length(input);
  var buffer = new StringBuffer();
  List<int> toAppend = new List<int>();
  for(int codeUnit in input.codeUnits) {
    if(codeUnit==LATIN_CAPITAL_LETTER_I_CODE) {
      if(toAppend.length>0){
        buffer.write(new String.fromCharCodes(toAppend).toLowerCase());
        toAppend.clear();
      }
      buffer.write(LATIN_SMALL_LETTER_DOTLESS_I);
    } else {
      toAppend.add(codeUnit);
    }
  }
  if(toAppend.length>0){
    buffer.write(new String.fromCharCodes(toAppend).toLowerCase());
  }
  return buffer.toString();
}

String _toLower1Length(String input) {
  if(input.codeUnitAt(0)==LATIN_CAPITAL_LETTER_I_CODE)
    return LATIN_SMALL_LETTER_DOTLESS_I;
  else return input.toLowerCase();
}

/**
 * Returns Capital cased form of a Turkish String.
 */
String toTitleCaseTr(String input) {
  if(input.length==0) return "";
  if(input.length==1) return _toUpper1Length(input);
  return "${_toUpper1Length(input.substring(0,1))}${toLowerCaseTr(input.substring(1))}";
}

/// Turkish alphabet aware String Comparator.
final Comparator<String> TURKISH_STRING_COMPARATOR =
    (String a, String b) => _compareTr(a, b, false);

/// Case insensitive Turkish alphabet aware String Comparator.
final Comparator<String> TURKISH_STRING_COMPARATOR_IGNORE_CASE =
    (String a, String b) => _compareTr(a, b, true);

class _Lookup {
  List<int> orderLookup = new List<int>.filled(0x160, -1);
  List<int> orderLookupIgnoreCase = new List<int>.filled(0x160, -1);

  _Lookup() {
    // English characters are included in alphabet.
    var alphabet = "ABCÇDEFGĞHIİJKLMNOÖPQRSŞTUÜVWXYZabcçdefgğhıijklmnoöpqrsştuüvwxyz";
    var letterCount = alphabet.length ~/ 2;
    for(int i = 0; i < alphabet.length; ++i) {
      int index = alphabet.codeUnitAt(i);
      orderLookup[index] = i;
      orderLookupIgnoreCase[index] = i % letterCount;
    }
  }

  int getOrder(int codeUnit) =>
      (codeUnit< 0x41 || codeUnit > 0x15F) ? -1 : orderLookup[codeUnit];

  int getOrderIgnoreCase(int codeUnit) =>
      (codeUnit< 0x41 || codeUnit > 0x15F) ? -1 : orderLookupIgnoreCase[codeUnit];
}

final _Lookup TR_CODE_UNIT_ORDER_LOOKUP = new _Lookup();

/// Some code is used from Dart core.
int _compareTr(String a, String b, bool ignoreCase) {
  int aLength = a.length;
  int bLength = b.length;
  int len = (aLength < bLength) ? aLength : bLength;
  for (int i = 0; i < len; i++) {
    int aCodePoint = a.codeUnitAt(i);
    int bCodePoint = b.codeUnitAt(i);

    int aCodePointTr = ignoreCase != true
        ? TR_CODE_UNIT_ORDER_LOOKUP.getOrder(aCodePoint)
        : TR_CODE_UNIT_ORDER_LOOKUP.getOrderIgnoreCase(aCodePoint);

    int bCodePointTr = ignoreCase != true
        ? TR_CODE_UNIT_ORDER_LOOKUP.getOrder(bCodePoint)
        : TR_CODE_UNIT_ORDER_LOOKUP.getOrderIgnoreCase(bCodePoint);

    if(aCodePointTr >= 0 && bCodePointTr >= 0) {
      aCodePoint = aCodePointTr;
      bCodePoint = bCodePointTr;
    }
    if (aCodePoint < bCodePoint) {
      return -1;
    }
    if (aCodePoint > bCodePoint) {
      return 1;
    }
  }
  if (aLength < bLength) return -1;
  if (aLength > bLength) return 1;
  return 0;
}
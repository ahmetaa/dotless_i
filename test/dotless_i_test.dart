library dotless_i_test;

import 'package:unittest/unittest.dart';
import 'package:dotless_i/dotless_i.dart';

main() {
  test('toUpperCaseTr', () {
    expect('ABCÇDEFGĞHIİJKLMNOÖPRSŞTUÜVYZ', toUpperCaseTr('abcçdefgğhıijklmnoöprsştuüvyz'));
    expect('IİJKLMNOÖPRSŞTUÜVYZ', toUpperCaseTr('ıijklmnoöprsştuüvyz'));
    expect('ABCÇDEFGĞHI', toUpperCaseTr('abcçdefgğhı'));
    expect('I', toUpperCaseTr('ı'));
    expect('İ', toUpperCaseTr('i'));
    expect('ΠİIΔ', toUpperCaseTr('πiıδ'));
  });

  test('toLowerCaseTr', () {
    expect('abcçdefgğhıijklmnoöprsştuüvyz', toLowerCaseTr('ABCÇDEFGĞHIİJKLMNOÖPRSŞTUÜVYZ'));
    expect('ıijklmnoöprsştuüvyz', toLowerCaseTr('IİJKLMNOÖPRSŞTUÜVYZ'));
    expect('abcçdefgğhı', toLowerCaseTr('ABCÇDEFGĞHI'));
    expect('ı', toLowerCaseTr('I'));
    expect('i', toLowerCaseTr('İ'));
    expect('πiıδ', toLowerCaseTr('ΠİIΔ'));
  });

  // Todo: Correct the form of unit tests -> expect(actual, expected)
  test('toCapitalCaseTr', () {
    expect('Abcçdefgğhıijklmnoöprsştuüvyz', toCapitalCaseTr('ABCÇDEFGĞHIİJKLMNOÖPRSŞTUÜVYZ'));
    expect('Iijklmnoöprsştuüvyz', toCapitalCaseTr('IİJKLMNOÖPRSŞTUÜVYZ'));
    expect('Abcçdefgğhı', toCapitalCaseTr('ABCÇDEFGĞHI'));
    expect('Abcçdefgğhıijklmnoöprsştuüvyz', toCapitalCaseTr('abcçdefgğhıijklmnoöprsştuüvyz'));
    expect('İjklmnoöprsştuüvyz', toCapitalCaseTr('ijklmnoöprsştuüvyz'));
    expect('Abcçdefgğhı', toCapitalCaseTr('abcçdefgğhı'));
    expect('I', toCapitalCaseTr('I'));
    expect('İ', toCapitalCaseTr('İ'));
    expect('Iı', toCapitalCaseTr('II'));
    expect('İi', toCapitalCaseTr('İİ'));
  });

  test('Comparator Test', () {
    expect(["d","ç"]..sort(TURKISH_STRING_COMPARATOR), orderedEquals(["ç","d"]));
    expect(["ü","ş","ö","i","ı","ğ","ç"]..sort(TURKISH_STRING_COMPARATOR),
        orderedEquals(["ç","ğ","ı","i","ö","ş","ü"]));
    expect(["Ü","Ş","Ö","İ","I","Ğ","Ç"]..sort(TURKISH_STRING_COMPARATOR),
        orderedEquals(["Ç","Ğ","I","İ","Ö","Ş","Ü"]));
    expect(["ü","ş","ö","i","ı","ğ","ç", "Ü","Ş","Ö","İ","I","Ğ","Ç"]..sort(TURKISH_STRING_COMPARATOR),
        orderedEquals(["Ç","Ğ","I","İ","Ö","Ş","Ü","ç","ğ","ı","i","ö","ş","ü"]));
    // English charcters are considered in alphabet.
    expect(["ü","q"]..sort(TURKISH_STRING_COMPARATOR), orderedEquals(["q","ü"]));
    // out of alphabet range and capital tests
    expect(["ü","πq"]..sort(TURKISH_STRING_COMPARATOR), orderedEquals(["ü","πq"]));
    expect(["ü","!q"]..sort(TURKISH_STRING_COMPARATOR), orderedEquals(["!q","ü"]));
    expect(["ü","Ü"]..sort(TURKISH_STRING_COMPARATOR), orderedEquals(["Ü","ü"]));
  });

  test('Comparator Test Ignore Case', () {
    expect(["D","ç"]..sort(TURKISH_STRING_COMPARATOR_IGNORE_CASE), orderedEquals(["ç","D"]));
    var list = ["ü","ş","ö","i","ı","ğ","ç", "Ü","Ş","Ö","İ","I","Ğ","Ç"];
    list.sort(TURKISH_STRING_COMPARATOR_IGNORE_CASE);
    expect(toLowerCaseTr(list.toString()), "[ç, ç, ğ, ğ, ı, ı, i, i, ö, ö, ş, ş, ü, ü]");
    expect(["Ü","Ş","Ö","İ","I","Ğ","Ç"]..sort(TURKISH_STRING_COMPARATOR_IGNORE_CASE),
        orderedEquals(["Ç","Ğ","I","İ","Ö","Ş","Ü"]));
  });
}
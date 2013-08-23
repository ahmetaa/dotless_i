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
  });
  test('toLowerCaseTr', () {
    expect('abcçdefgğhıijklmnoöprsştuüvyz', toLowerCaseTr('ABCÇDEFGĞHIİJKLMNOÖPRSŞTUÜVYZ'));
    expect('ıijklmnoöprsştuüvyz', toLowerCaseTr('IİJKLMNOÖPRSŞTUÜVYZ'));
    expect('abcçdefgğhı', toLowerCaseTr('ABCÇDEFGĞHI'));
    expect('ı', toLowerCaseTr('I'));
    expect('i', toLowerCaseTr('İ'));
  });

  test('comparatorTest', () {
    expect(["d","ç"]..sort(TURKISH_STRING_COMPARATOR), orderedEquals(["ç","d"]));
    expect(["ü","ş","ö","i","ı","ğ","ç"]..sort(TURKISH_STRING_COMPARATOR),
        orderedEquals(["ç","ğ","ı","i","ö","ş","ü"]));
    expect(["Ü","Ş","Ö","İ","I","Ğ","Ç"]..sort(TURKISH_STRING_COMPARATOR),
        orderedEquals(["Ç","Ğ","I","İ","Ö","Ş","Ü"]));
    expect(["ü","ş","ö","i","ı","ğ","ç", "Ü","Ş","Ö","İ","I","Ğ","Ç"]..sort(TURKISH_STRING_COMPARATOR),
        orderedEquals(["Ç","Ğ","I","İ","Ö","Ş","Ü","ç","ğ","ı","i","ö","ş","ü"]));
    // English charcters are considered in alphabet.
    expect(["ü","q"]..sort(TURKISH_STRING_COMPARATOR), orderedEquals(["q","ü"]));
  });

  test('comparatorTestIgnoreCase', () {
    expect(["D","ç"]..sort(TURKISH_STRING_COMPARATOR_IGNORE_CASE), orderedEquals(["ç","D"]));
    var list = ["ü","ş","ö","i","ı","ğ","ç", "Ü","Ş","Ö","İ","I","Ğ","Ç"];
    list.sort(TURKISH_STRING_COMPARATOR_IGNORE_CASE);
    expect(toLowerCaseTr(list.toString()), "[ç, ç, ğ, ğ, ı, ı, i, i, ö, ö, ş, ş, ü, ü]");
    expect(["Ü","Ş","Ö","İ","I","Ğ","Ç"]..sort(TURKISH_STRING_COMPARATOR_IGNORE_CASE),
        orderedEquals(["Ç","Ğ","I","İ","Ö","Ş","Ü"]));
  });
}
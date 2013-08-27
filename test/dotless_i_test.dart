library dotless_i_test;

import 'package:unittest/unittest.dart';
import 'package:dotless_i/dotless_i.dart';

main() {
  test('toUpperCaseTr', () {
    expect(toUpperCaseTr('abcçdefgğhıijklmnoöprsştuüvyz'), 'ABCÇDEFGĞHIİJKLMNOÖPRSŞTUÜVYZ');
    expect(toUpperCaseTr('ıijklmnoöprsştuüvyz'), 'IİJKLMNOÖPRSŞTUÜVYZ');
    expect(toUpperCaseTr('abcçdefgğhı'), 'ABCÇDEFGĞHI');
    expect(toUpperCaseTr('ı'), 'I');
    expect(toUpperCaseTr('i'), 'İ');
    expect(toUpperCaseTr('πiıδ'), 'ΠİIΔ');
    expect(toUpperCaseTr(''), '');
    expect(toUpperCaseTr('\u{1D11E}'), '\u{1D11E}');
    expect(toUpperCaseTr('i\u{1D11E}i'), 'İ\u{1D11E}İ');
  });

  test('toLowerCaseTr', () {
    expect(toLowerCaseTr('ABCÇDEFGĞHIİJKLMNOÖPRSŞTUÜVYZ'), 'abcçdefgğhıijklmnoöprsştuüvyz');
    expect(toLowerCaseTr('IİJKLMNOÖPRSŞTUÜVYZ'), 'ıijklmnoöprsştuüvyz');
    expect(toLowerCaseTr('ABCÇDEFGĞHI'), 'abcçdefgğhı');
    expect(toLowerCaseTr('I'), 'ı');
    expect(toLowerCaseTr('İ'), 'i');
    expect(toLowerCaseTr('ΠİIΔ'), 'πiıδ');
    expect(toLowerCaseTr(''), '');
  });

  test('toTitleCaseTr', () {
    expect(toTitleCaseTr('ABCÇDEFGĞHIİJKLMNOÖPRSŞTUÜVYZ'), 'Abcçdefgğhıijklmnoöprsştuüvyz');
    expect(toTitleCaseTr('IİJKLMNOÖPRSŞTUÜVYZ'), 'Iijklmnoöprsştuüvyz');
    expect(toTitleCaseTr('ABCÇDEFGĞHI'), 'Abcçdefgğhı');
    expect(toTitleCaseTr('abcçdefgğhıijklmnoöprsştuüvyz'), 'Abcçdefgğhıijklmnoöprsştuüvyz');
    expect(toTitleCaseTr('ijklmnoöprsştuüvyz'), 'İjklmnoöprsştuüvyz');
    expect(toTitleCaseTr('abcçdefgğhı'), 'Abcçdefgğhı');
    expect(toTitleCaseTr('I'), 'I');
    expect(toTitleCaseTr('İ'), 'İ');
    expect(toTitleCaseTr('II'), 'Iı');
    expect(toTitleCaseTr('İİ'), 'İi');
    expect(toTitleCaseTr(''), '');
  });

  test('Comparator Test', () {
    expect(["d","ç"]..sort(TURKISH_STRING_COMPARATOR), orderedEquals(["ç","d"]));
    expect(["ü","ş","ö","i","ı","ğ","ç"]..sort(TURKISH_STRING_COMPARATOR),
        orderedEquals(["ç","ğ","ı","i","ö","ş","ü"]));
    expect(["Ü","Ş","Ö","İ","I","Ğ","Ç"]..sort(TURKISH_STRING_COMPARATOR),
        orderedEquals(["Ç","Ğ","I","İ","Ö","Ş","Ü"]));
    expect(["ü","ş","ö","i","ı","ğ","ç", "Ü","Ş","Ö","İ","I","Ğ","Ç"]..sort(TURKISH_STRING_COMPARATOR),
        orderedEquals(["Ç","Ğ","I","İ","Ö","Ş","Ü","ç","ğ","ı","i","ö","ş","ü"]));
    expect(["ü","q"]..sort(TURKISH_STRING_COMPARATOR), orderedEquals(["q","ü"]));
    expect(["ü","πq"]..sort(TURKISH_STRING_COMPARATOR), orderedEquals(["ü","πq"]));
    expect(["ü","!q"]..sort(TURKISH_STRING_COMPARATOR), orderedEquals(["!q","ü"]));
    expect(["ü","Ü"]..sort(TURKISH_STRING_COMPARATOR), orderedEquals(["Ü","ü"]));
    expect(["ü",""]..sort(TURKISH_STRING_COMPARATOR), orderedEquals(["","ü"]));
  });

  test('Comparator Test Ignore Case', () {
    expect(["D","ç"]..sort(TURKISH_STRING_COMPARATOR_IGNORE_CASE), orderedEquals(["ç","D"]));
    var list = ["ü","ş","ö","i","ı","ğ","ç", "Ü","Ş","Ö","İ","I","Ğ","Ç"];
    list.sort(TURKISH_STRING_COMPARATOR_IGNORE_CASE);
    expect(toLowerCaseTr(list.toString()), "[ç, ç, ğ, ğ, ı, ı, i, i, ö, ö, ş, ş, ü, ü]");
    expect(["Ü","Ş","Ö","İ","I","Ğ","Ç"]..sort(TURKISH_STRING_COMPARATOR_IGNORE_CASE),
        orderedEquals(["Ç","Ğ","I","İ","Ö","Ş","Ü"]));
    expect(["ü",""]..sort(TURKISH_STRING_COMPARATOR_IGNORE_CASE), orderedEquals(["","ü"]));
  });
}
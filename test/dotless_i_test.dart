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
  
  var inputL = "kısa şiir";
  var inputU = "KISA ŞİİR";  
  print("UpperCase for $inputL");
  print("Default= ${inputL.toUpperCase()}, Turkish=${toUpperCaseTr(inputL)}\n"); 
  print("LowerCase for $inputU");
  print("Default= ${inputU.toLowerCase()}, Turkish=${toLowerCaseTr(inputU)}\n");  
  
  var list = ["ağ","aç","ad"];
  print("Input= $list");
  print("Default Sort= ${list..sort()}");
  
  list = ["ağ","aç","ad"];  
  print("Turkish Sort= ${list..sort(TURKISH_STRING_COMPARATOR)}");  
  
}
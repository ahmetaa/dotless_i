import 'package:dotless_i/dotless_i.dart';

main() {
  // upperCaseTr
  var inputL = "kısa şiir"; 
  print("UpperCase for [$inputL]");
  print("Default= ${inputL.toUpperCase()}, Turkish=${toUpperCaseTr(inputL)}\n");
  
  // lowerCaseTr
  var inputU = "KISA ŞİİR";  
  print("LowerCase for [$inputU]");
  print("Default= ${inputU.toLowerCase()}, Turkish=${toLowerCaseTr(inputU)}\n");  
    
  // sort Default
  var list = ["Az","ağ","aç","ad"];
  print("Input= $list");
  print("Default Sort= ${list..sort()}");
    
  // sort Turkish  
  list = ["Az","ağ","aç","ad"];  
  print("Turkish Sort= ${list..sort(TURKISH_STRING_COMPARATOR)}"); 
  
  // sort Turkish ignore case  
  list = ["Az","ağ","aç","ad"];  
  print("Turkish Sort Ignore Case= ${list..sort(TURKISH_STRING_COMPARATOR_IGNORE_CASE)}");  
}
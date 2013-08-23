dotless_i
=========

Turkish String upper-lower case converter and comparator functions for Dart. This methods are necessary because default unicode casing
rules does not work for Turkish i->İ and I->i conversions.  
  
Name of the library is "dotless i" because the notorious "ı" character (together with İ) caused countless trouble in computing for Turkish.
Case methods can be used for some other Turkic alphabets as well. Current implementation does not handle two code unit
variations yet. Complete special casing rules are defined here : (ftp://ftp.unicode.org/Public/UCD/latest/ucd/SpecialCasing.txt)  

Usage Example:   


	import 'package:dotless_i/dotless_i.dart';
	...
	var inputL = "kısa şiir"; 
	print("UpperCase for [$inputL]");
	print("Default= ${inputL.toUpperCase()}, Turkish=${toUpperCaseTr(inputL)}\n");
	
	var inputU = "KISA ŞİİR";	 
	print("LowerCase for [$inputU]");
	print("Default= ${inputU.toLowerCase()}, Turkish=${toLowerCaseTr(inputU)}\n");  
	  
	var list = ["ağ","aç","ad"];
	print("Input= $list");
	print("Default Sort= ${list..sort()}");
	  
	list = ["ağ","aç","ad"];  
	print("Turkish Sort= ${list..sort(TURKISH_STRING_COMPARATOR)}"); 
	
	
	Output:
	UpperCase for [kısa şiir]
	Default= KISA ŞIIR, Turkish=KISA ŞİİR
	
	LowerCase for [KISA ŞİİR]
	Default= kisa şiir, Turkish=kısa şiir
	
	Input= [ağ, aç, ad]
	Default Sort= [ad, aç, ağ]
	Turkish Sort= [aç, ad, ağ]

## Change List
*0.1.1* Remove unnecessary checks that are already handled by default case conversion. Documentation changes after G+ discussion.  
*0.1.0* Initial Release.  
	

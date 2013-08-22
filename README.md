dotless_i
=========

Turkish String upper-lower case converter and comparator functions for Dart. Name of the library is
"dotless i" because the notorious "ı" character caused countless trouble in computing for Turkish.

	import 'package:dotless_i/dotless_i.dart';
	...
	print(toUpperCaseTr("kısa şiir"));
	print(toLowerCaseTr("YEŞİL SIĞIR));
	var list = ["açı","acı","ağa","Çalı"];
	print(list.sort(TURKISH_STRING_COMPARATOR));	
	
	Output:
	KISA ŞİİR
	yeşil sığır
	Çalı acı ağa açı

## Change List
*0.1.0* Initial Release.  
	

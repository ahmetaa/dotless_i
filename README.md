dotless_i
=========

Turkish String upper-lower case converter and comparator functions for Dart. This library is a necessary workaround because
currently Dart only supports default unicode mappings for casing and that does not work for Turkish i->İ and I->ı conversions.

Name of the library is "dotless i (ı)" because the "ı" character (together with İ) caused countless trouble in computing for Turkish.
Case methods can be used for some other Turkic alphabets as well (such as  Azerbaijani). Current implementation does not handle two code-unit
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

	var list = ["Az","ağ","aç","ad"];
	print("Input= $list");
	print("Default Sort= ${list..sort()}");

	list = ["Az","ağ","aç","ad"];
	print("Turkish Sort= ${list..sort(TURKISH_STRING_COMPARATOR)}");

	list = ["Az","ağ","aç","ad"];
	print("Turkish Sort Ignore Case= ${list..sort(TURKISH_STRING_COMPARATOR_IGNORE_CASE)}");

	Output:
	UpperCase for [kısa şiir]
	Default= KISA ŞIIR, Turkish=KISA ŞİİR

	LowerCase for [KISA ŞİİR]
	Default= kisa şiir, Turkish=kısa şiir

	Input= [Az, ağ, aç, ad]
	Default Sort= [Az, ad, aç, ağ]
	Turkish Sort= [Az, aç, ad, ağ]
	Turkish Sort Ignore Case= [aç, ad, ağ, Az]

## Change List
*0.1.4* Add toTitleCaseTr(). Empty string handling and improved tests.
*0.1.3* Bug fix in lookup code.
*0.1.2* Add ignore-case comparator (by mdakin). Documentation fixes.
*0.1.1* Remove unnecessary checks that are already handled by default case conversion. Documentation changes after G+ discussion.
*0.1.0* Initial Release.



// Method: stripNonPrintingCharacters
// Strip Non Printing characters.
// Description: Remove non-printing characters from a string
//-----------------------------------------------------------------------------
String stripNonPrintingCharacters(String str) {
  final regExp = RegExp('[^\x20-\x7E]');
  return str.replaceAll(regExp, '');
}
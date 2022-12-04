class Vigener
{
  static int mod(int val, int mod) {
    return (val % mod + mod) % mod;
  }
  

   static String Encryption(String txt,String key) {
    txt = txt.replaceAll(' ', '');
    key = key.replaceAll(' ', '');
    txt = txt.toUpperCase();
    key = key.toUpperCase();
    String res = "";
    int j = 0;
    for (int i = 0; i < txt.length; i++) {
      if (txt[i].isNotEmpty) {
        res += String.fromCharCode(
            (txt.codeUnitAt(i) + key.codeUnitAt(j)) % 26 + 65);
      } else {
        res += txt[i];
      }
      if (j < key.length - 1) {
        j++;
      } else {
        j = 0;
      }
    }
    return res;
  }

  static String Decryption(String txt,String key) {
    txt = txt.replaceAll(' ', '');
    key = key.replaceAll(' ', '');
    txt = txt.toUpperCase();
    key = key.toUpperCase();
    String res = "";
    int j = 0;

    for (int i = 0; i < txt.length; i++) {
      if (txt[i].isNotEmpty) {
        res += String.fromCharCode(mod((txt.codeUnitAt(i) - key.codeUnitAt(j)), 26) + 65);
      } else {
        res += txt[i];
      }

      if (j < key.length - 1)
        j++;
      else
        j = 0;
    }
    return res;
  }
}

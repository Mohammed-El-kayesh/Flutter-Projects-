class AutoKey
{
   static String alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";

   static String Encryption(String txt, String key)
  {
    txt = txt.replaceAll(' ', '');
    key = key.replaceAll(' ', '');
    txt = txt.toUpperCase();
    key = key.toUpperCase();
    int len = txt.length;

    String newKey = key + txt;
    newKey = newKey.substring(0, newKey.length
        - key.length);
    String encrypttxt = "";

    for (int x = 0; x < len; x++) {
      int first = alphabet.indexOf(txt[x]);
      int second = alphabet.indexOf(newKey[x]);
      int total = (first + second) % 26;
      encrypttxt += alphabet[total];
    }
    return encrypttxt;
  }

    static String Decryption(String txt, String key)
   {
     txt = txt.replaceAll(' ', '');
     key = key.replaceAll(' ', '');
     txt = txt.toUpperCase();
     key = key.toUpperCase();
     String currentKey = key;
     String decrypttxt = "";

     for (int x = 0; x < txt.length; x++) {
       int get1 = alphabet.indexOf(txt[x]);
       int get2 = alphabet.indexOf(currentKey[x]);
       int total = (get1 - get2) % 26;
       total = (total < 0) ? total + 26 : total;
       decrypttxt += alphabet[total];
       currentKey += alphabet[total];
     }
     return decrypttxt;
   }
}


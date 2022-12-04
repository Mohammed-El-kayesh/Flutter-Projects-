
class Caser {

  static int mod(int val, int mod) {
    return (val % mod + mod) % mod;
  }

  static String Encryption(String text, int key) {
    String resultE = "";
    for (int i = 0; i < text.length; i++) {
      int ch = text.codeUnitAt(i);
      int offset;
      if (ch >= 'a'.codeUnitAt(0) && ch <= 'z'.codeUnitAt(0)) {
        offset = 97;
      } else if (ch >= 'A'.codeUnitAt(0) && ch <= 'Z'.codeUnitAt(0)) {
        offset = 65;
      } else if (ch == ' '.codeUnitAt(0)) {
        resultE += " ";
        continue;
      }

      int c = (ch + key - offset) % 26;
      resultE += String.fromCharCode(c + offset);

    }
    return resultE.toUpperCase();
  }

  static String Decryption(String text, int key) {
    String resultD = "";
    for (int i = 0; i < text.length; i++) {
      int ch = text.codeUnitAt(i);
      int offset;
      if (ch >= 'a'.codeUnitAt(0) && ch <= 'z'.codeUnitAt(0)) {
        offset = 97;
      } else if (ch >= 'A'.codeUnitAt(0) && ch <= 'Z'.codeUnitAt(0)) {
        offset = 65;
      } else if (ch == ' '.codeUnitAt(0)) {
        resultD += " ";
        continue;
      }
      int c = (ch - key - offset) % 26;
      resultD += String.fromCharCode(c + offset);

    }
    return resultD.toUpperCase();

  }
}


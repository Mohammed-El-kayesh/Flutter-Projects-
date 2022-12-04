
import 'package:flutter/material.dart';

class Playfair {
  String playfairEncrypt(String text, String key) {
    String table = '';
    String resultE = '';
    text = text.replaceAll(' ', '');
    text = text.replaceAll('j', 'i');
    key = key.replaceAll(' ', '');
    text = text.toLowerCase();
    key = key.toLowerCase();

    for (var i = 0; i < text.length - 1; i++) {
      if (text[i] == text[i + 1])
        text = text.substring(0, i + 1) + 'x' + text.substring(i + 1, text.length);
    }
    if (text.length % 2 != 0) text += 'x';

    var matrix = List.generate(5, (i) => List.filled(5, "", growable: false)),
        index = 0;

    for (var i = 0; i < key.length; i++) {
      if (table.contains(key[i]) == false) {
        if (key[i] != 'j') table += key[i];
      }
    }

    for (var i = 'a'.codeUnitAt(0); i <= 'z'.codeUnitAt(0); i++) {
      if (table.contains(String.fromCharCode(i)) == false &&
          String.fromCharCode(i) != 'j') table += String.fromCharCode(i);
    }

    for (var i = 0; i < 5; i++)
      for (var j = 0; j < 5; j++) matrix[i][j] = table[index++] ;
    for (var i = 0; i < text.length; i += 2) {
      int row1, row2, col1, col2;
      for (var j = 0; j < 5; j++) {
        if (matrix[j].contains(text[i]) == true) {
          row1 = j;
          col1 = matrix[j].indexOf(text[i] );
        }
        if (matrix[j].contains(text[i + 1]) == true) {
          row2 = j;
          col2 = matrix[j].indexOf(text[i + 1] );
        }
      }
      if (row1 == row2) {
        resultE = resultE + matrix[row1][(col1 + 1) % 5];

        resultE = resultE + matrix[row2][(col2 + 1) % 5];
      } else if (col1 == col2) {
        resultE = resultE + matrix[(row1 + 1) % 5][col1];
        resultE = resultE + matrix[(row2 + 1) % 5][col2];
      } else {
        resultE = resultE + matrix[row1][col2];
        resultE = resultE + matrix[row2][col1];
      }
    }
    return resultE.toUpperCase();
  }

  String playfairDecrypt(String text, String key) {
    String table = '';
    var resultD='';
    text = text.replaceAll(' ', '');
    key = key.replaceAll(' ', '');
    text = text.toLowerCase();
    key = key.toLowerCase();

    var matrix = List.generate(5, (i) => List(5)), index = 0;

    for (var i = 0; i < key.length; i++) {
      if (table.contains(key[i]) == false) {
        if (key[i] != 'j') table += key[i];
      }
    }

    for (var i = 'a'.codeUnitAt(0); i <= 'z'.codeUnitAt(0); i++) {
      if (table.contains(String.fromCharCode(i)) == false &&
          String.fromCharCode(i) != 'j') {
        table += String.fromCharCode(i);
      }
    }

    for (var i = 0; i < 5; i++) {
      for (var j = 0; j < 5; j++) {
        matrix[i][j] = table[index++];
      }
    }

    for (var i = 0; i < text.length; i += 2) {
      int row1, row2, col1, col2;
      for (var j = 0; j < 5; j++) {
        if (matrix[j].contains(text[i]) == true) {
          row1 = j;
          col1 = matrix[j].indexOf(text[i]);
        }
        if (matrix[j].contains(text[i + 1]) == true) {
          row2 = j;
          col2 = matrix[j].indexOf(text[i + 1]);
        }
      }
      if (row1 == row2) {
        resultD += matrix[row1][(col1 - 1) % 5];
        resultD += matrix[row2][(col2 - 1) % 5];
      } else if (col1 == col2) {
        resultD += matrix[(row1 - 1) % 5][col1];
        resultD += matrix[(row2 - 1) % 5][col2];
      } else {
        resultD += matrix[row1][col2];
        resultD += matrix[row2][col1];
      }
    }
    return resultD.toUpperCase();
  }

}

import 'package:encrypt/encrypt.dart';



  String createToken(String date)
  {
    final key = Key.fromLength(32);
    final iv = IV.fromLength(16);
    final encrypter = Encrypter(AES(key));

    final encrypted = encrypter.encrypt(date, iv: iv);
    final decrypted = encrypter.decrypt(encrypted, iv: iv);

//    print(decrypted);
//    print(encrypted.bytes);
//    print(encrypted.base16);
//    print(encrypted.base64);

    return encrypted.base16;
  }

import 'package:encrypt/encrypt.dart' as crypt;
import 'package:crypto/crypto.dart' as crypto;


class Encryption {
  static decryptPk({
    required String encryptedPk,
    required String walletPw,
  }) {
    const myPK =
        "0xf532d52ead99ec87afc56923f4a3d011b4f12a83e2f1fa5bf2d2e086d1019323";
    const myEncryptedPk =
        "U2FsdGVkX1/EyFDMJQtTHY9kSzSm7BjdWv4JUM7maE6Ocu6COhRW/gksXV0oy0kyqtNLLFg0YO02Nht7s6H9SGAc/38djbw+TVAqDqajyUrFB31bJM85Wc65am0BGRvj";
    final walletPwKey = crypt.Key.fromUtf8("Iskra07!");

    print(crypto)

    // print(walletPwKey);

    // final encryptered = crypt.Encrypter(crypt.AES(walletPwKey));

    // print(encryptered);

    // var keyIv = crypt.IV.fromLength(16);
    // print(encryptered.encrypt(myPK, iv: keyIv));

    // // final lengths = [128, 192, 256];

    // // for (var i = 0; i < lengths.length; i++) {

    // // }
  }
}

// 0xf532d52ead99ec87afc56923f4a3d011b4f12a83e2f1fa5bf2d2e086d1019323
// U2FsdGVkX1/EyFDMJQtTHY9kSzSm7BjdWv4JUM7maE6Ocu6COhRW/gksXV0oy0kyqtNLLFg0YO02Nht7s6H9SGAc/38djbw+TVAqDqajyUrFB31bJM85Wc65am0BGRvj
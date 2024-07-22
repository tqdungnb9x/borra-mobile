import 'package:borra_app/app_base/config/app_config.dart';
import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';

class JWTCreate {
  static String hs256({required String email}) {
    String token;

    /* Sign */ {
      // Create a json web token
      final jwt = JWT(
        {
          'site': AppConfig.instance.env.siteUrl,
          'email': email,
          "watched_ad": "done"
        },
      );

      // Sign it
      token = jwt.sign(SecretKey(AppConfig.instance.env.serverKey));
      print('Signed token: $token\n');
    }

    /* Verify */ {
      try {
        // Verify a token
        final jwt =
            JWT.verify(token, SecretKey(AppConfig.instance.env.serverKey));

        print('Payload: ${jwt.payload}');
      } on JWTExpiredException {
        print('jwt expired');
      } on JWTException catch (ex) {
        print(ex.message); // ex: invalid signature
      }
    }
    return token;
  }
}

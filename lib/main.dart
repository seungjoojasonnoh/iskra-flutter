import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:iskra_flutter/components/wallet_action.dart';
import 'package:iskra_flutter/components/wallet_overview.dart';
import 'package:iskra_flutter/components/wallet_profile.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  void test() async {
    var url = Uri.https('api.iskra.world', 'auth/v1/users/login');
    var result = await http.post(url, body: {
      "email": "jason.noh@iskra.world",
      "password": "1Q2w3e!!",
      "captchaToken":
          "03AL8dmw-dswt_iWu6uF8VV9FCNBRQjL63kw5eO6ajW-THDRJRvZf3b_92Gi9lko2MfQr2h5Nhyikkyg39sp-k65hlzQ1gAObaEtzHeLrQ4bFBYQebIAkGC28WPR90pJK1YxF8ikbXs_SK1uWw-NcnONxt-Krw4oTn9CKnarl3GGlBSPrmts76QaPJRIGNL5nkeeV3u3XOSITCGq6GwVXLGb0Bgz8kIzApP1LDp6bLF__MVR3yIC8eRx4glALjsLBQLhPmlnnVGGz2J2lriTj-85WgbO1LTr3zI0_Z5ikfUvqnywaz2_BLtRE9F2fbcNnXNgxL1te8cxCV1noLaCL0PCN0btqlTUrzSmSJ7OO7M3JS76Ncd7HUSbrcYrp9pI3untkAGB6jkor3EgwZUCK4L-aX7duvHTyWtuNtV1AmAYwsxALyqZYxqIcTeL0Hfl0pREVLatbeKe5bVzrw4re8jwhRTZURsD4QB-OEgdbrSAot53YPpGGgMALGzrO-eLI3yeuAzr0CbU1Xl5yhjcW2W-p_x_B6m8XCv6BnzEM8k3MWckJkOVBegp_d9Oqxr1hRmUGwCoWHX9imxaJiQclJ84Ck7yZCxjFpZTIVs8vE9LcMBD3yQLOge37xY-XMiID5MAk-YijsFHdNpIVQzg3QKLNJgx8eXpqjnSCX7yc9o4h4FjuypPhPbKErui8UtYKGVRNNHzdqU_zwaC7WB1huJagAGszybXblU1rrFPYCexmTIN_djeXD1aFMhnM1OA0QEbpOClfiR3gK7BNqrJxXvgAiwSqVvft9nalbtuf37ABJZ6W4detMWdEp9NTUoTnbc0ZXuIsUFZ09bNTMD_5LdBSRHr2LnxpBC2sKpkh0Z5GEbSh6D8jrP5JE-WRQXNUmvBg-eOIPTGhYFWvl6pUJ457kDFkXkFLwYl1b38P53K6GBGAsgMB9n2c-AqBEDPdTqfTZanwraNcJQO2NCQSNkr9NlCKgDEc5w8-yhgt-A1bXGFpiEMmo29K3G59GO7m8svRhCkGLaG15YA0XpaUvCa6lWWPQqbhJIi8FjhlZwIkxO2y5wESJtKYVe30qsELzwd-plM_ypv9VrWusZIfa0ukf4VJXxHyiWvLMXzxZemB01OAu4Gc3PjVS0g7g4YzoFfQXzFd3r-j4fmIYhqVPfoml1-tJlIUqjJcburQq9EdjyUX_mGISSv4wQ--MYpCj3NplmZ8fVZM08REYuEeo0UfDHKiGiJZjZGnzZbN6j6c0oBgFyi19a6yirNxZyHQrHbtgDn_BKrZiIrWmcaFHmjEXiCqT9bFNbhT5H1YkP6xGYLk2KmE8sM6-2J8-yJFwSriRbaDFX6to0c_6TpKX7DWAT4qmUmPzhF7sCCePCiGXK5G05Ipog3r3pW0ovnmusYb8NW50QL-ISlEZSn0QlkVO7c82RYurGJit3EG87OIdx-tKjSn29es7qhWYkZNwJCeupIZis_0kMje0zOinvqEov2E4-FtDug",
      "captchaVersion": "v3",
    });
    print(result.headers);
    print(result.body);
    print(utf8.decode(result.bodyBytes));
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    test();
    return MaterialApp(
      title: 'Iskra',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFF171926),
        textTheme: const TextTheme(
          headlineLarge: TextStyle(color: Colors.white, fontSize: 32),
          headlineMedium: TextStyle(color: Colors.white, fontSize: 27),
          titleLarge: TextStyle(color: Colors.white, fontSize: 22),
          titleMedium: TextStyle(color: Colors.white, fontSize: 20),
          titleSmall: TextStyle(color: Colors.white, fontSize: 15),
          bodyLarge: TextStyle(color: Colors.white, fontSize: 18),
          bodyMedium: TextStyle(color: Colors.white, fontSize: 17),
          bodySmall: TextStyle(color: Colors.white, fontSize: 16),
        ),
      ),
      builder: (context, child) {
        return SafeArea(
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              centerTitle: false,
              title: const Text('Iskra'),
              elevation: 0,
            ),
            body: const SingleChildScrollView(
              padding: EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  WalletProfile(),
                  SizedBox(
                    height: 18,
                  ),
                  WalletAction(),
                  SizedBox(
                    height: 18,
                  ),
                  WalletOverview(),
                  SizedBox(
                    height: 18,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:iskra_flutter/components/wallet_action.dart';
import 'package:iskra_flutter/components/wallet_overview.dart';
import 'package:iskra_flutter/components/wallet_profile.dart';
import 'package:http/http.dart' as http;
import 'package:iskra_flutter/models/token.dart';
import 'package:iskra_flutter/models/wallet.dart';
import 'package:iskra_flutter/services/request.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Wallet? wallet;

  @override
  void initState() {
    prepareWalletInfo();
    super.initState();
  }

  void prepareWalletInfo() async {
    var cookie = await Request.getCookie();
    var headers = Request.headers;
    headers['Cookie'] = cookie;
    var walletAddress = await http.get(
        Uri.parse('${Request.baseUrl}core/v2/wallet'),
        headers: Request.headers);
    var balances = await http.get(
        Uri.parse('${Request.baseUrl}core/v2/wallet/balances'),
        headers: Request.headers);

    Map<int, List<Token>> tokenMap = {};
    var balancesArr = jsonDecode(balances.body)['balances'] as List;

    for (var balance in balancesArr) {
      var chainId = balance['chainId'];
      var tokens = (balance['balances'] as List)
          .map(
            (balance) => Token(
              symbol: balance['symbol'],
              balance: balance['balance'],
              image: balance['imageUrl'],
              description: balance['description'],
            ),
          )
          .toList();
      tokenMap[chainId] = tokens;
    }

    var wallet = Wallet(
      walletAddress: jsonDecode(walletAddress.body)['walletAddress'],
      balanceMap: tokenMap,
    );

    setState(() {
      this.wallet = wallet;
    });
  }

  @override
  Widget build(BuildContext context) {
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
        if (wallet == null) {
          return const Center(child: CircularProgressIndicator());
        }
        return SafeArea(
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              centerTitle: false,
              title: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage('assets/images/iskra_logo.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const Text(
                    ' I  S  K  R  A',
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'Sofia',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              elevation: 0,
            ),
            body: SingleChildScrollView(
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const WalletProfile(),
                  const SizedBox(height: 18),
                  const WalletAction(),
                  const SizedBox(height: 18),
                  WalletOverview(wallet: wallet!),
                  const SizedBox(height: 18),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

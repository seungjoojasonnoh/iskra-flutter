import 'package:iskra_flutter/models/token.dart';

class Wallet {
  final String walletAddress;
  final Map<int, List<Token>> balanceMap;

  Wallet({
    required this.walletAddress,
    required this.balanceMap,
  });
}

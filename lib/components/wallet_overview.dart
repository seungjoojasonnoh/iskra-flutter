import 'package:flutter/material.dart';
import 'package:iskra_flutter/components/wallet_balance_card.dart';
import 'package:iskra_flutter/models/wallet.dart';

class WalletOverview extends StatelessWidget {
  final Wallet wallet;

  const WalletOverview({super.key, required this.wallet});

  @override
  Widget build(BuildContext context) {
    const walletSubTitleStyle = TextStyle(
      fontFamily: 'Sofia',
      fontWeight: FontWeight.bold,
      fontSize: 18,
    );

    List<Widget> balanceCards = [];

    for (var chainId in wallet.balanceMap.keys) {
      var balance = wallet.balanceMap[chainId];
      balance?.forEach((b) {
        balanceCards.add(WalletBalanceCard(
          chainId: chainId,
          symbol: b.symbol,
          description: b.description,
          image: b.image,
          balance: b.balance,
        ));
      });
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Token',
          style: TextStyle(
            fontFamily: 'Sofia',
            fontWeight: FontWeight.bold,
            fontSize: 26,
          ),
        ),
        const SizedBox(height: 16),
        const Text(
          'My Address',
          style: walletSubTitleStyle,
        ),
        Text(
          wallet.walletAddress,
          style: const TextStyle(
            fontFamily: 'Sofia',
            fontWeight: FontWeight.w100,
            fontSize: 13,
          ),
        ),
        const SizedBox(height: 16),
        const Text(
          'Tokens',
          style: walletSubTitleStyle,
        ),
        const Row(
          children: [
            Text(
              'Total Balance',
              style: TextStyle(
                fontFamily: 'Sofia',
                fontSize: 14,
              ),
            ),
            SizedBox(width: 10),
            Text(
              '\$12123',
              style: TextStyle(
                fontFamily: 'Sofia',
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Color(0xFF00CCFF),
              ),
            )
          ],
        ),
        ...balanceCards
      ],
    );
  }
}

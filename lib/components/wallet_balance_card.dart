import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iskra_flutter/components/wallet_action.dart';
import 'package:iskra_flutter/models/chain.dart';

class WalletBalanceCard extends StatelessWidget {
  final int chainId;
  final double balance;
  final String symbol;
  final String description;
  final String image;

  const WalletBalanceCard({
    super.key,
    required this.chainId,
    required this.balance,
    required this.symbol,
    required this.description,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    const boldStyle = TextStyle(
      fontFamily: 'Sofia',
      fontWeight: FontWeight.w500,
      fontSize: 20,
    );

    return Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        padding: const EdgeInsets.all(12),
        decoration: const BoxDecoration(
          color: Color(0xFF232441),
          borderRadius: BorderRadius.all(
            Radius.circular(5),
          ),
        ),
        child: Column(
          children: [
            Row(
              children: [
                SvgPicture.network(
                  image,
                  width: 32,
                  height: 32,
                ),
                const SizedBox(width: 5),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          symbol,
                          style: boldStyle,
                        ),
                        const SizedBox(width: 5),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 3,
                            vertical: 1,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(3),
                            ),
                            color: Color(
                              chainIdColorMap[chainId] as int,
                            ),
                          ),
                          child: Text(
                            chainIdNameMap[chainId],
                            style: const TextStyle(
                              fontSize: 12,
                              fontFamily: 'Sofia',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )
                      ],
                    ),
                    Text(
                      description,
                      style: TextStyle(
                        height: 1,
                        fontFamily: 'Sofia',
                        fontSize: 12,
                        fontWeight: FontWeight.w100,
                        color: Colors.white.withOpacity(0.7),
                      ),
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  balance.toString(),
                  style: boldStyle,
                ),
                const SizedBox(width: 5),
                Text(
                  symbol,
                  style: boldStyle,
                ),
              ],
            ),
            const SizedBox(height: 5),
            const Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                WalletActionButton(
                  item: WalletActionItem.send,
                  iconSize: 12,
                  textSize: 12,
                ),
                SizedBox(width: 5),
                WalletActionButton(
                  item: WalletActionItem.swap,
                  iconSize: 12,
                  textSize: 12,
                ),
                SizedBox(width: 5),
                WalletActionButton(
                  item: WalletActionItem.bridge,
                  iconSize: 12,
                  textSize: 12,
                )
              ],
            )
          ],
        ));
  }
}

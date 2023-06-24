import 'package:flutter/material.dart';

class WalletOverview extends StatelessWidget {
  const WalletOverview({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Token',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(
          height: 16,
        ),
        const Text('My Address'),
        const Text('0x832cC7975ff4418bbEFBC529878e131ADf99d9Db'),
        const SizedBox(
          height: 16,
        ),
        const Text('Tokens'),
        const Row(
          children: [Text('Total Balance'), Text('\$12123')],
        )
      ],
    );
  }
}

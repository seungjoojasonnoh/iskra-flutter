import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

enum WalletActionItem {
  send,
  receive,
  swap,
  bridge,
  ;

  static Text getActionText(WalletActionItem item) {
    const TextStyle commonTextStyle = TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.bold,
    );
    switch (item) {
      case WalletActionItem.bridge:
        return const Text(
          'BRIDGE',
          style: commonTextStyle,
        );
      case WalletActionItem.send:
        return const Text(
          'SEND',
          style: commonTextStyle,
        );
      case WalletActionItem.swap:
        return const Text(
          'SWAP',
          style: commonTextStyle,
        );
      case WalletActionItem.receive:
        return const Text(
          'RECEIVE',
          style: commonTextStyle,
        );
    }
  }

  static SvgPicture getActionIcon(WalletActionItem item) {
    switch (item) {
      case WalletActionItem.bridge:
        return SvgPicture.asset(
          'assets/icons/wallet_bridge.svg',
          width: 18,
          height: 18,
        );
      case WalletActionItem.send:
        return SvgPicture.asset(
          'assets/icons/wallet_send.svg',
          width: 18,
          height: 18,
        );
      case WalletActionItem.swap:
        return SvgPicture.asset(
          'assets/icons/wallet_swap.svg',
          width: 18,
          height: 18,
        );
      case WalletActionItem.receive:
        return SvgPicture.asset(
          'assets/icons/wallet_receive.svg',
          width: 18,
          height: 18,
        );
    }
  }
}

class WalletAction extends StatelessWidget {
  const WalletAction({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        WalletActionButton(item: WalletActionItem.receive),
        WalletActionButton(item: WalletActionItem.send),
        WalletActionButton(item: WalletActionItem.swap),
        WalletActionButton(item: WalletActionItem.bridge),
      ],
    );
  }
}

class WalletActionButton extends StatelessWidget {
  final WalletActionItem item;

  const WalletActionButton({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        WalletActionItem.getActionIcon(item),
        const SizedBox(
          width: 3,
        ),
        WalletActionItem.getActionText(item)
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

enum WalletActionItem {
  send,
  receive,
  swap,
  bridge,
  ;

  static Text getActionText(WalletActionItem item, double textSize) {
    TextStyle commonTextStyle = TextStyle(
      fontSize: textSize,
      fontWeight: FontWeight.bold,
      fontFamily: 'Sofia',
    );
    switch (item) {
      case WalletActionItem.bridge:
        return Text(
          'BRIDGE',
          style: commonTextStyle,
        );
      case WalletActionItem.send:
        return Text(
          'SEND',
          style: commonTextStyle,
        );
      case WalletActionItem.swap:
        return Text(
          'SWAP',
          style: commonTextStyle,
        );
      case WalletActionItem.receive:
        return Text(
          'RECEIVE',
          style: commonTextStyle,
        );
    }
  }

  static SvgPicture getActionIcon(WalletActionItem item, double size) {
    switch (item) {
      case WalletActionItem.bridge:
        return SvgPicture.asset(
          'assets/icons/wallet_bridge.svg',
          width: size,
          height: size,
        );
      case WalletActionItem.send:
        return SvgPicture.asset(
          'assets/icons/wallet_send.svg',
          width: size,
          height: size,
        );
      case WalletActionItem.swap:
        return SvgPicture.asset(
          'assets/icons/wallet_swap.svg',
          width: size,
          height: size,
        );
      case WalletActionItem.receive:
        return SvgPicture.asset(
          'assets/icons/wallet_receive.svg',
          width: size,
          height: size,
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
        WalletActionButton(
          item: WalletActionItem.receive,
          iconSize: 18,
          textSize: 14,
        ),
        WalletActionButton(
          item: WalletActionItem.send,
          iconSize: 18,
          textSize: 14,
        ),
        WalletActionButton(
          item: WalletActionItem.swap,
          iconSize: 18,
          textSize: 14,
        ),
        WalletActionButton(
          item: WalletActionItem.bridge,
          iconSize: 18,
          textSize: 14,
        ),
      ],
    );
  }
}

class WalletActionButton extends StatelessWidget {
  final WalletActionItem item;
  final double textSize;
  final double iconSize;

  const WalletActionButton({
    super.key,
    required this.item,
    required this.textSize,
    required this.iconSize,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        WalletActionItem.getActionIcon(item, iconSize),
        const SizedBox(width: 3),
        WalletActionItem.getActionText(item, textSize)
      ],
    );
  }
}

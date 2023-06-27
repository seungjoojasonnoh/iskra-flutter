import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WalletProfile extends StatelessWidget {
  const WalletProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          width: 68,
          height: 68,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: AssetImage('assets/images/default_profile.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(
          width: 16,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'jasonnoh',
              style: TextStyle(
                fontFamily: 'Sofia',
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            Row(
              children: [
                SvgPicture.asset(
                  'assets/icons/wallet.svg',
                  width: 16,
                  height: 16,
                ),
                const SizedBox(width: 8),
                const Text(
                  '0x832c....C7975ff4',
                  style: TextStyle(
                    fontFamily: 'Sofia',
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ],
        )
      ],
    );
  }
}

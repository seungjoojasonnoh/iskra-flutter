import 'package:flutter/material.dart';
import 'package:iskra_flutter/services/request.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:iskra_flutter/utils/encryption.dart';

class WalletSendModal extends StatefulWidget {
  final int chainId;
  final String symbol;

  const WalletSendModal({
    super.key,
    required this.chainId,
    required this.symbol,
  });

  @override
  State<WalletSendModal> createState() => _WalletSendModalState();
}

class _WalletSendModalState extends State<WalletSendModal> {
  late TextEditingController _walletAddressController;
  late TextEditingController _amountController;

  @override
  void initState() {
    _walletAddressController = TextEditingController();
    _amountController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _walletAddressController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  void getTxParams({
    required int chainId,
    required String symbol,
  }) async {
    var cookie = await Request.getCookie();
    var headers = Request.headers;
    headers['Cookie'] = cookie;
    final uri = Uri.https(
        "alpha-api.iskra.world",
        '/core/v2/wallet/chains/$chainId/send/${widget.symbol}/transaction/params',
        {
          "to": _walletAddressController.text,
          "value": _amountController.text,
          symbol: symbol,
        });
    var txParams = await http.get(uri, headers: Request.headers);
    var decodedTxParams = jsonDecode(txParams.body);

    getTxSigningInfo(
      chainId: chainId,
      data: decodedTxParams["input"],
      to: decodedTxParams["contractAddress"],
      value: '0',
      cookie: cookie,
    );
  }

  void getTxSigningInfo({
    required int chainId,
    required String to,
    required String value,
    required String data,
    required String cookie,
  }) async {
    var headers = Request.headers;
    headers['Cookie'] = cookie;
    final uri = Uri.https(
      "alpha-api.iskra.world",
      '/core/v2/wallet/chains/$chainId/transactions/signing-info',
    );
    var signingInfo = await http.post(uri,
        body: jsonEncode({
          "chainId": chainId,
          "to": to,
          "data": data,
        }),
        headers: headers);
    var decodedSigningInfo = jsonDecode(signingInfo.body);

    print(jsonDecode(signingInfo.body));

    Encryption.decryptPk(
      encryptedPk: decodedSigningInfo["encryptedPrivateKey"],
      walletPw: "Iskra07!",
    );
  }

  @override
  Widget build(BuildContext context) {
    const commonTextStyle = TextStyle(
      fontFamily: 'Sofia',
      fontSize: 15,
      fontWeight: FontWeight.w600,
    );

    const commonInputDecoration = InputDecoration(
      filled: true,
      fillColor: Color(0xFF2E2F48),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          borderSide: BorderSide(color: Color(0xff00ccff))),
      hintStyle: TextStyle(
        color: Color(0xFF7D7E87),
        fontFamily: 'Sofia',
        fontSize: 12,
      ),
      isDense: true,
      contentPadding: EdgeInsets.all(12),
    );

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: BorderRadius.circular(25),
      ),
      height: MediaQuery.of(context).size.height * 0.4,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Text(
            'Enter the wallet address to send',
            style: commonTextStyle,
          ),
          const SizedBox(height: 5),
          TextField(
            controller: _walletAddressController,
            maxLines: 1,
            decoration: commonInputDecoration.copyWith(
              hintText: "Enter wallet address",
            ),
            style: const TextStyle(fontSize: 12),
          ),
          const SizedBox(height: 16),
          const Text(
            'Amount',
            style: commonTextStyle,
          ),
          const SizedBox(height: 5),
          TextField(
            controller: _amountController,
            maxLines: 1,
            decoration: commonInputDecoration.copyWith(
              hintText: "Amount",
              suffixIcon: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        border: Border(
                      left: BorderSide(
                          color: const Color(0xFF7D7E87).withOpacity(0.5),
                          width: 2),
                    )),
                    padding: const EdgeInsets.fromLTRB(5, 0, 10, 0),
                    child: Text(
                      widget.symbol,
                      style: const TextStyle(
                        color: Colors.white,
                        fontFamily: 'Sofia',
                        fontSize: 13,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            style: const TextStyle(fontSize: 12),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                  backgroundColor: const Color(0xFF0043CB),
                ),
                child: const Text(
                  'Send',
                  style: TextStyle(
                    fontFamily: 'Sofia',
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onPressed: () {
                  getTxParams(chainId: widget.chainId, symbol: widget.symbol);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

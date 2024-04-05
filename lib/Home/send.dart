import 'package:flutter/material.dart';
import 'package:web3dart/web3dart.dart';
import 'package:http/http.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class Send extends StatelessWidget {
  String rpcUrl = "http://172.16.17.180:7545";
  String wcUrl = "http://172.16.17.180:7545/";

  String strCenter = "Data";

  void sendToken() async {
    // Create a Web3Client instance
    Web3Client client = Web3Client(rpcUrl, Client(), socketConnector: () {
      return IOWebSocketChannel.connect(wcUrl).cast<String>();
    });

    // Sender's private key (from Ganache or elsewhere)
    String privateKey = "0xf9f9264b9a2d9cff749e3c2ac2d7994d6a612e97d37d9f789a38bf508bc3f7e8";

    // Create Credentials from private key
    Credentials credentials = EthPrivateKey.fromHex(privateKey);

    // Get sender's Ethereum address directly from credentials
    EthereumAddress ownAddress = credentials.address;

    // Recipient's Ethereum address
    EthereumAddress receiverAddress = EthereumAddress.fromHex("0x37421ABa95edeCabe7DFf8AB39F45b75333C5A59");

    // Get the current balance before sending
    EtherAmount initialBalance = await client.getBalance(ownAddress);
    print('Initial Balance: ${initialBalance.getInEther} Ether');

    // Create and send a transaction
    Transaction transaction = Transaction(
      from: EthereumAddress.fromHex("0x42c4205e15D50f156F44787b7035d67E1C9A18b9"),
      to: receiverAddress,
      value: EtherAmount.fromUnitAndValue(EtherUnit.ether, 5), // 5 Ether in Wei
    );

    try {
      await client.sendTransaction(credentials, transaction);

      // Get the updated balance after sending
      EtherAmount updatedBalance = await client.getBalance(ownAddress);
      print('Updated Balance: ${updatedBalance.getInEther} Ether');
    } catch (e) {
      print('Error sending transaction: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('송금'), // "Send" in English
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(strCenter),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: sendToken,
        tooltip: 'Send',
        child: Icon(Icons.add),
      ),
    );
  }
}

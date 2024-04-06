import 'package:flutter/material.dart';
import 'package:web3dart/web3dart.dart';
import 'package:http/http.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class Send extends StatefulWidget {
  @override
  _SendState createState() => _SendState();
}

class _SendState extends State<Send> {
  // The constants below are the addresses from Ganache.
  // When using the application, these should be stored as constants
  // or retrieved from a database.

  // RPC URL for connecting to the Ethereum node (Ganache)
  String rpcUrl = "http://172.16.17.180:7545";

  // WebSocket URL for connecting to the Ethereum node (Ganache)
  String wcUrl = "http://172.16.17.180:7545/";

  // Center text to display a message
  String strCenter = "Loading...";

  // Web3Client instance for interacting with Ethereum
  late Web3Client client;

  // Private key of the sender (copied from Ganache)
  String privateKey = "0xf9f9264b9a2d9cff749e3c2ac2d7994d6a612e97d37d9f789a38bf508bc3f7e8";

  // Ethereum address of the sender
  late EthereumAddress ownAddress;

  // Ethereum address of the recipient
  EthereumAddress receiverAddress = EthereumAddress.fromHex("0x8363F1f53eF3951DCBd24d86eA98606D9c5F2a86");

  // Credentials object for the sender
  late Credentials credentials;

  @override
  void initState() {
    super.initState();
    // Initialize the Web3Client instance
    client = Web3Client(rpcUrl, Client(), socketConnector: () {
      return IOWebSocketChannel.connect(wcUrl).cast<String>();
    });
    // Call the function to fetch the balance and update the UI
    updateBalance();
  }

  // Function to fetch the balance of the sender
  void updateBalance() async {
    // Create Credentials object from the private key
    credentials = EthPrivateKey.fromHex(privateKey);

    // Get the Ethereum address (sender's address) from the credentials
    ownAddress = await credentials.extractAddress();

    // Get the balance of the sender
    EtherAmount balance = await client.getBalance(ownAddress);

    // Update the UI with the balance information
    setState(() {
      strCenter = "Sender Balance: ${balance.getInEther} Ether";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Send'), // AppBar title
      ),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:[
              Text(strCenter), // Text widget to display the balance
            ]
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // When FloatingActionButton is pressed, call sendToken function
          sendToken();
        },
        tooltip: 'Send', // Tooltip text
        child: Icon(Icons.add), // Icon for the button
      ),
    );
  }

  // Function to send Ethereum tokens
  void sendToken() async {
    try {
      // Fetch the nonce for the sender's address and increment it
      int nonce = await client.getTransactionCount(ownAddress);

      // Get the current gas price from the network as an EtherAmount
      EtherAmount gasPrice = await client.getGasPrice();

      // Create a transaction to send 5 Ether from sender to recipient
      Transaction transaction = Transaction(
        from: ownAddress,
        to: receiverAddress,
        value: EtherAmount.fromUnitAndValue(EtherUnit.ether, 5),
        nonce: nonce, // Nonce value
        gasPrice: gasPrice, // Gas price for the transaction
        maxGas: 300000, // Max gas limit
      );

      // Sign the transaction with the sender's private key
      final signedTransaction = transaction.copyWith(
        from: ownAddress,
        gasPrice: gasPrice,
      );

      // Send the signed transaction
      final txHash = await client.sendTransaction(credentials, signedTransaction);

      // Print transaction hash
      print('Transaction sent. Hash: $txHash');
    } catch (e) {
      print('Error sending transaction: $e');
    }

    // Print the sender's address
    print('ownAddress: $ownAddress');
  }



  @override
  void dispose() {
    // Clean up resources
    client.dispose();
    super.dispose();
  }
}

import 'package:flutter/material.dart';
import 'package:web3dart/web3dart.dart';
import 'package:http/http.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Web3Client _client;
  late EthereumAddress _walletAddress;
  String _balance = 'Loading...';



  @override
  void initState() {
    super.initState();
    // Replace 'http://127.0.0.1:7545' with your Ganache workspace URL
    _client = Web3Client('http://127.0.0.1:7545', Client(), socketConnector: (){
      return IOWebSocketChannel.connect('http://127.0.0.1:7545/').cast<String>();
    });
    // Replace 1337 with your network ID
    // Replace '0x1234567890abcdef1234567890abcdef12345678' with your wallet address
    _walletAddress = EthereumAddress.fromHex('0x42c4205e15D50f156F44787b7035d67E1C9A18b9');
    _updateBalance();
  }

  Future<void> _updateBalance() async {
    EthereumAddress address = _walletAddress;
    EtherAmount balance = await _client.getBalance(address);
    setState(() {
      _balance = balance.getValueInUnit(EtherUnit.ether).toString() + ' ETH';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                height: 200,
                width: 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.black,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text("Your Balance:", style: TextStyle(color: Colors.white, fontSize: 20)),
                    Center(child: Text(_balance, style: TextStyle(color: Colors.white, fontSize: 40))),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      height: 100,
                      width: 150,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: Colors.black),
                      child: Center(child: Text("Send", style: TextStyle(fontSize: 30, color: Colors.white))),
                    ),
                    Container(
                      height: 100,
                      width: 150,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: Colors.black),
                      child: Center(child: Text("Add Money", style: TextStyle(fontSize: 30, color: Colors.white))),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15),
              Text("Transactions", textAlign: TextAlign.left, style: TextStyle(fontSize: 30)),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _client.dispose();
    super.dispose();
  }
}

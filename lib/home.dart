import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        title: const Text('Lottie Animations'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Lottie.asset('assets/delivery.json'),
          //Lottie.network('https://assets9.lottiefiles.com/packages/lf20_jmejybvu.json'),
          const SizedBox(height: 32),
          ElevatedButton.icon(
            onPressed: () {},
            icon: const Icon(
              Icons.delivery_dining,
              size: 40,
            ),
            label:const Text('Order Pizza'),
            style: ElevatedButton.styleFrom(
              padding:const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              textStyle:const TextStyle(fontSize: 28),
            ),
          )
        ],
      ));



}

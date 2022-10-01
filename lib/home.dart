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
    body: Center(
      child: Lottie.network('https://assets9.lottiefiles.com/packages/lf20_jmejybvu.json'),
    )
  );
}

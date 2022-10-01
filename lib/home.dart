import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      //animasyonun ne kadar süreyle oynatılacağı
      duration: const Duration(seconds: 3), vsync: this,
    );

    //animasyonu kontrol edebilmek için
    controller.addStatusListener((status) async {
      if (status == AnimationStatus.completed) {
        //animasyon tamamlanınca dialog kapansın ve animasyon sıfırlansın
        Navigator.pop(context);
        controller.reset();
      }
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        title: const Text('Lottie Animations'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Lottie.asset(
            'assets/delivery.json',
          ),
          //Lottie.network('https://assets9.lottiefiles.com/packages/lf20_jmejybvu.json'),
          const SizedBox(height: 32),
          ElevatedButton.icon(
            onPressed: showDoneDialog,
            icon: const Icon(
              Icons.delivery_dining,
              size: 40,
            ),
            label: const Text('Order Pizza'),
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              textStyle: const TextStyle(fontSize: 28),
            ),
          )
        ],
      ));

  void showDoneDialog() => showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => Dialog(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Lottie.asset('assets/done.json',
                    repeat: false,
                    //animasyon tamamlandıktan sonra tekrar gizleyebilmek için controller ekledim
                    controller: controller,
                    //animasyonu yükler
                    onLoaded: (composition) {
                  //forward ile animasyon başlatılır
                  controller.forward();
                }),
                const Text(
                  'Enjoy your order',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 16,
                ),
              ],
            ),
          ));
}

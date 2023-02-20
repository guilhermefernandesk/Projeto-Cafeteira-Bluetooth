import 'package:expressotec/utils/app_routes.dart';
import 'package:flutter/material.dart';

class bluetooth extends StatelessWidget {
  const bluetooth({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.black,
          title: const Text(
            'EXPRESSOTEC',
            style: TextStyle(
              color: Colors.white,
              fontSize: 28,
            ),
          ),
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back),
            iconSize: 28,
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 90,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Minha Máquina >',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                    ),
                  ),
                  Image.asset(
                    'assets/images/ez.jpg',
                  ),
                ],
              ),
            ),
            Image.asset('assets/images/bt.png'),
            Expanded(child: Center()),
            Padding(
              padding: const EdgeInsets.only(
                bottom: 10,
              ),
              child: SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green[700]),
                  onPressed: () => Navigator.of(context).pushNamed(AppRoutes.mymachine),
                  child: Text(
                    'CONECTAR COM ESTA MÁQUINA',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

import 'package:expressotec/pages/MyMachine.dart';
import 'package:flutter/material.dart';

import '../models/class_cap.dart';





class Capsulas extends StatefulWidget {
  const Capsulas({
    super.key,
  });

  @override
  State<Capsulas> createState() => _CapsulasState();
}

class _CapsulasState extends State<Capsulas> {
  static var Cap = NumeroCapsulas(0);

  _atualizaCap() {
    final obter = Cap.getCap();
    print(obter);
    Navigator.pop(context);
    
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor:Color(0xFF1F1F1F),
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Color(0xFF1F1F1F),
          title: const Text(
            'Cápsulas',
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
              child: Image.asset(
                'assets/images/olhei.png',
              ),
            ),
            SizedBox(height: 50),
            Container(
              padding: EdgeInsets.all(8),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          Cap.subCap();
                        });
                      },
                      child: Icon(
                        Icons.remove,
                        color: Colors.white,
                        size: 40,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Column(
                      children: [
                        Text(
                          '${Cap.getCap()}',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                          ),
                        ),
                        Text(
                          'Número de cápsulas',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          Cap.somaCap();
                        });
                      },
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 40,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 50),
            SizedBox(
              width: 100,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green[700]),
                onPressed: () => _atualizaCap(),
                child: Text(
                  'OK',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
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

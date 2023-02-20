import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

enum selecao { espresso, lungo, padrao }

class PrepNow extends StatefulWidget {
  const PrepNow({
    super.key,
  });

  @override
  State<PrepNow> createState() => _PrepNowState();
}

class _PrepNowState extends State<PrepNow> {
  selecao _selecao = selecao.padrao;

  bool _isEspresso() => _selecao == selecao.espresso;
  bool _isLungo() => _selecao == selecao.lungo;

  late String _timeString;

  @override
  void initState() {
    _timeString = DateFormat.Hms().format(DateTime.now());
    Timer.periodic(const Duration(seconds: 1), (Timer t) => _getTimeString());
    super.initState();
  }

  void _getTimeString() {
    setState(() {
      _timeString = DateFormat.Hms().format(DateTime.now());
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.black,
          title: const Text(
            'Preparar Agora',
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
              padding: EdgeInsets.all(10),
                child: CircleAvatar(
              radius: 100,
              backgroundColor: Colors.grey[800],
              child: Text(
                _timeString,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 40,
                ),
              ),
            )),
            SizedBox(height: 50),
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        _selecao = selecao.espresso;
                      });
                    },
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 30,
                          backgroundColor: Colors.grey[800],
                          child: Icon(
                            Icons.coffee,
                            size: 40,
                            color: Colors.white,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 5,
                            bottom: 5,
                          ),
                          child: Text('ESPRESSO',
                              style: _isEspresso()
                                  ? TextStyle(color: Colors.green)
                                  : TextStyle(color: Colors.white)),
                        ),
                        Text('40 ML',
                            style: _isEspresso()
                                ? TextStyle(color: Colors.green)
                                : TextStyle(color: Colors.white)),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        _selecao = selecao.lungo;
                      });
                    },
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 30,
                          backgroundColor: Colors.grey[800],
                          child: Icon(
                            Icons.coffee_outlined,
                            size: 40,
                            color: Colors.white,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 5,
                            bottom: 5,
                          ),
                          child: Text('LUNGO',
                              style: _isLungo()
                                  ? TextStyle(color: Colors.green)
                                  : TextStyle(color: Colors.white)),
                        ),
                        Text('110 ML',
                            style: _isLungo()
                                ? TextStyle(color: Colors.green)
                                : TextStyle(color: Colors.white)),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Expanded(child: Center()),
            Padding(
              padding: const EdgeInsets.all(30),
              child: SizedBox(
                width: 180,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue[900]),
                  onPressed: () {}, //atibuir funcionalidade
                  child: Text(
                    'PREPARAR AGORA',
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

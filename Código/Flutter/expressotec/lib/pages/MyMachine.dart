import 'package:expressotec/utils/app_routes.dart';
import 'package:flutter/material.dart';

import '../models/class_cap.dart';

class MyMachine extends StatelessWidget {
  MyMachine({super.key});





  showAlertDialog1(BuildContext context) {
    Widget okButton = TextButton(
      onPressed: () {
        Navigator.of(context).pop();
      },
      child: Text(
        'OK',
        style: TextStyle(color: Colors.black, fontSize: 15),
      ),
    );

    AlertDialog alert = AlertDialog(
      backgroundColor: Colors.grey[800],
      title: Text(
        'Dicas de utilização',
        style: TextStyle(
          color: Colors.white,
        ),
      ),
      content: Text(
        'Sempre verifique se há água em seu reservatório. Deixe sempre uma cápsula dentro da máquina',
        style: TextStyle(
          color: Colors.white,
        ),
      ),
      actions: [
        okButton,
      ],
    );

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return alert;
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
            'Minha Máquina',
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
          actions: [
            IconButton(
              onPressed: () => showAlertDialog1(context),
              icon: Icon(Icons.info),
              iconSize: 30,
            ),
          ],
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              child: Image.asset(
                'assets/images/ez.jpg',
              ),
            ),
            SizedBox(height: 50),
            Container(
              color: Colors.grey[800],
              padding: EdgeInsets.all(8),
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: ()=> Navigator.of(context).pushNamed(AppRoutes.prepNow),
                      child: Column(
                        children: [
                          Icon(
                            Icons.coffee,
                            color: Colors.white,
                            size: 40,
                          ),
                          SizedBox(height: 10),
                          Text(
                            'PREPARAR AGORA',
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () =>
                          Navigator.of(context).pushNamed(AppRoutes.authOrHome),
                      child: Column(
                        children: [
                          Icon(
                            Icons.access_time,
                            color: Colors.white,
                            size: 40,
                          ),
                          SizedBox(height: 10),
                          Text(
                            'AGENDAR HORÁRIO',
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Column(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.grey[800],
                  child: IconButton(
                    iconSize: 40,
                    onPressed: () =>
                        Navigator.of(context).pushNamed(AppRoutes.capsulas),
                    icon: Icon(
                      Icons.coffee_maker_outlined,
                      
                      color: Colors.white,
                    ),
                  ),
                ),
              
                SizedBox(height: 5),
                Text(
                  'CÁPSULAS',
                  style: TextStyle(color: Colors.white),
                ),
                Text(
                  '0',
                  style: TextStyle(color: Colors.white),
                ),
              ],
            )
          ],
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

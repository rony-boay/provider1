import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(Providerr());
}

class Providerr extends StatelessWidget {
  Providerr({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Deta>(
      create: (context) => Deta(),
      builder: (context, child) => MaterialApp(
        home: Scaffold(
          backgroundColor: Colors.deepPurple[200],
          appBar: AppBar(
            backgroundColor: Colors.deepPurple[400],
            title: Center(
              child: Mytext(),
            ),
          ),
          body: level3(),
        ),
      ),
    );
  }
}

class level3 extends StatelessWidget {
  level3({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MyTextfield(),
        Text(Provider.of<Deta>(context).data),
      ],
    );
  }
}

class Mytext extends StatelessWidget {
  Mytext({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(Provider.of<Deta>(context, listen: false).data);
  }
}

class MyTextfield extends StatelessWidget {
  MyTextfield({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(labelText: 'write something'),
      onChanged: (value) {
        Provider.of<Deta>(context, listen: false).chnagestring(value);
      },
    );
  }
}

class Deta extends ChangeNotifier {
  String data = 'Appbar';
  void chnagestring(String newstring) {
    data = newstring;
    notifyListeners();
  }
}

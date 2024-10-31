import 'package:flutter/material.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';
import 'create_estagio.dart';
import 'read_estagio.dart';
import 'update_estagio.dart';
import 'delete_estagio.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  const keyApplicationId = 'wXvaimND1qkHcm7YLZ77mS7wSQtsjdcTZRKqwoI2';
  const keyClientKey = '4s5hB1xxR1KYTQemOaa94tqWfq9XTB0zIsVtj02j';
  const keyParseServerUrl = 'https://parseapi.back4app.com';
  
  await Parse().initialize(keyApplicationId, keyParseServerUrl,
    clientKey: keyClientKey, debug: true);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Parse CRUD Demo',
      home: Scaffold(
        appBar: AppBar(
          title: Text('CRUD Operations'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () async {
                  await createEstagio('Julia Rodrigues', '12345678900', 'IFPR - CAMPUS PALMAS');
                },
                child: Text('Create Estagio'),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () async {
                  await readEstagio('dmsagHTACs');
                },
                child: Text('Read Estagio'),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () async {
                  await updateEstagio('dmsagHTACs', 'Matheus Henrique');
                },
                child: Text('Update Estagio'),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () async {
                  await deleteEstagio('dmsagHTACs');
                },
                child: Text('Delete Estagio'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

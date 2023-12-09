import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyForm(),
    );
  }
}

class MyForm extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _MyFormState createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  final TextEditingController _plateFieldController = TextEditingController();
  final db = FirebaseFirestore.instance;
  
  // ignore: unused_element
  Future<void> _printValues() async {
    await db.collection("registros").get().then((event) {
      for (var doc in event.docs) {
        print("${doc.id} => ${doc.data()}");
      }
    });
  }

  void _emitAlert() {
    showDialog(
      context: context, 
      builder: (context) {
        return AlertDialog(
          title: Text("Patente ${_plateFieldController.text} registrada con exito"),
          actions: [
            MaterialButton(
              onPressed: () {
                Navigator.push(
                  context, 
                  MaterialPageRoute(builder: (context) => const SecondRoute()),
                );
              },
              child: Text('Ver autos activos'),
            )
          ],
        );
    });
  }

  Future<void> _registerValues(plate) async {
    final now = DateTime.now().toLocal();
    // Create a new user with a first and last name
    final event = <String, dynamic>{
      "plate": plate,
      "enteredAt": now,
      "exitedAt": null,
    };
    // Add a new document with a generated ID
    await db.collection("registros").add(event).then((DocumentReference doc) => {
      // Alert successful
      _emitAlert()
    });
  }

  String currentTime = '';

  void _calculateFare(departure) {
    final now = DateTime.now().toLocal();
    final difference =  departure.difference(now);
    print(difference.inMinutes);    
  }

  void _registerCarEntry() {
    String plate = _plateFieldController.text;
    DateTime now = DateTime.now().toLocal();
    setState(() {
      currentTime = '${now.hour}:${now.minute}:${now.second}';
    });
    // check if plate is already inside the parking
    // if(plateInBuilding){
    //    throw new Error("Patente ya registrada")
    // }
    // Save register in firestore
    _registerValues(plate);
    // Levantar alerta de que se ha guardado satisfactoriamente/si hubo algun problema
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Estacionamientos Maule'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: _plateFieldController,
              decoration: InputDecoration(
                labelText: 'Ingresa Patente',
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _registerCarEntry,
              child: Text('Registrar'),
            ),
          ],
        ),
      ),
    );
  }
}

// This route will represent the table where the active cars can be seen
class SecondRoute extends StatelessWidget {
  const SecondRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Route'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Go back!'),
        ),
      ),
    );
  }
}
//! Form

import 'package:flutter/material.dart';

void main() {
  runApp(const PlateRegistration());
}

final _formKey = GlobalKey<FormState>();

class PlateRegistration extends StatelessWidget {
  const PlateRegistration({Key? key}) : super(key : key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          TextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Ingrese patente';
              }
              return null;
            },
          ),
          ElevatedButton(onPressed: () {
            if (_formKey.currentState!.validate()) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Great!'),
                ),
              );
            }
          }, 
          child: const Text('Validate'),
          )
        ],
      ),);
  }
}
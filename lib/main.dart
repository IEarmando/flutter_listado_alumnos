import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Listado de alumnos'),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.green,
          child: const Icon(Icons.people_alt_outlined),
          onPressed: () {},
        ),
        
        body: ListView.builder(
          itemCount: _personas.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Text('${_personas[index].name} ${_personas[index].lastname}'),
              subtitle: Text(_personas[index].cuenta),
              leading: CircleAvatar(
                child: Text(_personas[index].name.substring(0, 1)),
              ),
              trailing: const Icon(Icons.arrow_forward_ios), // Icono para editar la persona
            );
          },
        ),
      ),
    );
  }
}
  List<Persona> _personas = [
    Persona(name: 'Juan', lastname: 'Perez', cuenta: '123456789'),
    Persona(name: 'Maria', lastname: 'Garcia', cuenta: '987654321'),
    Persona(name: 'Pedro', lastname: 'Sanzio', cuenta: '321654987'),
    Persona(name: 'Armando', lastname: 'Escalera', cuenta: '20192856')
  ];

class Persona {
  String name;
  String lastname;
  String cuenta;

  Persona({required this.name, required this.lastname, required this.cuenta});
}

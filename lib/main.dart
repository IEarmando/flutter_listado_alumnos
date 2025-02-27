import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Mipagina1(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Persona {
  String name;
  String lastname;
  String cuenta;

  Persona(this.name, this.lastname, this.cuenta);
}

List<Persona> _personas = [
  Persona( 'Juan',  'Perez',  '123456789'),
  Persona( 'Maria',  'Garcia',  '987654321'),
  Persona( 'Pedro',  'Sanzio',  '321654987'),
  Persona( 'Armando',  'Escalera',  '20192856'),
];

final TextEditingController nom = TextEditingController();
final TextEditingController ape = TextEditingController();
final TextEditingController cue = TextEditingController();

class Principal extends StatelessWidget {
  const Principal({super.key});

  @override
  Widget build(BuildContext context) {
    return Mipagina1();
  }
}

class Mipagina1 extends StatefulWidget {
  @override
  State<Mipagina1> createState() => _Mipagina1State();
}

class _Mipagina1State extends State<Mipagina1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LISTADO DE ALUMNOS'),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 64, 255, 160),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Mipagina2()),
          );
        },
        child: const Icon(Icons.people_alt_outlined),
      ),
      body: Column(
        children: [
          Center(
            child: Container(
              padding: const EdgeInsets.all(16.0),
              child: const Text('Facultad de telematica'),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _personas.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text('${_personas[index].name} ${_personas[index].lastname}'),
                  subtitle: Text(_personas[index].cuenta),
                  leading: CircleAvatar(
                    child: Text(_personas[index].name.substring(0, 1)),
                  ),
                  trailing: const Icon(Icons.arrow_forward_ios),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class Mipagina2 extends StatefulWidget {
  @override
  State<Mipagina2> createState() => _Mipagina2State();
}

class _Mipagina2State extends State<Mipagina2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Agregar Nuevo Alumno'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child: TextField(
                controller: nom,
                decoration: InputDecoration(
                  hintText: 'Nombre',
                  filled: true,
                  fillColor: const Color.fromARGB(26, 131, 89, 248),
                ),
              ),
            ),
            const SizedBox(height: 30),
            Container(
              child: TextField(
                controller: ape,
                decoration: InputDecoration(
                  hintText: 'Apellidos',
                  filled: true,
                  fillColor: const Color.fromARGB(26, 131, 89, 248),
                ),
              ),
            ),
            const SizedBox(height: 30),
            Container(
              child: TextField(
                controller: cue,
                decoration: InputDecoration(
                  hintText: 'Número de cuenta',
                  filled: true,
                  fillColor: const Color.fromARGB(26, 131, 89, 248),
                ),
              ),
            ),
            const SizedBox(height: 30),
            Container(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                   // Fondo verde
                ),
                onPressed: () {
                  String tnom = nom.text; // Cambiar ape por nom
                  String tape = ape.text; 
                  String tcue = cue.text;

                  _personas.add(Persona(tnom, tape, tcue));

                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => Mipagina1()),
                  );
                },
                child: const Text(
                  'Guardar',
                  style: TextStyle(fontSize: 25.0, color: Color.fromARGB(255, 22, 117, 241)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
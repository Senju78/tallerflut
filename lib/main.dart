 import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Custom App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
        textTheme: GoogleFonts.poppinsTextTheme(),
      ),
      home: Scaffold(
        body: Row(
          children: [
            // Columna de botones de navegación
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                customButton(Icons.home, 'Dashboard', () {}),
                customButton(Icons.work, 'Workspaces', () {}),
                customButton(Icons.share, 'Shared With Me', () {}),
                const Spacer(),
                customButton(Icons.settings, 'Preferences', () {}),
                customButton(Icons.people_outline, 'Team', () {}),
                customButton(Icons.add_circle, 'New Workspace', () {}),
                customButton(Icons.create_new_folder, 'Create Project', () {}),
              ],
            ),
            // Contenido de la parte derecha
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Creative Hub',
                            style: TextStyle(
                              fontSize: 35,
                            ),
                          ),
                          SizedBox(width: 20),
                          Icon(
                            Icons.arrow_drop_down_rounded,
                            size: 35,
                          ),
                          SizedBox(width: 800),
                          Icon(Icons.link),
                          SizedBox(width: 20),
                          Text('Invite'),
                          SizedBox(width: 20),
                          Icon(Icons.more_vert),
                        ],
                      ),
                      // Alineación de las notas
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          noteCard(),
                          const SizedBox(width: 40),
                          noteCard(),
                          const SizedBox(width: 40),
                          noteCard(),
                          const SizedBox(width: 40),
                          noteCard(),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget para las notas
  Widget noteCard() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(15),
      ),
      padding: const EdgeInsets.all(20),
      height: 300,
      width: 220,
      child: Column(
        children: [
          Row(
            children: [
              Container(
                height: 15,
                width: 15,
                decoration: const BoxDecoration(
                  color: Colors.green,
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 10),
              const Text('Task A'),
            ],
          ),
          const SizedBox(height: 20),
          const Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(20.0),
                child: Text(
                    'This is a placeholder text. The content of this note can be updated later.'),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(Colors.grey[100]),
                    shape: WidgetStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  child: Text(
                    'Modify',
                    style: TextStyle(
                      color: Colors.grey[700],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Función para crear los botones de la barra lateral
  InkWell customButton(IconData icon, String label, Function onPressed) {
    return InkWell(
      onTap: () {
        onPressed();
        print(label);
      },
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Row(
          children: [
            Icon(icon),
            const SizedBox(width: 10),
            Text(label),
          ],
        ),
      ),
    );
  }
}

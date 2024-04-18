import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dashboard',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        appBarTheme: AppBarTheme(
          color: Colors.blue[800], // Color del AppBar
        ),
        textTheme: const TextTheme(
          titleLarge: TextStyle(
            color: Colors.white,
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
          // Otros estilos de texto pueden ir aquí
        ),
      ),
      home:
          const DashboardScreen(userType: 'Alumno'), // Cambiar según el usuario
    );
  }
}

class DashboardScreen extends StatelessWidget {
  final String userType;

  const DashboardScreen({super.key, required this.userType});

  @override
  Widget build(BuildContext context) {
    List<Widget> userOptions = _getUserOptions(userType, context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        centerTitle: true,
      ),
      backgroundColor:
          Colors.blue[800], // Asegúrate de que sea el color correcto
      body: Center(
        child: SingleChildScrollView(
          // Permite desplazamiento si el contenido es muy largo
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: userOptions,
          ),
        ),
      ),
    );
  }

  List<Widget> _getUserOptions(String userType, BuildContext context) {
    // El mapa que contiene las opciones para cada tipo de usuario
    Map<String, List<Widget>> options = {
      'Alumno': [
        _buildOptionButton(context, 'Crear pedido', Icons.add),
        _buildOptionButton(context, 'Ver pedidos actuales', Icons.list),
        _buildOptionButton(context, 'Catálogo de material', Icons.book),
      ],
      'Colaborador': [
        _buildOptionButton(context, 'Ver pedidos', Icons.view_list),
        _buildOptionButton(context, 'Página de inventario', Icons.inventory),
      ],
      'Administrador': [
        _buildOptionButton(context, 'Creación de reportes', Icons.report),
        _buildOptionButton(context, 'Gestión de usuarios', Icons.people),
      ],
    };

    // Intentamos devolver la lista de widgets para el tipo de usuario proporcionado
    // Si el tipo de usuario no existe en el mapa, devolvemos una lista vacía
    return options[userType] ??
        []; // Esto evita que el método termine sin devolver un valor
  }

  Widget _buildOptionButton(BuildContext context, String title, IconData icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          vertical: 10), // Agrega espacio vertical entre botones
      child: ElevatedButton.icon(
        icon: Icon(icon, color: Colors.white),
        label: Text(title, style: const TextStyle(color: Colors.white)),
        onPressed: () {
          // La lógica de cada botón va aquí
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.yellow[700], // Color de fondo del botón
          padding: const EdgeInsets.symmetric(vertical: 20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
      ),
    );
  }
}

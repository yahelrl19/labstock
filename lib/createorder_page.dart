import 'package:flutter/material.dart';

class CreateOrderPage extends StatefulWidget {
  @override
  _CreateOrderPageState createState() => _CreateOrderPageState();
}

class _CreateOrderPageState extends State<CreateOrderPage> {
  final TextEditingController _searchController = TextEditingController();
  List<String> _products = []; // Lista para almacenar los productos encontrados
  List<String> _orderList =
      []; // Lista para almacenar los productos agregados al pedido

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Crear Pedido'),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                labelText: 'Buscar Material',
                suffixIcon: IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () => _searchMaterial(_searchController.text),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _products.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_products[index]),
                  trailing: IconButton(
                    icon: Icon(Icons.add),
                    onPressed: () {
                      setState(() {
                        _orderList.add(_products[index]);
                      });
                    },
                  ),
                );
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _orderList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_orderList[index]),
                  trailing: IconButton(
                    icon: Icon(Icons.remove),
                    onPressed: () {
                      setState(() {
                        _orderList.removeAt(index);
                      });
                    },
                  ),
                );
              },
            ),
          ),
          ElevatedButton(
            onPressed: () {
              // Aquí iría la lógica para guardar el pedido en la base de datos
              print('Guardar pedido en la base de datos');
            },
            child: Text('Guardar Pedido'),
          ),
        ],
      ),
    );
  }

  void _searchMaterial(String query) {
    // Aquí implementarías la búsqueda real en tu base de datos
    setState(() {
      _products = [
        'Producto 1', // Estos son datos de ejemplo
        'Producto 2',
        'Producto 3',
      ].where((p) => p.toLowerCase().contains(query.toLowerCase())).toList();
    });
  }
}

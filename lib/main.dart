// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('List Barang')),
        body: ContainerRow(),
      ),
    );
  }
}

class Product {
  final String name;
  final String amount;

  Product(this.name, this.amount);
}

class ContainerRow extends StatefulWidget {
  @override
  _ContainerRowState createState() => _ContainerRowState();
}

class _ContainerRowState extends State<ContainerRow> {
  List<Product> products = [];

  TextEditingController nameController = TextEditingController();
  TextEditingController amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.only(
        left: 16,
        right: 16,
      ),
      children: [
        TextFormField(
          decoration: InputDecoration(labelText: 'Kode Faktur'),
        ),
        TextFormField(
          decoration: InputDecoration(labelText: 'Tanggal'),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                flex: 4,
                child: Container(
                  height: 50,
                  child: TextFormField(
                    controller: nameController,
                    decoration: const InputDecoration(
                      labelText: 'Nama Produk',
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              Expanded(
                flex: 1,
                child: Container(
                  height: 50,
                  child: TextFormField(
                    controller: amountController,
                    decoration: const InputDecoration(
                      labelText: 'Jumlah',
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        ElevatedButton(
          onPressed: () {
            setState(() {
              products.add(
                Product(
                  nameController.text,
                  amountController.text,
                ),
              );
              nameController.clear();
              amountController.clear();
            });
          },
          child: Text('Tambah Item'),
        ),
        SizedBox(height: 20), // Tambahkan jarak antara form dan daftar item
        Text(
          'Daftar Item',
          style: TextStyle(fontSize: 16),
        ),
        Expanded(
          child: ListView.builder(
            padding: EdgeInsets.only(
              top: 8
            ),
            shrinkWrap: true,
            itemCount: products.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  ListTile(
                    contentPadding: EdgeInsets.all(0),
                    title: Text(products[index].name),
                    subtitle: Text(
                      'Total Item: ${products[index].amount}\n'
                      'Total Harga: Rp 100.000.000',

                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () {
                        setState(() {
                          products.removeAt(index);
                        });
                      },
                    ),
                  ),
                  Divider()
                ],
              );
            },
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Text('Grand Total'),
        TextFormField(
          readOnly: true,
          initialValue: 'Rp 100.000.000',
          style: TextStyle(fontSize: 30),
        ),
        ElevatedButton(
          onPressed: () {},
          child: Text("Simpan Data"),
        ),
      ],
    );
  }
}

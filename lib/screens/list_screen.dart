import 'package:flutter/material.dart';
import '../data/pertanian_items.dart';
import 'detail_screen.dart';

class ListScreen extends StatelessWidget {
  const ListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List View'),
        backgroundColor: Colors.green[700],
      ),
      body: ListView.separated(
        itemCount: daftarTanaman.length,
        separatorBuilder: (context, index) =>
            Divider(height: 1, color: Colors.grey[400]),
        itemBuilder: (context, index) {
          final item = daftarTanaman[index];
          return ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailScreen(item: item),
                ),
              );
            },
            leading: Hero(
              tag: item.imageAsset,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.asset(
                  item.imageAsset,
                  width: 80,
                  height: 80,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            title: Text(
              item.title,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(item.description),
            trailing: const Icon(Icons.arrow_forward_ios),
          );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../main.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pengaturan'),
        backgroundColor: Colors.green[700],
      ),
      body: ListView(
        children: <Widget>[
          Consumer<ThemeModel>(
            // Ambil ThemeModel dari context yang disediakan di main.dart
            builder: (context, themeModel, child) {
              return ListTile(
                title: const Text('Tema Gelap'),
                trailing: Switch(
                  value: themeModel.isDark,
                  onChanged: (value) {
                    themeModel.toggleTheme();
                  },
                ),
              );
            },
          ),
          // Tambahkan pengaturan lainnya di sini
        ],
      ),
    );
  }
}

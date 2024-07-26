import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../main.dart';
import 'list_screen.dart';
import 'grid_screen.dart';
import '../data/kelompok.dart';
import 'setting_screen.dart';
import '../screens/cuaca_screens.dart'; // Import screen cuaca

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeModel = Provider.of<ThemeModel>(context);

    return Scaffold(
      backgroundColor: themeModel.isDark ? Colors.grey[850] : null,
      body: Stack(
        children: [
          if (!themeModel.isDark) ...[
            Image.asset(
              'lib/assets/images/sawah_padi.jpg',
              fit: BoxFit.cover,
              height: double.infinity,
              width: double.infinity,
            ),
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 8.0, sigmaY: 8.0),
              child: Container(
                color: Colors.black.withOpacity(0.2),
              ),
            ),
          ],
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 8.0, sigmaY: 8.0),
            child: Container(
              color: Colors.black.withOpacity(themeModel.isDark ? 0.3 : 0.0),
            ),
          ),
          Positioned(
            top: 20,
            right: 20,
            child: IconButton(
              icon: Icon(
                Icons.settings,
                color: themeModel.isDark ? Colors.white : Colors.black,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const SettingScreen()),
                );
              },
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Tani Maju',
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                      color: themeModel.isDark ? Colors.white : Colors.white,
                      shadows: const [
                        Shadow(
                          blurRadius: 10.0,
                          color: Colors.black54,
                          offset: Offset(3.0, 3.0),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Aplikasi Pertanian Anda',
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 18,
                      color: themeModel.isDark ? Colors.white70 : Colors.white,
                    ),
                  ),
                  const SizedBox(
                      height:
                          40), // Menambahkan jarak antara container kelompok dan tombol
                  Container(
                    width: double.infinity,
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      color: themeModel.isDark
                          ? Colors.grey[700]
                          : Colors.white.withOpacity(0.8),
                      borderRadius: BorderRadius.circular(10.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          kelompokPertanian.namaKelompok,
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color:
                                themeModel.isDark ? Colors.white : Colors.black,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Wrap(
                          spacing: 8.0,
                          runSpacing: 4.0,
                          children: kelompokPertanian.anggota
                              .map((anggota) => Chip(
                                    label: Text(anggota,
                                        style: TextStyle(
                                            color: themeModel.isDark
                                                ? Colors.white
                                                : Colors.black)),
                                    backgroundColor: themeModel.isDark
                                        ? Colors.grey[600]
                                        : Colors.grey[200],
                                  ))
                              .toList(),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 20), // Menambahkan jarak antara tombol
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildButton(
                        context,
                        'List Tanaman',
                        Icons.list,
                        const ListScreen(),
                        themeModel.isDark,
                      ),
                      const SizedBox(width: 20),
                      _buildButton(
                        context,
                        'Grid Tanaman',
                        Icons.explore,
                        const GridScreen(),
                        themeModel.isDark,
                      ),
                      const SizedBox(width: 30),
                      _buildButton(
                        context,
                        'Cuaca API',
                        Icons.wb_sunny,
                        CuacaScreen(),
                        themeModel.isDark,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildButton(BuildContext context, String text, IconData icon,
      Widget screen, bool isDark) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => screen),
        );
      },
      child: Column(
        children: [
          Icon(icon, size: 48, color: isDark ? Colors.white : Colors.white),
          const SizedBox(height: 10),
          Text(
            text,
            style: TextStyle(
                fontSize: 18, color: isDark ? Colors.white : Colors.white),
          ),
        ],
      ),
    );
  }
}

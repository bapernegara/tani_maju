import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../main.dart'; // Import ThemeModel
import '../data/pertanian_items.dart';

class DetailScreen extends StatelessWidget {
  final PertanianItem item;

  const DetailScreen({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(item.title),
        backgroundColor: Colors.green[700],
      ),
      body: Consumer<ThemeModel>(
        builder: (context, themeModel, _) {
          return SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ImageWithHero(imageAsset: item.imageAsset),
                const SizedBox(height: 20.0),
                TitleText(text: item.title, isDark: themeModel.isDark),
                const SizedBox(height: 10.0),
                DescriptionText(
                    text: item.description, isDark: themeModel.isDark),
                const SizedBox(height: 20.0),
                InfoCard(
                    title: 'Manfaat',
                    content: item.manfaat,
                    icon: Icons.favorite,
                    isDark: themeModel.isDark),
                InfoCard(
                    title: 'Cara Menanam',
                    content: item.caraMenanam,
                    icon: Icons.eco,
                    isDark: themeModel.isDark),
                InfoCard(
                    title: 'Hama & Penyakit',
                    content: item.hamaPenyakit,
                    icon: Icons.bug_report,
                    isDark: themeModel.isDark),
                InfoCard(
                    title: 'Panen & Pascapanen',
                    content: item.panenPascaPanen,
                    icon: Icons.agriculture,
                    isDark: themeModel.isDark),
              ],
            ),
          );
        },
      ),
    );
  }
}

// Widget ImageWithHero
class ImageWithHero extends StatelessWidget {
  final String imageAsset;

  const ImageWithHero({super.key, required this.imageAsset});

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: imageAsset,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.0),
        child: Image.asset(
          imageAsset,
          width: double.infinity,
          height: 200,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

// Widget TitleText
class TitleText extends StatelessWidget {
  final String text;
  final bool isDark;

  const TitleText({super.key, required this.text, required this.isDark});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: 'Roboto',
        fontSize: 24.0,
        fontWeight: FontWeight.bold,
        color: isDark ? Colors.white : Colors.black,
      ),
    );
  }
}

// Widget DescriptionText
class DescriptionText extends StatelessWidget {
  final String text;
  final bool isDark;

  const DescriptionText({super.key, required this.text, required this.isDark});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: 'Roboto',
        fontSize: 16.0,
        color: isDark ? Colors.white70 : Colors.black,
      ),
    );
  }
}

// Widget InfoCard
class InfoCard extends StatelessWidget {
  final String title;
  final String content;
  final IconData icon;
  final bool isDark;

  const InfoCard(
      {super.key,
      required this.title,
      required this.content,
      required this.icon,
      required this.isDark});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: isDark ? Colors.grey[700] : Colors.white,
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              leading: Icon(icon, color: isDark ? Colors.white : Colors.green),
              title: Text(
                title,
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: isDark ? Colors.white : Colors.black,
                ),
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              content,
              style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 16.0,
                color: isDark ? Colors.white70 : Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

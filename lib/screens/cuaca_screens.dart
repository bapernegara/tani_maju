import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';

class CuacaScreen extends StatefulWidget {
  @override
  _CuacaScreenState createState() => _CuacaScreenState();
}

class _CuacaScreenState extends State<CuacaScreen> {
  String lokasi = "Jambi, Indonesia";
  double suhu = 0.0;
  String kondisi = "";
  int kelembapan = 0;
  double kecepatanAngin = 0.0;
  String arahAngin = "";
  double tekananUdara = 0.0;
  double curahHujan = 0.0;
  int indeksUV = 0;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _ambilDataCuaca();
  }

  Future<void> _ambilDataCuaca() async {
    setState(() {
      isLoading = true;
    });

    double latitude = -1.6008;
    double longitude = 103.6184;

    final response = await http.get(Uri.parse(
        'https://api.open-meteo.com/v1/forecast?latitude=$latitude&longitude=$longitude&current_weather=true&hourly=temperature_2m,relativehumidity_2m,windspeed_10m,winddirection_10m'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final currentWeather = data['current_weather'];
      final hourly = data['hourly'];

      setState(() {
        suhu = currentWeather['temperature'];
        kondisi = currentWeather['weathercode'].toString();
        kelembapan = hourly['relativehumidity_2m'][0];
        kecepatanAngin = hourly['windspeed_10m'][0];
        arahAngin = hourly['winddirection_10m'][0].toString();
        tekananUdara = 1013.25; // Ganti dengan data aktual jika ada
        curahHujan = 0.0; // Ganti dengan data aktual jika ada
        indeksUV = 3; // Ganti dengan data aktual jika ada
        isLoading = false;
      });
    } else {
      throw Exception('Gagal mengambil data cuaca');
    }
  }

  String _getDeskripsiCuaca(int weathercode) {
    final Map<int, String> deskripsiCuaca = {
      0: "Langit cerah",
      1: "Sebagian besar cerah",
      2: "Sebagian berawan",
      3: "Berawan",
      45: "Kabut",
      48: "Kabut yang membekukan",
      51: "Gerimis ringan",
      53: "Gerimis sedang",
      55: "Gerimis deras",
      // ... Tambahkan deskripsi cuaca lainnya sesuai kebutuhan ...
      95: "Badai Petir",
      96: "Badai Petir dengan hujan es kecil",
      99: "Badai Petir dengan hujan es besar",
    };
    return deskripsiCuaca[weathercode] ?? "Kondisi cuaca tidak diketahui";
  }

  IconData _getIconCuaca(int weathercode) {
    if (weathercode == 0) {
      return Icons.wb_sunny;
    } else if (weathercode == 1 || weathercode == 2) {
      return Icons.wb_cloudy;
    } else if (weathercode == 3) {
      return Icons.cloud;
    } else if (weathercode >= 45 && weathercode <= 48) {
      return Icons.foggy;
    } else if (weathercode >= 51 && weathercode <= 57) {
      return Icons.grain;
    } else if (weathercode >= 61 && weathercode <= 67) {
      return Icons.umbrella;
    } else if (weathercode >= 71 && weathercode <= 77) {
      return Icons.ac_unit;
    } else if (weathercode >= 80 && weathercode <= 82) {
      return Icons.thunderstorm;
    } else if (weathercode >= 85 && weathercode <= 86) {
      return Icons.snowing;
    } else if (weathercode >= 95 && weathercode <= 99) {
      return Icons.bolt;
    } else {
      return Icons.help;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cuaca Pertanian - $lokasi'),
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: _ambilDataCuaca,
          ),
        ],
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : RefreshIndicator(
              onRefresh: _ambilDataCuaca,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Text(
                      '${suhu.round()}°C',
                      style:
                          TextStyle(fontSize: 64, fontWeight: FontWeight.bold),
                    ),
                    Icon(
                      _getIconCuaca(int.parse(kondisi)),
                      size: 100,
                    ),
                    Text(
                      _getDeskripsiCuaca(int.parse(kondisi)),
                      style: TextStyle(fontSize: 20),
                    ),
                    SizedBox(height: 20),
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            ListTile(
                              leading: Icon(Icons.water_drop),
                              title: Text('Kelembapan: $kelembapan%'),
                            ),
                            ListTile(
                              leading: Icon(Icons.air),
                              title: Text(
                                  'Kecepatan Angin: ${kecepatanAngin.toStringAsFixed(1)} m/s'),
                            ),
                            ListTile(
                              leading: Icon(Icons.navigation),
                              title: Text('Arah Angin: ${arahAngin}°'),
                            ),
                            ListTile(
                              leading: Icon(Icons.beach_access),
                              title: Text('Indeks UV: $indeksUV'),
                            ),
                            ListTile(
                              leading: Icon(Icons.compress),
                              title: Text('Tekanan Udara: $tekananUdara hPa'),
                            ),
                            ListTile(
                              leading: Icon(Icons.opacity),
                              title: Text('Curah Hujan: $curahHujan mm'),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Update terakhir: ${DateFormat('dd MMMM yyyy, HH:mm').format(DateTime.now())}',
                      style: TextStyle(fontSize: 12),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}

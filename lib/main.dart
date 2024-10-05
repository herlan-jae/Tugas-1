import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tugas_1_pemrograman_mobile/provider/theme_provider.dart';
import 'package:tugas_1_pemrograman_mobile/theme/theme_data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (_) {
        return ThemeProvider();
      },),
    ],
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, child) {
          return MaterialApp(
              title: 'Tugas 1 Pemrograman Mobile',
              debugShowCheckedModeBanner: false,
              theme: Themes.themeData(isDarkTheme: themeProvider.getIsDarkTheme, context: context),
              home: MainScreen(),
          );
        },
      )
    );
  }
}

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Tema', style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '20230801327',
              style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Herlan Jaelani',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 18.0),
            Text(
              'KJ301',
              style: TextStyle(
                color: Colors.blue,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'CIE511 - Pemrograman Mobile',
              style: TextStyle(
                color: Colors.blue,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 42.0),
            Text(
              themeProvider.getIsDarkTheme ? 'Mode Gelap' : 'Mode Terang',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
            ),
            SizedBox(height: 12.0),
            Switch(
                activeColor: Colors.blue,
                inactiveThumbColor: Colors.blue,
                value: themeProvider.getIsDarkTheme,
                onChanged: (value) {
                  themeProvider.setDarkTheme(value);
                },

            ),
          ],
        ),
      ),
    );
  }
}

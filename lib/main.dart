import 'package:dtcharactersheet/providers/character_provider.dart';
import 'package:dtcharactersheet/screens/character_sheet_screen.dart';
import 'package:dtcharactersheet/screens/list_character_screen.dart';
import 'package:dtcharactersheet/utils/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [ChangeNotifierProvider(create: (context) => CharacterProvider())],
        child: MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: const ListCharacterScreen(),
            routes: {
              AppRoutes.characterSheetScreen: (context) => const CharacterSheetScreen(),
              AppRoutes.listCharacterScreen: (context) => const ListCharacterScreen()
            }));
  }
}

import 'package:flutter/material.dart';
import 'services/localization_service.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateTitle: (context) => LocalizationService.of(context)!.translate('title'),
      localizationsDelegates: [
        LocalizationService.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', ''), // English
        Locale('es', ''), // Spanish
      ],
      // Rest of your MaterialApp
    );
  }
}

class GlobalCupertinoLocalizations {
}

class GlobalMaterialLocalizations {
  static var delegate;
}

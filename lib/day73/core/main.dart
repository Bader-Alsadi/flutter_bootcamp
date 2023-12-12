import 'package:app/day73/featuer/viewModel/exchage_moany.dart';
import 'package:app/day73/featuer/views/exchange_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ExchangeMaonyVM>(
      create: (context) => ExchangeMaonyVM(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SafeArea(child: ExchangePage()),
      ),
    );
  }
}

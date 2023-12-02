import 'package:flutter/material.dart';

class AddServiceProvider extends StatefulWidget {
  const AddServiceProvider({super.key});
 static const String ROUTE ="add_service_page";

  @override
  State<AddServiceProvider> createState() => _AddServiceProviderState();
}

class _AddServiceProviderState extends State<AddServiceProvider> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(children: [],),
      ),
    );
  }
}
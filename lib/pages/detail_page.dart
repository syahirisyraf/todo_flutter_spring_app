import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Details'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => goBack(context),
          child: Text('Go Back'),
        ),
      ),
    );
  }
}

void goBack(context) {
  Navigator.pop(context);
}

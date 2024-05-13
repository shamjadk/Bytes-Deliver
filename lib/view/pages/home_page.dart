import 'package:bytes_deliver/controller/services/api_service.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bytes Deliver'),
      ),
      body: FutureBuilder(
        future: ApiServices.getData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemBuilder: (context, index) =>
                  Text(snapshot.data![index].title),
            );
          } else if (snapshot.data == null) {
            return const Center(
              child: Text('Null'),
            );
          } else if (snapshot.hasError) {
            return const Center(
              child: Text('Error'),
            );
          } else {
            return const LinearProgressIndicator();
          }
        },
      ),
    );
  }
}

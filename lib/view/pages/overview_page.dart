import 'package:bytes_deliver/model/api_model.dart';
import 'package:flutter/material.dart';

class OverViewPage extends StatelessWidget {
  final ApiModel model;
  const OverViewPage({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(
                model.image,
                width: MediaQuery.sizeOf(context).width,
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                model.title,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                'Type: ${model.type.toUpperCase()}',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                '₹${model.price}',
                style: const TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.green),
              )
            ],
          ),
        ),
      ),
    );
  }
}

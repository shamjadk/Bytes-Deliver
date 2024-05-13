import 'package:bytes_deliver/model/api_model.dart';
import 'package:flutter/material.dart';

class ProductGridViewidget extends StatelessWidget {
  final List<ApiModel> data;
  const ProductGridViewidget({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, mainAxisSpacing: 16, mainAxisExtent: 220),
      itemCount: data.length,
      itemBuilder: (context, index) => Card(
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 200,
                height: 120,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    image: DecorationImage(
                        image: NetworkImage(data[index].image),
                        fit: BoxFit.cover)),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                data[index].title,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                data[index].type.toUpperCase(),
                style:
                    const TextStyle(fontWeight: FontWeight.w500, fontSize: 12),
              ),
              Text(
                '₹${data[index].price}',
                style: const TextStyle(
                    fontWeight: FontWeight.w500, color: Colors.green),
              )
            ],
          ),
        ),
      ),
    );
  }
}

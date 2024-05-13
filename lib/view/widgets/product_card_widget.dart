import 'package:bytes_deliver/controller/nav_controller.dart';
import 'package:bytes_deliver/model/api_model/api_model.dart';
import 'package:bytes_deliver/view/pages/overview_page.dart';
import 'package:flutter/material.dart';

class ProductcardWidget extends StatelessWidget {
  final ApiModel model;
  const ProductcardWidget({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => navPush(context, OverViewPage(model: model)),
      child: Card(
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
                        image: NetworkImage(model.image), fit: BoxFit.cover)),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                model.title,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                model.type.toUpperCase(),
                style:
                    const TextStyle(fontWeight: FontWeight.w500, fontSize: 12),
              ),
              Text(
                '₹${model.price}',
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

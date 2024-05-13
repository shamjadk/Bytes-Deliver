import 'package:bytes_deliver/controller/provider/api_provider.dart';
import 'package:bytes_deliver/model/cart_entity_model/cart_entity_model.dart';
import 'package:bytes_deliver/view/widgets/bottom_elevated_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OverViewPage extends ConsumerWidget {
  final dynamic model;
  const OverViewPage({super.key, required this.model});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16),
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
        floatingActionButton: BottomElevatedButtonWidget(
          btnName: 'Add to cart',
          onPressed: () {
            ref.read(apiProvider.notifier).addToCart(CartEntityModel(
                title: model.title,
                price: model.price,
                image: model.image,
                type: model.type));
          },
        ));
  }
}

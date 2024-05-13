import 'package:bytes_deliver/model/api_model/api_model.dart';
import 'package:bytes_deliver/view/widgets/product_card_widget.dart';
import 'package:flutter/material.dart';

class ProductGridViewidget extends StatelessWidget {
  final List<ApiModel> data;
  const ProductGridViewidget({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        physics: const ClampingScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 8,
            mainAxisExtent: 240,
            crossAxisSpacing: 8),
        itemCount: data.length,
        itemBuilder: (context, index) => ProductcardWidget(model: data[index]));
  }
}

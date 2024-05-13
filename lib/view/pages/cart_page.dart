import 'package:bytes_deliver/controller/nav_controller.dart';
import 'package:bytes_deliver/controller/provider/api_provider.dart';
import 'package:bytes_deliver/view/pages/overview_page.dart';
import 'package:bytes_deliver/view/widgets/bottom_elevated_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Cartpage extends ConsumerWidget {
  const Cartpage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Cart',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ListView.separated(
          itemCount: ref.watch(apiProvider).length,
          itemBuilder: (context, index) {
            final data = ref.watch(apiProvider);
            return SizedBox(
              width: MediaQuery.sizeOf(context).width,
              child: InkWell(
                onTap: () => navPush(context,
                    OverViewPage(model: ref.watch(apiProvider)[index])),
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: ListTile(
                      contentPadding: const EdgeInsets.all(0),
                      minVerticalPadding: 0,
                      leading: Container(
                        width: 48,
                        height: 48,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            image: DecorationImage(
                                image: NetworkImage(data[index].image),
                                fit: BoxFit.cover)),
                      ),
                      title: SizedBox(
                        width: 200,
                        child: Text(
                          data[index].title,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(fontWeight: FontWeight.w500),
                        ),
                      ),
                      subtitle: Text(
                        '₹${data[index].price}',
                        style: const TextStyle(
                            color: Colors.green, fontWeight: FontWeight.w500),
                      ),
                      trailing: IconButton(
                          onPressed: () {
                            ref
                                .read(apiProvider.notifier)
                                .deleteItemFromCart(data[index].id);
                          },
                          icon: const Icon(Icons.delete)),
                    ),
                  ),
                ),
              ),
            );
          },
          separatorBuilder: (context, index) => const SizedBox(
            height: 8,
          ),
        ),
      ),
      floatingActionButton: BottomElevatedButtonWidget(
        btnName: 'Clear cart',
        onPressed: () {
          ref.read(apiProvider.notifier).clearCart();
        },
      ),
    );
  }
}

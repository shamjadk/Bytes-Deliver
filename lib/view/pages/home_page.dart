import 'package:bytes_deliver/controller/nav_controller.dart';
import 'package:bytes_deliver/controller/provider/api_provider.dart';
import 'package:bytes_deliver/view/pages/cart_page.dart';
import 'package:bytes_deliver/view/widgets/products_grid_view_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Bytes Deliver',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        elevation: 0,
        scrolledUnderElevation: 0,
        actions: [
          IconButton(
              onPressed: () => navPush(context, const Cartpage()),
              icon: Stack(
                children: [
                  const Icon(Icons.shopping_cart),
                  ref.watch(apiProvider).isNotEmpty
                      ? Positioned(
                          right: 0,
                          child: CircleAvatar(
                            backgroundColor: Colors.red,
                            foregroundColor: Colors.white,
                            radius: 5,
                            child: Center(
                              child: Text(
                                ref.watch(apiProvider).length.toString(),
                                style: const TextStyle(fontSize: 6),
                              ),
                            ),
                          ),
                        )
                      : const Text('')
                ],
              ))
        ],
      ),
      body: SingleChildScrollView(
        child: FutureBuilder(
          future: ref.watch(apiProvider.notifier).getdata(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    children: [
                      ProductGridViewidget(data: snapshot.data!),
                      const SizedBox(
                        height: 16,
                      ),
                    ],
                  ));
            } else if (snapshot.hasError) {
              return const Center(
                child: Text('Error'),
              );
            } else {
              return const LinearProgressIndicator();
            }
          },
        ),
      ),
    );
  }
}

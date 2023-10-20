import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:noon_demo/modal/product.dart';
import 'package:noon_demo/providers/shopping_cart_provider.dart';

class ProductPage extends HookConsumerWidget {
  final Product product;
  const ProductPage({
    super.key,
    required this.product,
  });
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(),
        backgroundColor: Colors.grey[100],
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: ListView(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    product.brand.name,
                    style: TextStyle(fontWeight: FontWeight.bold, color: Theme.of(context).primaryColor),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          product.rating.toStringAsFixed(1),
                          style: const TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        const Icon(
                          Icons.star,
                          size: 12,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Text(
                product.title,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              CarouselSlider.builder(
                itemCount: product.images.length,
                itemBuilder: (context, index, realIndex) {
                  return Image.network(
                    product.images[index],
                    fit: BoxFit.cover,
                  );
                },
                options: CarouselOptions(
                  height: 360,
                  viewportFraction: .9,
                  autoPlay: true,
                ),
              ),
              const SizedBox(height: 12),
              Text.rich(
                TextSpan(
                  text: "AED ",
                  style: const TextStyle(fontSize: 18),
                  children: [
                    TextSpan(
                      text: product.price.toStringAsFixed(2),
                      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32),
              Container(
                color: Colors.grey[50],
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Overview",
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ),
                    TabBar(
                      labelColor: Colors.grey[800],
                      tabs: const [
                        Tab(text: "Highlights"),
                        Tab(text: "Specification"),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                color: Colors.grey[50],
                height: 200,
                child: const TabBarView(
                  children: [
                    SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text("""
                    A smartphone come in use for communicating through voice messages and mails and are handy
                    Mobile phones provides an opportunity for friends and families to stay in touch regardless of their physical distances
                    With the help smartphone you can do messaging and picture sharing and social media and emails and can connect and communicate with people
                    They fit easily into your pocket or bag and moreover they dont weigh much
                    A smartphone has more advanced features including web browsing software applications and a mobile os
                    Your busy life deserves a battery built for busy; Whether you’re taking a video call on your commute, catching up on your favorite show or with friends and family, your long-lasting, super fast charging battery has your back
                    Very best of Galaxy A Series gives you awesomely smooth streaming of your favorite content with the most powerful performance in its series and awesomely fast speeds to download shows and movies all at the speed of 5G"""),
                      ),
                    ),
                    Text(""),
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: Container(
          color: Colors.grey[50],
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    ref.read(shoppingCartProvider.notifier).add(product);
                  },
                  child: const Text("ADD TO CART"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

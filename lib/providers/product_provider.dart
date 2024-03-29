import 'package:flutter/material.dart';
import 'package:store/models/product_model.dart';

class ProductProvider with ChangeNotifier {
  List<ProductModel> products = [
    ProductModel(
      title: "LG CX Series 65-inch OLED TV",
      image:
          "https://tse1.mm.bing.net/th?id=OIP.h6433NOLtV444G-NbZRj4wHaE6&pid=Api&P=0&h=220",
      price: 2500,
      description:
          "The LG CX Series 65-inch OLED TV delivers stunning picture quality with perfect blacks and infinite contrast. It features Dolby Vision, AI-powered upscaling, and smart TV capabilities.",
      category: "tv",
      quantity: 10,
      rating: 4.9,
    ),
    ProductModel(
      title: "Nikon D850 DSLR Camera",
      image:
          "https://tse2.mm.bing.net/th?id=OIP.goHtE46oOkSI8veP0qt5sgAAAA&pid=Api&P=0&h=220",
      price: 3300,
      description:
          "The Nikon D850 is a full-frame DSLR camera that offers a 45.7-megapixel sensor, exceptional image quality, fast autofocus, and 4K UHD video recording.",
      category: "cameras",
      quantity: 8,
      rating: 4.8,
    ),
    ProductModel(
      title: "Microsoft Surface Pro 7",
      image:
          "https://tse3.mm.bing.net/th?id=OIP.5-ZBnSr9bTmg1yRTzOgxCQAAAA&pid=Api&P=0&h=220",
      price: 1200,
      description:
          "The Microsoft Surface Pro 7 is a versatile 2-in-1 laptop/tablet hybrid with a high-resolution PixelSense display, powerful performance, and long battery life.",
      category: "laptops",
      quantity: 15,
      rating: 4.7,
    ),
    ProductModel(
      title: "GoPro HERO9 Black",
      image:
          "https://tse3.mm.bing.net/th?id=OIP.Sll6D_cEW81nIinbCg3LeAHaFj&pid=Api&P=0&h=220",
      price: 450,
      description:
          "The GoPro HERO9 Black is a rugged action camera that captures high-quality 5K videos and 20-megapixel photos. It features HyperSmooth 3.0 stabilization and a front-facing display.",
      category: "cameras",
      quantity: 12,
      rating: 4.6,
    ),
    ProductModel(
      title: "Samsung HW-Q950T",
      image:
          "https://tse2.mm.bing.net/th?id=OIP.I886ua0Z79YZUjtPcaeFfwHaEJ&pid=Api&P=0&h=220",
      price: 1500,
      description:
          "The Samsung HW-Q950T is a premium soundbar system with a 9.1.4-channel configuration, Dolby Atmos support, and wireless subwoofer. It delivers immersive and cinematic sound.",
      category: "audio",
      quantity: 6,
      rating: 4.9,
    ),
    ProductModel(
      title: "Canon EOS R5",
      image:
          "https://tse1.mm.bing.net/th?id=OIP.bW1oaXWqdC-uQC1ur5b1kAHaEK&pid=Api&P=0&h=220",
      price: 3500,
      description:
          "The Canon EOS R5 is a high-end mirrorless camera with a 45-megapixel full-frame sensor, 8K video recording capabilities, and advanced autofocus performance.",
      category: "cameras",
      quantity: 5,
      rating: 4.9,
    ),
    ProductModel(
      title: "Bose QuietComfort 35 II",
      image:
          "https://tse3.mm.bing.net/th?id=OIP.rTW7sTuj9aSY5_pH3NsksAHaE7&pid=Api&P=0&h=220",
      price: 300,
      description:
          "The Bose QuietComfort 35 II is a popular wireless noise-canceling headphone with excellent sound quality, comfortable fit, and built-in Google Assistant and Amazon Alexa.",
      category: "audio",
      quantity: 25,
      rating: 4.7,
    ),
    ProductModel(
      title: "Fitbit Versa 3",
      image:
          "https://tse1.mm.bing.net/th?id=OIP.BQt503ki9b58GPDEhA-WGgHaHa&pid=Api&P=0&h=220",
      price: 230,
      description:
          "The Fitbit Versa 3 is a feature-packed smartwatch with built-in GPS, heart rate monitoring, sleep tracking, and a variety of fitness and health features.",
      category: "wearables",
      quantity: 30,
      rating: 4.6,
    ),
    ProductModel(
      title: "Samsung 55-inch QLED TV",
      image:
          "https://tse3.mm.bing.net/th?id=OIP.QAsT9Cwug2UTzN2G38yxAwHaHO&pid=Api&P=0&h=220",
      price: 1200,
      description:
          "The Samsung 55-inch QLED TV offers stunning 4K picture quality, vibrant colors, and smart TV functionality for an immersive home entertainment experience.",
      category: "tv",
      quantity: 15,
      rating: 4.8,
    ),
    ProductModel(
      title: "Apple AirPods Pro",
      image:
          "https://tse1.mm.bing.net/th?id=OIP.Y6Lti0rbYqiTyfhDycnRIQAAAA&pid=Api&P=0&h=220",
      price: 250,
      description:
          "The Apple AirPods Pro are premium true wireless earbuds with active noise cancellation, a comfortable design, and seamless integration with Apple devices.",
      category: "audio",
      quantity: 20,
      rating: 4.7,
    ),
    ProductModel(
      title: "Samsung Galaxy Note 20 Ultra",
      image:
          "https://tse2.mm.bing.net/th?id=OIP.Skf_Kchiv3kgWmbqLggnvwHaHk&pid=Api&P=0&h=220",
      price: 1300,
      description:
          "The Samsung Galaxy Note 20 Ultra is a high-end smartphone with a large display, powerful performance, and advanced S Pen functionality.",
      category: "phones",
      quantity: 15,
      rating: 4.8,
    ),
    ProductModel(
      title: "Google Pixel 6 Pro",
      image:
          "https://tse3.mm.bing.net/th?id=OIP.g_UESWt5gOxh89KOdT5BdAHaHa&pid=Api&P=0&h=220",
      price: 1100,
      description:
          "The Google Pixel 6 Pro is a flagship smartphone that offers a top-of-the-line camera system, pure Android experience, and fast performance.",
      category: "phones",
      quantity: 12,
      rating: 4.7,
    ),
    ProductModel(
      title: "Sony PlayStation 5",
      image:
          "https://tse3.mm.bing.net/th?id=OIP.VtsKPliCf4OxkjEdcTaJpQHaHa&pid=Api&P=0&h=220",
      price: 500,
      description:
          "The Sony PlayStation 5 is the latest generation gaming console with powerful hardware, stunning graphics, and a wide range of exclusive games.",
      category: "gaming",
      quantity: 20,
      rating: 4.9,
    ),
    ProductModel(
      title: "Dell XPS 15 Laptop",
      image:
          "https://tse2.mm.bing.net/th?id=OIP.hSos162cCyBM6uVNiOFmFQHaE8&pid=Api&P=0&h=220",
      price: 2000,
      description:
          "The Dell XPS 15 is a premium laptop with a high-resolution display, fast performance, and sleek design, making it ideal for professionals and content creators.",
      category: "laptops",
      quantity: 8,
      rating: 4.6,
    ),
    ProductModel(
      title: "Apple MacBook Pro 16",
      image:
          "https://tse2.mm.bing.net/th?id=OIP.POQQf7QMSspZQLv31nSDtQHaE8&pid=Api&P=0&h=220",
      price: 2500,
      description:
          "The Apple MacBook Pro 16 is a powerful laptop with a stunning Retina display, excellent performance, and a versatile set of features for creative professionals.",
      category: "laptops",
      quantity: 10,
      rating: 4.8,
    ),
  ];
  List<ProductModel> getProducts() {
    return products;
  }

  ProductModel? findProduct(String productId) {
    if (products.where((element) => element.id == productId).isEmpty) {
      return null;
    } else {
      return products.firstWhere((element) => element.id == productId);
    }
  }

  List<ProductModel> findByCategory(String categoryName) {
    final List<ProductModel> productsList =
        products.where((element) => element.category == categoryName).toList();
    return productsList;
  }

  List<ProductModel> searchByName(
      {required String searchName, required List<ProductModel> searchIn}) {
    final List<ProductModel> searchList = searchIn
        .where((element) =>
            element.title.toLowerCase().contains(searchName.toLowerCase()))
        .toList();
    return searchList;
  }
}

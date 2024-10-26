import 'package:flutter/material.dart';

String uri = 'http://localhost:3000';

class GlobaleVeriables {
  static const appBarGradient = LinearGradient(
    colors: [
      Color.fromARGB(255, 29, 201, 192),
      Color.fromARGB(255, 125, 221, 216),
    ],
    stops: [0.5, 1.01],
  );
  static const secondaryColor = Color.fromRGBO(255, 153, 0, 1);
  static const backgroundColor = Colors.white;
  static const Color greyBackgroundCOlor = Color(0xffebecee);
  static var selectedNavBarColor = Colors.cyan[800]!;
  static const unselectedNavBarColor = Colors.black87;

  static const List<String> carouselImages = [
    'https://img.freepik.com/free-photo/thinly-sliced-pepperoni-is-popular-pizza-topping-american-style-pizzerias-isolated-white-background-still-life_639032-229.jpg?size=626&ext=jpg&ga=GA1.2.1251981542.1694244561&semt=ais',
    'https://img.freepik.com/free-vector/coffee-cup-made-coffee-icons_1085-163.jpg?w=996&t=st=1694244836~exp=1694245436~hmac=b29dffd306ba1b8c6c38eff469dcc74cb77c4b4a3a611fa46c7bf56182085757',
    'https://images-eu.ssl-images-amazon.com/images/G/31/img22/Wireless/AdvantagePrime/BAU/14thJan/D37196025_IN_WL_AdvantageJustforPrime_Jan_Mob_ingress-banner_1242x450.jpg',
    'https://static.vecteezy.com/system/resources/previews/007/636/310/original/ice-cream-logo-icon-design-template-free-vector.jpg',
    'https://cdn2.vectorstock.com/i/1000x1000/57/51/creative-burger-logo-design-symbol-vector-25895751.jpg',
  ];

  static const List<Map<String, String>> categoryImages = [
    {
      'title': 'Pizza',
      'image': 'assets/images/PIZZA.png',
    },
    {
      'title': 'Hot Braveges',
      'image': 'assets/images/coffee.png',
    },
    {
      'title': 'Snacks',
      'image': 'assets/images/snack.png',
    },
    {
      'title': 'Ice Cream',
      'image': 'assets/images/ice.png',
    },
    {
      'title': 'Burger',
      'image': 'assets/images/burger.png',
    },
  ];
}

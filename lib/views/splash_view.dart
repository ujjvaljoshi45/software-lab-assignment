import 'package:assignment/views/login/login_view.dart';
import 'package:assignment/views/register/register_view.dart';
import 'package:flutter/material.dart';

class SplashView extends StatefulWidget {
  final List<CarouselItem> items = [
    CarouselItem(
      imageUrl: "assets/g1.png",
      title: 'Quality',
      para:
          "Sell your farm fresh products directly to consumers, cutting out the middleman and reducing emissions of the global supply chain. ",
      color: Color(0xff5EA25F),
    ),
    CarouselItem(
      imageUrl: "assets/g2.png",
      title: 'Convenient',
      para:
          "Our team of delivery drivers will make sure your orders are picked up on time and promptly delivered to your customers.",
      color: Color(0xffD5715B),
    ),
    CarouselItem(
      imageUrl: "assets/g3.png",
      title: 'Local',
      para:
          "We love the earth and know you do too! Join us in reducing our local carbon footprint one order at a time. ",
      color: Color(0xffF8C569),
    ),
  ];

  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              onPageChanged: (value) => setState(() => _currentPage = value),
              itemCount: widget.items.length,
              itemBuilder: (context, index) {
                final item = widget.items[index];
                return Container(
                  color: item.color,
                  child: Column(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height * 0.5,
                        decoration: BoxDecoration(
                          color: item.color,
                        ),
                        child: Image.asset(
                          item.imageUrl,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 20.0),
                        height: MediaQuery.of(context).size.height * 0.5,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(50.0),
                              topRight: Radius.circular(50.0)),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              item.title,
                              style: TextStyle(
                                  fontSize: 24.0, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              item.para,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 16.0, fontWeight: FontWeight.w300),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                buildIndicator(0, item),
                                buildIndicator(1, item),
                                buildIndicator(2, item),
                              ],
                            ),
                            ElevatedButton(
                              onPressed: () => Navigator.pushNamed(
                                  context, RegisterView.registerView),
                              child: Text(
                                'Join The Movemonet',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16),
                              ),
                              style: ButtonStyle(
                                elevation: MaterialStateProperty.all(0.0),
                                backgroundColor: MaterialStateProperty.all(
                                  item.color,
                                ),
                              ),
                            ),
                            TextButton(
                              onPressed: () => Navigator.pushNamed(
                                  context, LoginView.loginView),
                              child: Text('Login',
                                  style: TextStyle(
                                      color: Colors.black,
                                      decoration: TextDecoration.underline)),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget buildIndicator(int index, CarouselItem item) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 4.0),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        decoration: BoxDecoration(
          color: _currentPage == index ? item.color : Colors.black,
          shape: _currentPage == index ? BoxShape.values[1] : BoxShape.circle,
        ),
        width: _currentPage == index ? 20.0 : 6.0,
        height: _currentPage == index ? 10.0 : 6.0,
      ),
    );
  }
}

class CarouselItem {
  final String imageUrl;
  final String title;
  final String para;
  final Color color;

  CarouselItem(
      {required this.imageUrl,
      required this.title,
      required this.para,
      required this.color});
}

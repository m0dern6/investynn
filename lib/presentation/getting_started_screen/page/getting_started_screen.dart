import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:investynn/core/config/dimensions/dimensions.dart';
import 'package:investynn/core/config/routes/route_name.dart';
import 'package:investynn/core/const/app_assets.dart';
import 'package:investynn/core/helper/custom_button.dart';

class GettingStartedScreen extends StatefulWidget {
  const GettingStartedScreen({super.key});

  @override
  State<GettingStartedScreen> createState() => _GettingStartedScreenState();
}

class _GettingStartedScreenState extends State<GettingStartedScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  late Timer _timer;

  final List<Map<String, dynamic>> _slides = [
    {
      'image': AppAssets.illustration,
      'title': 'Track Your Investments',
      'description':
          'Monitor your portfolio with real-time updates, in-depth analytics, and performance insights to make informed investment decisions all in one place.',
    },
    {
      'image': AppAssets.illustration, // Replace with your actual asset
      'title': 'Market Insights',
      'description':
          'Get access to comprehensive market data and trends to stay ahead of the curve in your investment journey.',
    },
    {
      'image': AppAssets.illustration, // Replace with your actual asset
      'title': 'Smart Alerts',
      'description':
          'Receive timely notifications about price movements, portfolio changes, and important market events.',
    },
    {
      'image': AppAssets.illustration, // Replace with your actual asset
      'title': 'Secure & Reliable',
      'description':
          'Your data is protected with bank-level security, ensuring your investment information remains private and secure.',
    },
  ];

  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
        systemNavigationBarColor: Colors.transparent,
        systemNavigationBarIconBrightness: Brightness.light,
      ),
    );

    // Auto-scroll timer
    _timer = Timer.periodic(const Duration(seconds: 5), (Timer timer) {
      if (_currentPage < _slides.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeIn,
      );
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final dimension = Dimensions(context);
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.onPrimary,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: dimension.width(10)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Welcome',
                      style: Theme.of(
                        context,
                      ).textTheme.titleMedium!.copyWith(fontSize: 41),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'to ',
                          style: Theme.of(
                            context,
                          ).textTheme.displayMedium!.copyWith(fontSize: 23),
                        ),
                        Column(
                          children: [
                            Text(
                              'Investynn',
                              style: Theme.of(
                                context,
                              ).textTheme.displayMedium!.copyWith(
                                fontSize: 23,
                                color: Theme.of(context).colorScheme.primary,
                              ),
                            ),
                            Image.asset(
                              AppAssets.underline,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                const Spacer(),
              ],
            ),

            // Slider Section
            Column(
              children: [
                SizedBox(
                  height: dimension.height(557),
                  child: PageView.builder(
                    controller: _pageController,
                    onPageChanged: (int page) {
                      setState(() {
                        _currentPage = page;
                      });
                    },
                    itemCount: _slides.length,
                    itemBuilder: (context, index) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            _slides[index]['image'],
                            height: dimension.height(341), // Adjust as needed
                          ),
                          SizedBox(height: dimension.height(20)),
                          Text(
                            _slides[index]['title'],
                            style: Theme.of(
                              context,
                            ).textTheme.displayMedium!.copyWith(fontSize: 23),
                          ),
                          SizedBox(height: dimension.height(20)),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: dimension.width(15),
                            ),
                            child: Text(
                              _slides[index]['description'],
                              textAlign: TextAlign.center,
                              style: Theme.of(
                                context,
                              ).textTheme.bodyLarge!.copyWith(
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),

                // Custom Dot Indicators
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    _slides.length,
                    (index) => AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      margin: EdgeInsets.symmetric(
                        horizontal: dimension.width(2),
                      ),
                      height: dimension.height(8),
                      width:
                          _currentPage == index
                              ? dimension.width(20) // Selected dot width
                              : dimension.width(8), // Unselected dot width
                      decoration: BoxDecoration(
                        color:
                            _currentPage == index
                                ? Theme.of(context).colorScheme.primary
                                : Colors.grey.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(
                          dimension.width(10),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),

            // Buttons Section
            Column(
              children: [
                PrimaryButton(
                  isHighlighted: true,
                  text: 'Login',
                  onPressed: () {
                    context.go(RouteName.login);
                  },
                ),
                SizedBox(height: dimension.height(20)),
                PrimaryButton(
                  isHighlighted: false,
                  text: 'Register',
                  onPressed: () {
                    context.go(RouteName.register);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

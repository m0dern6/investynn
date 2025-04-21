import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:investynn/core/config/dimensions/dimensions.dart';
import 'package:investynn/core/helper/custom_app_bar.dart';
import 'package:investynn/presentation/home_screen/widget/gainer_loser.dart';
import 'package:investynn/presentation/home_screen/widget/nepse_index.dart';
import 'package:investynn/presentation/home_screen/widget/nepse_performance_chart.dart';
import 'package:investynn/presentation/home_screen/widget/portfolio_performance_chart.dart';
import 'package:investynn/presentation/home_screen/widget/portfolio_summary.dart';
import 'package:investynn/presentation/home_screen/widget/quick_menu.dart';
import 'package:investynn/presentation/home_screen/widget/trending_now.dart';
import 'package:investynn/presentation/home_screen/widget/watchlists.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> items = [
    'Portfolio Summary',
    'NEPSE Index',
    'Portfolio Performance Chart',
    'NEPSE Performance Chart',
    'Trending Now',
    'Watchlists',
    'Gainers/Losers',
    'Quick Menu',
  ];

  Map<String, bool> itemVisibility = {};

  @override
  void initState() {
    super.initState();
    for (var item in items) {
      itemVisibility[item] = true;
    }
  }

  void updateItems(int oldIndex, int newIndex) {
    if (oldIndex < newIndex) {
      newIndex--;
    }
    final tiles = items.removeAt(oldIndex);
    items.insert(newIndex, tiles);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // Map each item to its corresponding widget
    final widgetMap = {
      'Portfolio Summary': PortfolioSummary(),
      'NEPSE Index': NepseIndex(),
      'Portfolio Performance Chart': PortfolioPerformanceChart(),
      'NEPSE Performance Chart': NepsePerformanceChart(),
      'Trending Now': TrendingNow(),
      'Watchlists': Watchlists(),
      'Gainers/Losers': GainerLoser(),
      'Quick Menu': QuickMenu(),
    };

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: CustomAppBar(
        isHomeScreen: true,
        isMainScreen: true,
        userName: 'Nabin Adhikari',
        hasNotification: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: Dimensions(context).width(10),
        ),
        child: Column(
          children: [
            SizedBox(height: Dimensions(context).height(20)),
            Expanded(
              child: ListView.separated(
                separatorBuilder:
                    (context, index) =>
                        SizedBox(height: Dimensions(context).height(20)),
                itemCount: items.length + 1,
                itemBuilder: (context, index) {
                  if (index < items.length) {
                    // Render the list items dynamically
                    if (itemVisibility[items[index]] == false) {
                      return SizedBox.shrink();
                    }
                    return widgetMap[items[index]] ?? SizedBox.shrink();
                  } else {
                    // Render the "Customize" button at the bottom
                    return GestureDetector(
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            return StatefulBuilder(
                              builder: (
                                BuildContext context,
                                StateSetter setState,
                              ) {
                                return Container(
                                  height: 500,
                                  color: Colors.white,
                                  child: Center(
                                    child: ReorderableListView.builder(
                                      itemCount: items.length,
                                      onReorder:
                                          (oldIndex, newIndex) =>
                                              updateItems(oldIndex, newIndex),
                                      itemBuilder: (context, index) {
                                        return ListTile(
                                          key: ValueKey(items[index]),
                                          title: Text(items[index]),
                                          leading: Checkbox(
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(50),
                                            ),
                                            value:
                                                itemVisibility[items[index]] ??
                                                true,
                                            onChanged: (value) {
                                              setState(() {
                                                itemVisibility[items[index]] =
                                                    value!;
                                              });
                                              // Also update the parent state
                                              this.setState(() {});
                                            },
                                          ),
                                          trailing: Icon(Icons.drag_handle),
                                        );
                                      },
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: Container(
                          width: double.infinity,
                          height: 50,
                          color: Colors.blue,
                          child: Center(
                            child: Text(
                              'Customize',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

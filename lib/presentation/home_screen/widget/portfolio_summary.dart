import 'package:flutter/material.dart';
import 'package:investynn/core/config/dimensions/dimensions.dart';
import 'package:investynn/core/const/app_assets.dart';
import 'package:investynn/core/const/color_const.dart';

class PortfolioSummary extends StatelessWidget {
  const PortfolioSummary({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: Dimensions(context).width(16),
        vertical: Dimensions(context).height(10),
      ),
      width: double.infinity,
      height: Dimensions(context).height(192),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Theme.of(
              context,
            ).colorScheme.primary.withAlpha((0.5 * 255).toInt()),
            offset: Offset(0, 0),
            blurRadius: 8,
            spreadRadius: 0,
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Total Portfolio Value',
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        'NPR. 2300000',
                        style: Theme.of(context).textTheme.displayMedium!
                            .copyWith(color: Colors.white, fontSize: 23),
                      ),
                      SizedBox(width: Dimensions(context).width(8)),
                      Image.asset(AppAssets.obscure, color: Colors.white),
                    ],
                  ),
                ],
              ),
              Container(
                width: Dimensions(context).width(64),
                height: Dimensions(context).height(42),
                decoration: BoxDecoration(
                  color: AppColors.success300,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: Text(
                    '+2.1%',
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Spacer(),
          Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: Dimensions(context).width(16),
                  vertical: Dimensions(context).height(16),
                ),
                width: double.infinity,
                height: Dimensions(context).height(54),
                decoration: BoxDecoration(
                  color: AppColors.primary600,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Today’s Profit or Loss',
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      'NPR. 2000000',
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: AppColors.success300,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.refresh_rounded,
                      color: AppColors.neutral10,
                      size: 20,
                    ),
                  ),
                  Text(
                    'updated a minute ago',
                    style: Theme.of(context).textTheme.labelSmall!.copyWith(
                      color: AppColors.neutral10,
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

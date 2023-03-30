import 'package:airplane_app/shared/theme.dart';
import 'package:airplane_app/ui/pages/home_page.dart';
import 'package:airplane_app/ui/pages/settings_page.dart';
import 'package:airplane_app/ui/pages/transaction_page.dart';
import 'package:airplane_app/ui/pages/wallet_page.dart';
import 'package:airplane_app/ui/widget/custom_bottom_navigation_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/page_cubit.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget buildContent(int currentIndex) {
      switch (currentIndex) {
        case 0:
          return const HomePage();
        case 1:
          return const TransactionPage();
        case 2:
          return const WalletPage();
        case 3:
          return const SettingsPage();
        default: 
          return const HomePage();
      }
    }

    Widget customBottomNavigation() {
      return Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            width: double.infinity,
            height: 60,
            margin: EdgeInsets.only(
                bottom: 30, left: defaultMargin, right: defaultMargin),
            decoration: BoxDecoration(
                color: kWhiteColor, borderRadius: BorderRadius.circular(18)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                CustomBottomNavigatioItem(
                  index: 0,
                  imageUrl: 'assets/icon_home.png',
                ),
                CustomBottomNavigatioItem(
                  index: 1,
                  imageUrl: 'assets/icon_booking.png',
                ),
                CustomBottomNavigatioItem(
                  index: 2,
                  imageUrl: 'assets/icon_card.png',
                ),
                CustomBottomNavigatioItem(
                  index: 3,
                  imageUrl: 'assets/icon_settings.png',
                ),
              ],
            ),
          ));
    }

    return BlocBuilder<PageCubit, int>(
      builder: (context, currentIndex) {
        return Scaffold(
          backgroundColor: kBackgroundColor,
          body: Stack(
            children: [buildContent(currentIndex), customBottomNavigation()],
          ),
        );
      },
    );
  }
}

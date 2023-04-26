import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:mcc/ui/common/app_colors.dart';
import 'package:mcc/ui/common/ui_helpers.dart';

import 'home_viewmodel.dart';

class HomeView extends StackedView<HomeViewModel> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    HomeViewModel viewModel,
    Widget? child,
  ) {
    HomeViewModel viewModel = HomeViewModel();
    final user = FirebaseAuth.instance.currentUser!;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Column(
                    children: [
                      Text(
                        'Ciao, ${user.email}!',
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      verticalSpaceMedium,
                      ElevatedButton.icon(
                          onPressed: viewModel.logOut,
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(Colors.black)
                          ),
                          icon: const Icon(Icons.arrow_back, size: 32, color: Colors.white,),
                          label: const Text(
                            'Esci',
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              color: Colors.white
                            ),
                          )
                      )
              ],
            ),
                ),
              ]
          ),
        ),
      ),
    )
    );
  }

  @override
  HomeViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      HomeViewModel();
}

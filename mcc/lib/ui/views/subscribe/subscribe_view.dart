import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../../component/appbar_custom.dart';
import '../../component/navigationdrawer_appbar.dart';
import 'subscribe_viewmodel.dart';

class SubscribeView extends StackedView<SubscribeViewModel> {
  const SubscribeView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
      SubscribeViewModel viewModel,
    Widget? child,
  ) {
    SubscribeViewModel viewModel = SubscribeViewModel();
    return Scaffold(
      backgroundColor: Colors.orange[400],
        appBar: AppBarCustom.appBarBackButton(context, 'Iscriviti'),
      body: Container(
        child: Container(
          height: 800,
          width: double.infinity,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
          ),
          child: WebViewWidget(controller: viewModel.initController()),
    ),
      )
    );
  }

  @override
  SubscribeViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      SubscribeViewModel();
}
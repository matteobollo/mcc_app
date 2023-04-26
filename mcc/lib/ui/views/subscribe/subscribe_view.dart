import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:webview_flutter/webview_flutter.dart';
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
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
            'Iscriviti',
          style: TextStyle(
            fontWeight: FontWeight.w600
          ),
          textAlign: TextAlign.center,
        ),
        backgroundColor: Colors.orange[400],
      ),
      drawer: NavigationDrawerCustom(),
      body: SafeArea(
        child: WebViewWidget(controller: viewModel.initController()),
    )
    );
  }

  @override
  SubscribeViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      SubscribeViewModel();
}
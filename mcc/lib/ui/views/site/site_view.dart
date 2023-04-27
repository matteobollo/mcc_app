import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../../component/navigationdrawer_appbar.dart';
import 'site_viewmodel.dart';

class SiteView extends StackedView<SiteViewModel> {
  const SiteView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
      SiteViewModel viewModel,
    Widget? child,
  ) {
    SiteViewModel viewModel = SiteViewModel();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
            'Il nostro sito',
          style: TextStyle(
            fontWeight: FontWeight.w600
          ),
          textAlign: TextAlign.center,
        ),
        backgroundColor: Colors.orange[400],
        elevation: 0,
      ),
      drawer: NavigationDrawerCustom(),
      body: SafeArea(
        child: WebViewWidget(controller: viewModel.initController()),
    )
    );
  }

  @override
  SiteViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      SiteViewModel();
}
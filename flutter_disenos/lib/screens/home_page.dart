import 'package:flutter/material.dart';
import 'package:flutter_disenos/widgets/background.dart';
import 'package:flutter_disenos/widgets/card_table.dart';
import 'package:flutter_disenos/widgets/custom_bottom_navigation.dart';
import 'package:flutter_disenos/widgets/page_title.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: const [
          Background(),
          _HomeBody()
        ],
      ),
      bottomNavigationBar: const CustomButtonNavigation(),
    );
  }
}

class _HomeBody extends StatelessWidget {
  const _HomeBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: const [
          PageTitle(),
          CardTable(),
        ],
      ),
    );
  }
}
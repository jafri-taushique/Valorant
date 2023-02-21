import 'package:flutter/material.dart';
import 'package:valorant/core/features/Dashboard/Widgets/dashboard-card.dart';

import '../data/Data.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height*.08,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('Dashboard',style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),),
                      ],
                    ),
                  ),
                  Divider(
                    height: 2,
                  ),
                  ...dashboardCard.map((e) => DashBoardCard(imageUrl: e.cardImageUrl, cardName: e.cardName, namedRoute: e.namedRoute,))
                ],
              ),
            ),
      )),
    );
  }
}

import 'package:flutter/material.dart';

class DashBoardCard extends StatelessWidget {
  const DashBoardCard({Key? key, required this.imageUrl, required this.cardName, required this.namedRoute}) : super(key: key);
  final String imageUrl;
  final String cardName;
  final String namedRoute;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context, namedRoute);
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 16),
        padding: EdgeInsets.all(8),
        height: MediaQuery.of(context).size.height * .20,
        width: double.maxFinite,
        alignment: Alignment.bottomLeft,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(imageUrl),
              fit: BoxFit.fill),
          border: Border.all(width: 2, color: Colors.white),
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20),
            topLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
        ),
        child: Text(
          cardName,
          style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

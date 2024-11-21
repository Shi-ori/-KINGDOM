import 'package:flutter/material.dart';

class Favorite extends StatelessWidget {
  const Favorite({super.key});
  
  @override
  Widget build(BuildContext context) {
    final int numberOfCards = 4;
     double cardWidth = MediaQuery.of(context).size.width * 0.4; 
    return SingleChildScrollView(
      child: Column(
        children: List.generate((numberOfCards / 2).ceil(), //2つRowに表示
            (int index) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              buildCard(cardWidth),
              if (index * 2 + 1 < numberOfCards) // 奇数の場合2つ目のカードがあるかチェック
                buildCard(cardWidth),
            ],
          );
        }),
      ),
    );
  }

  Widget buildCard(double width) {
    return SizedBox(
      width: width,
      height: 500,
      child: Card(
        margin: const EdgeInsets.all(10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Column(
          children: <Widget>[
            Image.network(
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTo7FLZVev8PvE4IK3-1evSjzC65pUQzCartw&usqp=CAU',
              fit: BoxFit.cover,
              width: double.infinity,
              height: 300,
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const <Widget>[
                Text('ねこかわいい'),
                SizedBox(width: 10),
                Icon(
                  Icons.favorite,
                  color: Colors.red,
                ),
              ],
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
  //throw UnimplementedError();
}

import 'package:flutter/material.dart';

class Favorite extends StatelessWidget {
  const Favorite({super.key});

  @override
  Widget build(BuildContext context) {
    final int numberOfCards = 3;
    final int cardsPerRow = 2; // 1行に表示するカード数
    double cardWidth =
        (MediaQuery.of(context).size.width - 40) / cardsPerRow; // 幅の計算

    return SingleChildScrollView(
      child: Column(
        children: List.generate(
          (numberOfCards / cardsPerRow).ceil(), // 2つずつRowに表示
          (int index) {
            // 配列のインデックスを index * cardsPerRow に基づいて計算
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                buildCard(
                    cardWidth, index * cardsPerRow), // indexに基づいてインデックスを渡す
                if (index * cardsPerRow + 1 <
                    numberOfCards) // 奇数の場合2つ目のカードがあるかチェック
                  buildCard(cardWidth, index * cardsPerRow + 1),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget buildCard(double width, int imageIndex) {
    List<String> imgarr = [
      'https://img.ips.co.jp/ij/20/1120101072/1120101072-520x.jpg',
      'https://www.seshop.com/static/images/product/11945/L.jpg',
      'https://image.gihyo.co.jp/assets/images/cover/2023/9784297137496.jpg',
    ];
    return SizedBox(
      width: width,
      height: 300, // 高さを調整
      child: Card(
        margin: const EdgeInsets.all(10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Column(
          children: <Widget>[
            Image.network(
              imgarr[imageIndex],
              fit: BoxFit.cover,
              width: double.infinity,
              height: 150,
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
}

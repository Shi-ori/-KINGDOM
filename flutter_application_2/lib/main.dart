import 'package:flutter/material.dart';
import 'package:flutter_application_2/Account.dart';
import 'package:flutter_application_2/Login.dart';
import 'package:flutter_application_2/favorite.dart';

void main() {
  runApp(new MaterialApp(
    home: new Login(),
  ));
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final int numberOfCards = 5;
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

  // カードを作成するメソッド
  Widget buildCard(double width, int imageIndex) {
    List<String> imgarr = [
      'https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcQYd7qJCwbAkpBSw7u9TZKoxgts3UKoBaJrZWZvJnxAywlIZOxswXO-AjoDjuDXTaHClEK_UMFrKjolJRVHzeEB4c05CtlzVJex964ccLKQrvM8FTn3hEo&usqp=CAc',
      'https://img.ips.co.jp/ij/20/1120101072/1120101072-520x.jpg',
      'https://www.seshop.com/static/images/product/11945/L.jpg',
      'https://img.ips.co.jp/ij/22/1122101190/1122101190-520x.jpg',
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
              imgarr[imageIndex % imgarr.length], // 配列のインデックスは循環する
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

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int selectedIndex = 0; // フッターメニューのインデックスを一時保存する
  List<Widget> display = [const Home(), const Favorite(), const Account()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('教科書KINGDOM'),
      ),
      body: display[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorite',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Account',
          ),
        ],
        currentIndex: selectedIndex,
        onTap: (int index) {
          setState(() {
            selectedIndex = index;
          });
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_application_2/Login.dart';
import 'package:flutter_application_2/favorite.dart';

void main() {
  runApp(const MyApp());
}

class Home extends StatelessWidget{
  const Home({super.key});
  
  

  @override
  Widget build(BuildContext context) {
    final int numberOfCards = 5;
    //int selectedIndex = 0;
    double cardWidth = MediaQuery.of(context).size.width * 0.3; // 幅
    
    return  SingleChildScrollView(
      child:Column(
        children: List.generate(
          (numberOfCards / 2).ceil(),//2つRowに表示
          (int index){
            return Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buildCard(cardWidth),
                  if (index * 2 + 1 < numberOfCards) // 奇数の場合2つ目のカードがあるかチェック
                    buildCard(cardWidth),
                ],
              );
          }
        ),
      ),
    );
    
    //throw UnimplementedError();
  }
// カードを作成するメソッド
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

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
  //final int numberOfCards = 13; // カード数
  int selectedIndex = 0; //フッターメニューのインデックスを一時保存する
  List<Widget> display = [Home(), Favorite(),Login()];

  @override
  Widget build(BuildContext context) {
   // double cardWidth = MediaQuery.of(context).size.width * 0.4; // 幅

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
          selectedIndex = index;
          setState(() {});
        },
      )
    );
  }

  
}

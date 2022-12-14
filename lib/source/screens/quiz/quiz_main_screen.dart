import 'package:eitango_kun/source/screens/quiz/quiz_result_screen.dart';
import 'package:flutter/material.dart';

import '../../models/eitango.dart';
import '../../services/eitango_service.dart';

class QuizMainScreen extends StatefulWidget {
  QuizMainScreen({Key? key}) : super(key: key);

  @override
  State<QuizMainScreen> createState() => _QuizMainScreenState();
}

class _QuizMainScreenState extends State<QuizMainScreen> {
  // GlobalKey型のインスタンスを定義
  GlobalKey globalKeyAppBar = GlobalKey();

  double screenWidth = 0;
  double screenHeight = 0;

  // RenderBox型の変数を定義。Widget（このコードではAppBar）の2次元情報を取得するために必要
  // null safety対応でlate（今は値を決定できない）をつける
  late RenderBox? appBarWidget;

  // AppBarのy座標開始位置と高さ（縦幅）を入れるための変数を定義
  // 初期値を設定しないとエラーになるため0.0を設定
  double appBarDy = 0.0;
  double appBarHeight = 0.0;

  int cnt = 0;
  final List<String> _stringList = ["1", "2", "3", "4", "5"];

  String _showString = "";

  EitangoService _eitangoService = EitangoService();

  late List<Eitango> _eitangoList;

  void kasan() async {
    cnt++;
    if (cnt >= _eitangoList.length) {
      var result = await Navigator.pushAndRemoveUntil(
          context,
          new MaterialPageRoute(builder: (context) => QuizResultScreen()),
          (_) => false);
    } else {
      setState(() {
        _showString = _eitangoList[cnt].english_word!;
      });
    }
  }

  @override
  void initState() {
    // buildメソッドが回り、AppBarの描画終了後に、GlobalKeyの情報を取得するようにするため、
    // addPostFrameCallbackメソッドを実行
    // null safety対応で?（null以外の時のみアクセス）をつける
    WidgetsBinding.instance.addPostFrameCallback((cb) {
      // GlobalKeyを通じてAppBarの2次元情報を取得
      // null safety対応で?と右辺にas RenderBoxをつける
      appBarWidget =
          globalKeyAppBar.currentContext?.findRenderObject() as RenderBox;

      // 2次元情報からAppBarの縦方向の上端位置（y座標）を取得
      appBarDy = appBarWidget!.localToGlobal(Offset.zero).dy;

      // 2次元情報からAppBarの高さ（縦幅）を取得
      appBarHeight = appBarWidget!.size.height;

      // 確認のため、取得した位置と高さをDebugウィンドウに表示
      print("AppBarの上端位置 $appBarDy、AppBarの高さ $appBarHeight");
    });

    getAlliEitangos();
    super.initState();
  }

  getAlliEitangos() async {
    var eitangos = await _eitangoService.readEitangos();
    setState(() {
      _eitangoList = <Eitango>[];
      eitangos.forEach((eitango) {
        var eitangoModel = Eitango();
        eitangoModel.id = eitango['id'];
        eitangoModel.english_word = eitango['english_word'];
        eitangoModel.japanese_word = eitango['japanese_word'];
        _eitangoList.add(eitangoModel);
      });
      _eitangoList.shuffle();
      _showString = _eitangoList[cnt].english_word!;
      // AppBarの位置と高さを取得後、setStateメソッドで全体を再描画する
    });
  }

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        key: globalKeyAppBar,
        title: Text('Quiz'),
      ),
      body: Column(
        children: [
          Container(
            // Container（グレーのボックス）の高さを、
            // 画面縦幅の2分の1から、AppBarの上端位置（基本は0）と高さの合計値を引くことで算出
            height: screenHeight * 0.5 - (appBarDy + appBarHeight),

            width: screenWidth,
            child: Center(
              child: Text(
                _showString,
                style: TextStyle(fontSize: 64, color: Colors.blue),
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                height: screenHeight * 0.25 - (appBarDy + appBarHeight),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: 60,
                      width: screenWidth * 0.4,
                      child: ElevatedButton(
                          onPressed: () {
                            kasan();
                          },
                          child: Text(
                            'Hello',
                            style: TextStyle(fontSize: 28),
                          )),
                    ),
                    Container(
                      height: 60,
                      width: screenWidth * 0.4,
                      child: ElevatedButton(
                          onPressed: () {
                            kasan();
                          },
                          child: Text(
                            'Hello',
                            style: TextStyle(fontSize: 28),
                          )),
                    ),
                  ],
                ),
              ),
              Container(
                height: screenHeight * 0.25 - (appBarDy + appBarHeight),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: 60,
                      width: screenWidth * 0.4,
                      child: ElevatedButton(
                          onPressed: () {
                            kasan();
                          },
                          child: Text(
                            'Hello',
                            style: TextStyle(fontSize: 28),
                          )),
                    ),
                    Container(
                      height: 60,
                      width: screenWidth * 0.4,
                      child: ElevatedButton(
                          onPressed: () {
                            kasan();
                          },
                          child: Text(
                            'Hello',
                            style: TextStyle(fontSize: 28),
                          )),
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

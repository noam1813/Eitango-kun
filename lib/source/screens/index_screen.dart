import 'package:eitango_kun/source/screens/add_screen.dart';
import 'package:eitango_kun/source/screens/edit_screen.dart';
import 'package:eitango_kun/source/screens/quiz/quiz_stanby_screen.dart';
import 'package:flutter/material.dart';
import '../models/eitango.dart';
import '../services/eitango_service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class IndexScreen extends StatefulWidget {
  const IndexScreen({Key? key}) : super(key: key);

  @override
  State<IndexScreen> createState() => IndexScreenState();
}

class IndexScreenState extends State<IndexScreen> {
  EitangoService _eitangoService = EitangoService();

  late List<Eitango> _eitangoList;

  void initState() {
    super.initState();
    getAlliEitangos();
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
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('IndexScene'),
      ),
      body: ListView.builder(
          itemCount: _eitangoList.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                  title: Text(_eitangoList[index].english_word!),
                  subtitle: Text(_eitangoList[index].japanese_word!),
                  trailing: IconButton(
                      onPressed: () async {
                        print(_eitangoList[index].japanese_word);
                        print(_eitangoList[index].hashCode);
                        var result = await Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => EditScreen(
                                      editingEitango: _eitangoList[index],
                                    )));
                        if (result) {
                          getAlliEitangos();
                        }
                      },
                      icon: Icon(Icons.edit))),
            );
          }),
      floatingActionButton: SpeedDial(
        animatedIcon: AnimatedIcons.menu_close,
        animatedIconTheme: IconThemeData(size: 22.0),
        curve: Curves.bounceIn,
        children: [
          SpeedDialChild(
            child: Icon(
              Icons.add,
              color: Colors.white,
            ),
            backgroundColor: Colors.blue,
            label: '英単語を追加する',
            onTap: () async {
              var result = await Navigator.push(context,
                  MaterialPageRoute(builder: (context) => AddScreen()));
              if (result) {
                getAlliEitangos();
              }
            },
          ),
          SpeedDialChild(
            child: Icon(
              Icons.question_mark,
              color: Colors.white,
            ),
            backgroundColor: Colors.blue,
            label: '英単語を暗記する',
            onTap: () async {
              var result = await Navigator.push(context,
                  MaterialPageRoute(builder: (context) => QuizStanbyScreen()));
              if (result) {
                getAlliEitangos();
              }
            },
          ),
        ],
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () async {
      //     var result = await Navigator.push(
      //         context, MaterialPageRoute(builder: (context) => AddScreen()));
      //     if (result) {
      //       getAlliEitangos();
      //     }
      //   },
      //   child: Icon(Icons.add),
      // ),
    );
  }
}

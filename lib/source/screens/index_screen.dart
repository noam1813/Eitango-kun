import 'package:eitango_kun/source/screens/add_screen.dart';
import 'package:flutter/material.dart';
import '../models/eitango.dart';
import '../services/eitango_service.dart';

class IndexScreen extends StatefulWidget {
  const IndexScreen({Key? key}) : super(key: key);

  @override
  State<IndexScreen> createState() => IndexScreenState();
}

class IndexScreenState extends State<IndexScreen> {
  EitangoService _eitangoService = EitangoService();

  late List<Eitango> _eitangoList;

  void initState(){
    super.initState();
    getAlliEitangos();
  }

  getAlliEitangos() async{
    _eitangoList = <Eitango>[];
    var eitangos = await _eitangoService.readEitangos();
    eitangos.forEach((eitango){
      setState((){
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
      body:ListView.builder(
          itemCount: _eitangoList.length,
          itemBuilder: (context,index){
          return Card(
            child: ListTile(
              title: Text(_eitangoList[index].english_word!),
              subtitle: Text(_eitangoList[index].japanese_word!),
              trailing: IconButton(onPressed: (){}, icon: Icon(Icons.edit))
            ),
          );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () async{
          var result  = await Navigator.push(
              context, MaterialPageRoute(builder: (context) => AddScreen()));
          if(result)
            {
              getAlliEitangos();
            }
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

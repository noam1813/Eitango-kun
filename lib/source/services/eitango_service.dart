import 'package:eitango_kun/source/models/eitango.dart';
import 'package:eitango_kun/source/repositories/repository.dart';

class EitangoService{
  Repository? _repository;

  EitangoService(){
    _repository = Repository();
  }

  saveEitango(Eitango eitango) async {
    return await _repository!.insertData('eitango', eitango.eitangoMap());
  }

  readEitangos() async{
    return await _repository!.readData('eitango');
  }

  readEitangoByID(eitangoID) async{
    return await _repository!.readDataByID('eitango', eitangoID);
  }

  updateEitango(Eitango eitango) async{
    return await _repository!.updateData('eitango', eitango.eitangoMap());
  }
}
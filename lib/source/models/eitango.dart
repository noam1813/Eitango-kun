class Eitango{
  int? id;
  String? english_word;
  String? japanese_word;

  eitangoMap(){
    var mapping = <String,dynamic>{};
    mapping['id'] = id;
    mapping['english_word'] = english_word;
    mapping['japanese_word'] = japanese_word;

    return mapping;
  }
}
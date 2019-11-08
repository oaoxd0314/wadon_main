import 'package:wadone_main/db/DatabaseProvider.dart';
import 'package:wadone_main/models/page.dart';

class PageDriver{
final dbProvider = DatabaseProvider.dbProvider;

  PageDriver(){
    initPage();
  }

  Future initPage() async{
  }

  Future<List> getPages() async {
    final db = await dbProvider.database;
    var catalogList = List<Page>();
    List<Map> result = await data();
    catalogList = result.map((item) => Page.fromJson(item)).toList();
    return catalogList;
  }

  data (){
    ///db sorce
  }


}
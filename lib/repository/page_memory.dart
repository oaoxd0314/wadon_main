import 'page_datasorce.dart';
import 'package:wadone_main/models/page.dart';
import 'help.dart';
///uncomplete:addPage
///data from datasorce
///datasorce is initialdata
class PageMemory {
  PageMemory() {
    initPage();
  }
  
  Future initPage() async {
    pageList.clear();
  }

  Future<List> getPage() async {
    return pageList;
  }

  Future<int> addPage() async {
    Map<String, dynamic> randomJson = Helper.makeRandCatalog(
      pageList.length,
    );
    Page randomCatalog = Page.fromJson(randomJson);
    pageList.add(randomCatalog);
    return pageList.length + 1;
  }

  Future clearPage() async {
    var result = await pageList.clear();
    return result;
  }
}
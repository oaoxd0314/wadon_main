import 'package:wadone_main/driver/pagedriver.dart';
import 'pagememory.dart';
const dataSource = 'memory';

class PageRespository {
  final _pageDriver = PageDriver();
  final _pageMemory = PageMemory();

  Future getpage({String query}) {
    switch (dataSource) {
      case 'memory':
        return _pageMemory.getPages();
        break;
      case 'db':
        return _pageDriver.getPages();
        break;
      default:
        return _pageMemory.getPages();
    }
  }
}
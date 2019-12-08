import 'package:flutter/material.dart';


class BuildDrawer extends StatefulWidget {
  @override
  _BuildDrawerState createState() => _BuildDrawerState();
}

class _BuildDrawerState extends State<BuildDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
    children: <Widget>[
      UserAccountsDrawerHeader(    
        accountEmail: Text('foo@nkust.edu.tw'), 
        accountName: Text('陳三斤'),
        currentAccountPicture: CircleAvatar(
          backgroundImage: AssetImage('assets/67437.jpg'),
        ),
      ),
      ExpansionTile(  //可展開列表
        
        title: Text('已訂閱社團'),
        children: <Widget>[ //子列表
          new ListTile(
              title: const Text('典雅國樂社'),
              leading: CircleAvatar(
                backgroundImage:AssetImage('assets/man.jpg'), //子列表圖片
              ),
              onTap: () {
                setState(() {
                });
              },              
            ),
        ],
        //subtitle: Text('ListSubtitle1',maxLines: 2,overflow: TextOverflow.ellipsis,),
        leading: CircleAvatar(child: Text("訂")),
      ),
      ExpansionTile(
        title: Text('服務性社團'),
        //subtitle: Text('ListSubtitle1',maxLines: 2,overflow: TextOverflow.ellipsis,),
        leading: CircleAvatar(child: Text("服")),
      ),
     ExpansionTile(
        title: Text('學術性社團'),
        //subtitle: Text('ListSubtitle2',maxLines: 2,overflow: TextOverflow.ellipsis,),
        leading: CircleAvatar(child: Text("學")),
      ),
      ExpansionTile(
        title: Text('康樂性社團'),
        //subtitle: Text('ListSubtitle3',maxLines: 2,overflow: TextOverflow.ellipsis,),
        leading: CircleAvatar(child: Text("康")),
      ),
      ExpansionTile(
        title: Text('體育性社團'),
        //subtitle: Text('ListSubtitle3',maxLines: 2,overflow: TextOverflow.ellipsis,),
        leading: CircleAvatar(child: Text("體")),
      ),
      ExpansionTile(
        title: Text('系學會'),
        //subtitle: Text('ListSubtitle3',maxLines: 2,overflow: TextOverflow.ellipsis,),
        leading: CircleAvatar(child: Text("系")),
      ),
      Divider(),//分割線
      new AboutListTile(
        icon: new CircleAvatar(),
        child: new Text("關於WaDone"),
        applicationName: "WaDone",
        applicationVersion: "1.0",
        applicationLegalese: "NKUST IC",
        aboutBoxChildren: <Widget>[
          new Text("文字"),
          new Text("文字")
        ],
      ),
      Divider(),//分割線
    ],
      ) 
    );
  }
}

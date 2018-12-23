import 'package:flutter/material.dart';

class TableScreen extends StatefulWidget {
  static final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  TableScreenState createState() {
    return new TableScreenState();
  }
}

class TableScreenState extends State<TableScreen> {
  int row=-1,col=-1;
  List<List<String>> data = [
    ['','1','2','3','4','5','6','7','8','9','10'],
    ['A','A1','A2','A3','A4','A5','A6','A7','A8','A9','A10'],
    ['B','B1','B2','B3','B4','B5','B6','B7','B8','B9','B10'],
    ['C','C1','C2','C3','C4','C5','C6','C7','C8','C9','C10'],
    ['D','D1','D2','D3','D4','D5','D6','D7','D8','D9','D10'],
    ['E','E1','E2','E3','E4','E5','E6','E7','E8','E9','E10'],
    ['F','F1','F2','F3','F4','F5','F6','F7','F8','F9','F10'],
    ['G','G1','G2','G3','G4','G5','G6','G7','G8','G9','G10'],
    ['H','H1','H2','H3','H4','H5','H6','H7','H8','H9','H10'],
    ['I','I1','I2','I3','I4','I5','I6','I7','I8','I9','I10'],
    ['J','J1','J2','J3','J4','J5','J6','J7','J8','J9','J10'],
  ];

  TextEditingController _searchText = TextEditingController();

  @override
  void dispose() {
    _searchText.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    var grid = GridView.builder(
      scrollDirection: Axis.vertical,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: data.length,
      ),
      itemBuilder: _tableItems,

      itemCount: data.length * data.length,
    );

    return Scaffold(
      key: TableScreen._scaffoldKey,
      appBar: AppBar(
        title: Text('Table'),
        elevation: 5.0,
        brightness: Brightness.dark,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Container(
                  height: 30.0,
                  width: 100.0,
                  child: TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Search',
                      hintStyle: TextStyle(
                        fontSize: 20.0,
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                      )
                    ),
                    controller: _searchText,
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    int i,j,found=0;
                    for (i=1;  i<data.length;  i++) {
                      for(j=1;  j<data[i].length;  j++){
                        if(data[i][j].compareTo(_searchText.text)== 0){
                          TableScreen._scaffoldKey.currentState.showSnackBar( SnackBar(
                            content: Text('Found : ${data[i][j]}'),
                            duration: Duration(seconds: 1),
                          ));
                          found=1;
                          row=i;col=j;
                          break;
                        }
                      }
                  }
                    if(found==0){
                      TableScreen._scaffoldKey.currentState.showSnackBar( SnackBar(
                        content: Text('Not found'),
                        duration: Duration(seconds: 1),
                      ));
                      row=-1;col=-1;
                    }
                    setState(() {});
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Icon(Icons.search,color: Colors.blueAccent, size: 40.0,),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 50.0),
              child: Container(
                height: 405.0,
                padding:  EdgeInsets.all(5.0),
                margin:  EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 2.0)
                ),
                child: GridView.builder(
                  scrollDirection: Axis.vertical,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: data.length,
                  ),
                  itemBuilder: _tableItems,
                  itemCount: data.length * data.length,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _tableItems(BuildContext context, int index) {
    int x, y = 0;

    x = (index / data.length).floor();
    y = (index % data.length);
    return GestureDetector(
      onTap: () => _gridItemTapped(x, y),
      child: GridTile(
        child: Container(
          decoration: BoxDecoration(
              border: Border.all(color: Colors.grey, width: 0.5)
          ),
          child: Center(
            child: _tableItem(x, y),
          ),
        ),
      ),
    );
  }

  Widget _tableItem(int x, int y) {
     return Container(
      decoration: BoxDecoration(
        color: (x==row &&y==col)?Colors.yellow:Colors.lightBlueAccent[100],
        border: Border.all(width: 2.0),
      ),
      height: 35.0,
      width: 35.0,
      child: Center(
        child: Text(data[x][y],
          style: TextStyle(
            fontSize: 15.0,
          ),
        ),
      ),
    );

  }

  _gridItemTapped(int x, int y) {

    TableScreen._scaffoldKey.currentState.showSnackBar( SnackBar(
      content: Text('Clicked : ${data[x][y]}'),
      duration: Duration(seconds: 1),
    ));
  }
}
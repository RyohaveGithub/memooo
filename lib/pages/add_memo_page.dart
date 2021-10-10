import 'package:flutter/material.dart';

class AddMemoPage extends StatefulWidget {
  const AddMemoPage({Key? key}) : super(key: key);

  @override
  _AddMemoPageState createState() => _AddMemoPageState();
}

class _AddMemoPageState extends State<AddMemoPage> {
  TextEditingController titleController = TextEditingController();
  TextEditingController detailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("メモを追加"),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top:40.0),
              child: Text("タイトル"),
            ),
            Padding(
              padding: const EdgeInsets.only(top:15.0),
              child: Container(
                decoration:BoxDecoration(
                    border:Border.all(color:Colors.grey)
                ),
                width:MediaQuery.of(context).size.width*0.8,
                  child:TextField(
                    controller: titleController ,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(left:10),
                        border: InputBorder.none
                    ),
                  ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top:40.0),
              child: Text("メモ内容"),
            ),
            Padding(
              padding: const EdgeInsets.only(top:15.0),
              child: Container(
                decoration:BoxDecoration(
                    border:Border.all(color:Colors.grey)
                ),
                width:MediaQuery.of(context).size.width*0.8,
                child:TextField(
                  controller: detailController,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(left:10),
                      border: InputBorder.none
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top:30.0),
              child: Container(
                width: MediaQuery.of(context).size.width*0.8,
                alignment: Alignment.center,
                child: RaisedButton(
                  color: Theme.of(context).primaryColor,
                  onPressed: () {
                  },
                  child:
                  Text("追加"
                  ,style: TextStyle(
                      color:Colors.white,
                  ),),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:memooo/model/memo.dart';
import 'package:memooo/pages/memo_page.dart';

class TopPage extends StatefulWidget {
  const TopPage({Key key,  this.title}) : super(key: key);
  final String title;

  @override
  State<TopPage> createState() => _TopPageState();
}

class _TopPageState extends State<TopPage> {
  List<Memo> memoList = [];

  Future<void> getMemo() async{
    var snapshot = await FirebaseFirestore.instance.collection('memo').get();
    var docs = snapshot.docs;
    docs.forEach((doc){
      memoList.add(Memo(
        title: doc.data()['title'],
        detail: doc.data()['detail']
      ));
    });
    setState((){
    });
  }

  @override
  void initState() {
    super.initState();
    getMemo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("memooo"),
      ),
      body: ListView.builder(
          itemCount: memoList.length,
          itemBuilder: (context,index){
            return ListTile(
              title: Text(memoList[index].title),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => MemoPage(memoList[index])));
              },
            );
          },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){

        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

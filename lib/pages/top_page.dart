import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:memooo/model/memo.dart';
import 'package:memooo/pages/add_memo_page.dart';
import 'package:memooo/pages/memo_page.dart';


class TopPage extends StatefulWidget {
  const TopPage({Key key,   this.title}) : super(key: key);
  final String title;

  @override
  State<TopPage> createState() => _TopPageState();
}

class _TopPageState extends State<TopPage> {
  List<Memo> memoList = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("memooo"),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection("memo").snapshots(),
        builder: (context, snapshot) {
          if(snapshot.connectionState== ConnectionState.waiting){
            return CircularProgressIndicator();
          }
          return ListView.builder(
              itemCount: snapshot.data.docs.length,
              itemBuilder: (context,index){
                return ListTile(
                  title: Text(snapshot.data.docs[index]['title']),
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => MemoPage(snapshot.data.docs[index])));
                  },
                );
              },
          );
        }
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => AddMemoPage()));
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

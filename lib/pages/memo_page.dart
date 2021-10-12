import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:memooo/model/memo.dart';

class MemoPage extends StatelessWidget {
  final QueryDocumentSnapshot memo;
  MemoPage(this.memo);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(memo['title'])
          // title: Text(memo.data()['title'])
    ),
        body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:  [
            const Text("確認画面です",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
            Text(memo["detail"],style: const TextStyle(fontSize: 18)),
          //Text(memo.data()["detail"],style: const TextStyle(fontSize: 18)),
          ]
        ),
      ),
    );
  }
}

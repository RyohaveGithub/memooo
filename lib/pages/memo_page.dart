import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:memooo/model/memo.dart';

class MemoPage extends StatelessWidget {
  final Memo memo;
  MemoPage(this.memo);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(memo.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:  [
            Text("確認画面です",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
            Text(memo.detail,style: TextStyle(fontSize: 18,)
          ],
        ),
      ),
    );
  }
}
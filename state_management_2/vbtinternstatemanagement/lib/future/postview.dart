import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:vbtinternstatemanagement/future/service/post_service.dart';

import 'model/post_model.dart';

class PostPage extends StatefulWidget {
  const PostPage({Key? key}) : super(key: key);

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  final PostService _postService = PostService();
  List<PostModel>? _postModel;

  bool isLoading = false;
  void changeLoading() {
    setState(() {
      isLoading = !isLoading;
    });
  }

  Future<void> init() async {
    _postModel = await _postService.fetchPost();
    changeLoading();
  }

  @override
  void initState() {
    init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.amber,
        onPressed: () {
          init();
        },
        child: Icon(Icons.restart_alt),
      ),
      body: isLoading
          ? ListView.builder(
              itemCount: _postModel?.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  child: ListTile(
                    subtitle:
                        Text(_postModel?[index].title ?? " Data gelmemiştir."),
                    title:
                        Text(_postModel?[index].body ?? " Data gelmemiştir."),
                    leading: Text(_postModel?[index].id.toString() ??
                        " Data gelmemiştir."),
                  ),
                );
              })
          : SizedBox(),
    );
  }
}

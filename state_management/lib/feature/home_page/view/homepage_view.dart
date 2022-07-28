import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:state_management/core/base/base_view.dart';
import 'package:state_management/core/base/baseview_model.dart';
import 'package:state_management/feature/home_page/viewmodel/makeupmodel.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var we = MediaQuery.of(context).size.width;
    var he = MediaQuery.of(context).size.height;
    return BaseView<MakeUpViewModel>(
        viewModel: MakeUpViewModel(),
        onModelReady: (model) {
          model.setContext(context);
          model.init();
        },
        onPageBuilder: (BuildContext context, MakeUpViewModel viewmodel) {
          return Scaffold(
            backgroundColor: const Color(0xFFC2C2C2),
            appBar: buildAppBar(),
            body: Observer(builder: (_) {
              return viewmodel.isLoading
                  ? GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithMaxCrossAxisExtent(
                        mainAxisSpacing: 10,
                        maxCrossAxisExtent: 300,
                        crossAxisSpacing: 10,
                      ),
                      itemCount: viewmodel.productList?.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Card(
                          color: Color(0XFFFAFAFA),
                          child: Column(
                            children: [
                              Expanded(
                                child: Image.network(
                                  viewmodel.productList?[index].imageLink ?? '',
                                ),
                              ),
                              Container(
                                child: Column(
                                  children: [
                                    Text(
                                      viewmodel.productList?[index].name ?? '',
                                      style:
                                          const TextStyle(color: Colors.black),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          const Text(
                                            " Rating :",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            viewmodel.productList?[index].rating
                                                    .toString() ??
                                                '',
                                            style: const TextStyle(
                                                color: Colors.black),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        const Text(
                                          " Price :",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          viewmodel.productList?[index].price ??
                                              '',
                                          style: const TextStyle(
                                              color: Colors.black),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      })
                  : const Center(
                      child: CircularProgressIndicator(),
                    );
            }),
          );
        });
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: const Color(0xFF181B2A),
      elevation: 0,
      actions: [
        Row(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  "Welcome Back",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 15,
                  ),
                ),
                Text(
                  "State Management",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
            Container(
              height: 50,
              width: 50,
              margin: const EdgeInsets.only(left: 100, right: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: const Color(0xFF272A3F),
              ),
              child: const Icon(
                Icons.person_outline,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

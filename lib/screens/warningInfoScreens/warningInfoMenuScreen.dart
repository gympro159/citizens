import 'package:citizens/utils/apiCaller.dart';
import 'package:citizens/widgets/appBar/appBar.dart';
import 'package:flutter/material.dart';
import '../../widgets/warningInfoMenu/shimmer.dart';
import '../../widgets/warningInfoMenu/warningInfoCard.dart';

class WarningInfoMenuScreen extends StatefulWidget {
  WarningInfoMenuScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _WarningInfoMenuScreenState createState() {
    print('createState');
    return _WarningInfoMenuScreenState();
  }
}

class _WarningInfoMenuScreenState extends State<WarningInfoMenuScreen>
    with TickerProviderStateMixin {
  bool _filter = false;
  List _listFilter = [];
  List warninginfo;
  List warninginfoRender;
  List type;

  Widget handleIcon() {
    return GestureDetector(
        child: Icon(Icons.filter_list,
            color: _filter == false ? Colors.white : Color(0xffe35709),
            size: 26),
        onTap: () {
          setState(() {
            _filter = !_filter;
            _listFilter = [];
            warninginfoRender = warninginfo;
          });
        });
  }

  @override
  void initState() {
    print('mounted: $mounted');
    print('initState');
    super.initState();
    callApi('warninginfo').then((value) => {
          setState(() {
            warninginfo = value;
            warninginfoRender = value;
          })
        });
    callApi('type').then((value2) => {
          setState(() {
            type = value2;
          })
        });
  }

  Future<dynamic> handleRefresh() {
    return callApi('warninginfo').then((value) => {
          setState(() {
            warninginfo = value;
            warninginfoRender = value;
            _listFilter = [];
          })
        });
  }

  @override
  void didChangeDependencies() {
    print('didDependencies');
    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(WarningInfoMenuScreen oldWidget) {
    print('didUpdateWidget');
    super.didUpdateWidget(oldWidget);
  }

  void deactivate() {
    print('deactivate');
    super.deactivate();
  }

  @override
  void dispose() {
    super.dispose();
    print('dispose');
  }

  @override
  Widget build(BuildContext context) {
    print('build');
    return Scaffold(
        appBar: GradientAppBar(title: widget.title, handleIcon: handleIcon()),
        body: Padding(
            padding: EdgeInsets.only(top: 10),
            child: warninginfoRender == null
                ? ShimmerLoading()
                : RefreshIndicator(
                    color: Color(0xff01A8A1),
                    onRefresh: handleRefresh,
                    child: Column(
                      children: [
                        AnimatedSize(
                            duration: Duration(milliseconds: 500),
                            curve: Curves.fastOutSlowIn,
                            vsync: this,
                            child: _filter
                                ? Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 30.0),
                                        child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Padding(
                                                padding: EdgeInsets.symmetric(
                                                    vertical: 8),
                                                child: Text('Chuyên mục',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 18)),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.symmetric(
                                                    vertical: 8),
                                                child: GestureDetector(
                                                  onTap: () {
                                                    var tempList = [];
                                                    for (Map<String,
                                                            dynamic> typeElm
                                                        in type) {
                                                      tempList.add(
                                                          typeElm["idType"]);
                                                    }
                                                    setState(() {
                                                      tempList.length ==
                                                              _listFilter.length
                                                          ? _listFilter = []
                                                          : _listFilter =
                                                              tempList;
                                                      warninginfoRender =
                                                          warninginfo;
                                                    });
                                                  },
                                                  child: Text('Chọn Tất cả',
                                                      style: TextStyle(
                                                          color:
                                                              Color(0xff0263F3),
                                                          fontSize: 18,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          decoration:
                                                              TextDecoration
                                                                  .underline)),
                                                ),
                                              )
                                            ]),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 18.0),
                                        child: SingleChildScrollView(
                                          scrollDirection: Axis.horizontal,
                                          child: Row(children: [
                                            for (Map<String, dynamic> typeElm
                                                in type)
                                              GestureDetector(
                                                onTap: () {
                                                  setState(() {
                                                    _listFilter.contains(
                                                            typeElm["idType"])
                                                        ? _listFilter.remove(
                                                            typeElm["idType"])
                                                        : _listFilter.add(
                                                            typeElm["idType"]);
                                                    var warninginfoTemp = [];
                                                    for (Map<String,
                                                            dynamic> elm
                                                        in warninginfo) {
                                                      if (_listFilter.length ==
                                                              0 ||
                                                          _listFilter.length ==
                                                              warninginfo
                                                                  .length) {
                                                        warninginfoTemp =
                                                            warninginfo;
                                                        break;
                                                      }
                                                      if (_listFilter.contains(
                                                          elm["type"]
                                                              ["idType"])) {
                                                        warninginfoTemp
                                                            .add(elm);
                                                      }
                                                    }
                                                    warninginfoRender =
                                                        warninginfoTemp;
                                                  });
                                                },
                                                child: Container(
                                                    margin: EdgeInsets.all(12),
                                                    padding: EdgeInsets.all(15),
                                                    decoration: BoxDecoration(
                                                        color: _listFilter
                                                                .contains(typeElm[
                                                                    "idType"])
                                                            ? Color(0xffFF833F)
                                                            : Colors.white,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        border: Border.all(
                                                            width: 0.3,
                                                            color: Color(
                                                                0xff595959))),
                                                    child: Center(
                                                        child: Text(
                                                      typeElm['nameType'],
                                                      style: TextStyle(
                                                          color: _listFilter
                                                                  .contains(typeElm[
                                                                      "idType"])
                                                              ? Colors.white
                                                              : Colors.black,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 20),
                                                    ))),
                                              ),
                                            SizedBox(width: 18)
                                          ]),
                                        ),
                                      ),
                                    ],
                                  )
                                : SizedBox()),
                        Expanded(
                          child: ListView.builder(
                              itemCount: warninginfoRender.length,
                              itemBuilder: (BuildContext context, int index) {
                                return AnimatedSize(
                                  duration: Duration(milliseconds: 500),
                                  curve: Curves.fastOutSlowIn,
                                  vsync: this,
                                  child: WarningInfoCard(
                                      warninginfoRender: warninginfoRender,
                                      index: index),
                                );
                              }),
                        ),
                      ],
                    ),
                  )));
  }
}

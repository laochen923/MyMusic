import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mymusic/common/app_color.dart';
import 'package:mymusic/common/constants.dart';
import 'package:mymusic/main/entity/search_suggest_entity.dart';
import 'package:mymusic/main/model/model_search.dart';
import 'package:mymusic/main/view/view_search.dart';
import 'package:mymusic/provider/search_provider.dart';
import 'package:mymusic/r.dart';
import 'package:mymusic/router/routers.dart';
import 'package:mymusic/widgets/play_widget.dart';
import 'package:provider/provider.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage>
    with SearchView, AutomaticKeepAliveClientMixin {
  TextEditingController _searchController = new TextEditingController();
  bool showClear = false;
  List<SearchSuggest> allMatch;
  String oldKeywords;
  bool showSuggest = false;

  @override
  void initState() {
    SearchModel.getSearchDefault(context);
    SearchModel.getSearchHotDetail(context);
    _searchController.addListener(() {
      if (_searchController.text.isNotEmpty) {
        showClear = true;
        if (oldKeywords != _searchController.text) {
          oldKeywords = _searchController.text;
          Provider.of<Search>(context, listen: false).searchKey =
              _searchController.text;
          Future.delayed(Duration(milliseconds: 500), () {
            SearchModel.getSearchSuggest(_searchController.text, this);
          });
        }
      } else {
        showClear = false;
        showSuggest = false;
      }
      setState(() {});
    });

    super.initState();
  }

  @override
  void dispose() {
    _searchController.dispose();
    showSuggest = false;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(
        builder: (BuildContext context, Search search, Widget child) {
      return Material(
        child: InkWell(
          onTap: () {
            showSuggest = false;
            setState(() {});
          },
          child: Scaffold(
              appBar: AppBar(
                title: Stack(
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        border: new Border(
                            bottom:
                                BorderSide(color: Colors.white, width: 0.5)),
                      ),
                      child: RawKeyboardListener(
                        focusNode: FocusNode(),
                        onKey: (RawKeyEvent event) {
                          try{
                            if (Platform.isAndroid) {
                              RawKeyDownEvent rawKeyDownEvent = event;
                              RawKeyEventDataAndroid rawKeyEventDataAndroid =
                                  rawKeyDownEvent.data;
                              if (rawKeyEventDataAndroid.keyCode == 84) {
                                search.searchKey = _searchController.text;
                                SearchModel.search(_searchController.text, context,
                                    0, Constants.SEARCH_TYPE_INCLUSIVE);
                                Routers.navigateTo(
                                    context, Routers.searchResultPage,
                                    transitionBuilder: (
                                        BuildContext context,
                                        Animation<double> animation,
                                        Animation<double> secondaryAnimation,
                                        Widget child,
                                        ) {
                                      return Routers.createSlideTransition(
                                          animation, child);
                                    });
                              }
                            }
                          } catch(e){

                          }

                        },
                        child: new TextField(
                            controller: _searchController,
                            cursorColor: Colors.white,
                            style:
                                TextStyle(color: Colors.white, fontSize: 32.sp),
                            decoration: InputDecoration(
                              focusColor: Colors.white,
                              hintText: search.defaultKey,
                              hintStyle: TextStyle(color: Colors.white60),
                              border: InputBorder.none,
                            )),
                      ),
                    ),
                    Visibility(
                      visible: showClear,
                      child: Container(
                        margin: EdgeInsets.only(top: 30.h),
                        alignment: Alignment.bottomRight,
                        child: InkWell(
                            onTap: () {
                              _searchController.clear();
                            },
                            child: Icon(
                              Icons.clear,
                              color: Colors.white,
                            )),
                      ),
                    ),
                  ],
                ),
                actions: <Widget>[
                  IconButton(
                      icon: new ImageIcon(
                        AssetImage(R.assetsImgIcSearchSinger),
                        color: Colors.white,
                      ),
                      onPressed: () {
                        //搜索框逻辑
                      })
                ],
              ),
              body: Stack(
                children: <Widget>[
                  SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Visibility(
                          visible: search.showHistory,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(
                                  margin:
                                      EdgeInsets.only(left: 20.w, top: 20.h),
                                  child: Text(
                                    "历史记录",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  )),
                              Container(
                                  margin: EdgeInsets.only(top: 20.h),
                                  child: IconButton(
                                      icon: Icon(Icons.delete,
                                          color: Colors.black45),
                                      onPressed: () {
                                        search.removeSearchHistory();
                                      }))
                            ],
                          ),
                        ),
                        Visibility(
                            visible: search.showHistory,
                            child: Container(
                              margin: EdgeInsets.only(left: 20.w),
                              child: Wrap(
                                spacing: 8.0, // 主轴(水平)方向间距
                                runSpacing: 4.0, // 纵轴（垂直）方向间距
                                alignment: WrapAlignment.start, //沿主轴方向居中
                                children: search.searchHistory == null
                                    ? Text("")
                                    : search.searchHistory.map((String value) {
                                        return new InkWell(
                                            onTap: () {
                                              showSuggest = false;
                                              setState(() {});
                                              oldKeywords = value;
                                              _searchController.text = value;
                                              search.searchKey =
                                                  _searchController.text;
                                              SearchModel.search(
                                                  value,
                                                  context,
                                                  0,
                                                  Constants
                                                      .SEARCH_TYPE_INCLUSIVE);
                                              Routers.navigateTo(context,
                                                  Routers.searchResultPage,
                                                  transitionBuilder: (
                                                BuildContext context,
                                                Animation<double> animation,
                                                Animation<double>
                                                    secondaryAnimation,
                                                Widget child,
                                              ) {
                                                return Routers
                                                    .createSlideTransition(
                                                        animation, child);
                                              });
                                            },
                                            child: Chip(
                                              label: new Text(value),
                                            ));
                                      }).toList(),
                              ),
                            )),
                        Container(
                          margin: EdgeInsets.only(left: 20.w, top: 30.h),
                          child: Text(
                            "热搜榜",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          child: ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              physics: new NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: () {
                                    search.addSearchHistory(
                                        search.hotSearch[index].searchWord);
                                    showSuggest = false;
                                    setState(() {});
                                    oldKeywords =
                                        search.hotSearch[index].searchWord;
                                    _searchController.text =
                                        search.hotSearch[index].searchWord;
                                    search.searchKey = _searchController.text;
                                    SearchModel.search(
                                        _searchController.text,
                                        context,
                                        0,
                                        Constants.SEARCH_TYPE_INCLUSIVE);
                                    Routers.navigateTo(
                                        context, Routers.searchResultPage,
                                        transitionBuilder: (
                                      BuildContext context,
                                      Animation<double> animation,
                                      Animation<double> secondaryAnimation,
                                      Widget child,
                                    ) {
                                      return Routers.createSlideTransition(
                                          animation, child);
                                    });
                                  },
                                  child: Row(
                                    children: <Widget>[
                                      Container(
                                        height: 120.h,
                                        width: 100.w,
                                        alignment: Alignment.center,
                                        child: Text("${index + 1}",
                                            style: TextStyle(
                                                color: index < 3
                                                    ? AppColors.color_main
                                                    : Colors.black45,
                                                fontSize: 36.sp)),
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Container(
                                            width: 450.w,
                                            child: Text(
                                              "${search.hotSearch[index].searchWord}",
                                              style: TextStyle(
                                                  color: index < 3
                                                      ? Colors.black
                                                      : Colors.black45,
                                                  fontWeight: index < 3
                                                      ? FontWeight.bold
                                                      : FontWeight.normal),
                                              textAlign: TextAlign.start,
                                            ),
                                          ),
                                          Container(
                                            width: 450.w,
                                            margin: EdgeInsets.only(top: 5.h),
                                            child: Text(
                                              "${search.hotSearch[index].content}",
                                              style: TextStyle(
                                                  color: index < 3
                                                      ? Colors.black
                                                      : Colors.black45),
                                              textAlign: TextAlign.start,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          )
                                        ],
                                      ),
                                      Align(
                                        child: Container(
                                          width: 150.w,
                                          height: 92.h,
                                          alignment: Alignment.topRight,
                                          child: Text(
                                              "${search.hotSearch[index].score}",
                                              style: TextStyle(
                                                  color: index < 3
                                                      ? AppColors.color_main
                                                      : Colors.black45,
                                                  fontSize: 24.sp),
                                              textAlign: TextAlign.end),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                              itemCount: search.hotSearch == null
                                  ? 0
                                  : search.hotSearch.length),
                        )
                      ],
                    ),
                  ),
                  Visibility(
                    visible: showSuggest,
                    child: Container(
                      color: Colors.white,
                      width: 450.w,
                      margin: EdgeInsets.only(left: 140.w),
                      child: Material(
                        elevation: 2,
                        child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  _searchController.text =
                                      allMatch[index].keyword;
                                  search.searchKey = _searchController.text;
                                  SearchModel.search(allMatch[index].keyword,
                                      context, 0, Constants.SEARCH_TYPE_INCLUSIVE);
                                  showSuggest = false;
                                  setState(() {});
                                  Routers.navigateTo(
                                      context, Routers.searchResultPage,
                                      transitionBuilder: (
                                    BuildContext context,
                                    Animation<double> animation,
                                    Animation<double> secondaryAnimation,
                                    Widget child,
                                  ) {
                                    return Routers.createSlideTransition(
                                        animation, child);
                                  });
                                },
                                child: (Column(
                                  children: <Widget>[
                                    Row(
                                      children: <Widget>[
                                        Container(
                                          margin: EdgeInsets.only(left: 15.w),
                                        ),
                                        index != 0
                                            ? Container(
                                                height: 60.h,
                                                child: Icon(Icons.search,
                                                    color:
                                                        Colors.lightBlueAccent),
                                              )
                                            : Text(""),
                                        Container(
                                          height: 70.h,
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            "${index == 0 ? "搜索" + allMatch[index].keyword : allMatch[index].keyword}",
                                            style: TextStyle(
                                                color: Colors.lightBlueAccent),
                                          ),
                                        )
                                      ],
                                    ),
                                    Divider(height: 1.h, color: Colors.black12),
                                  ],
                                )),
                              );
                            },
                            itemCount: allMatch == null ? 0 : allMatch.length),
                      ),
                    ),
                  )
                ],
              ),
              bottomNavigationBar: PlayWidget()),
        ),
      );
    });
  }

  @override
  void updateSearchSuggest(List<SearchSuggest> allMatch) {
    if (allMatch != null) {
      this.allMatch = allMatch;
      SearchSuggest searchSuggest = new SearchSuggest();
      searchSuggest.keyword = _searchController.text;
      allMatch.insert(0, searchSuggest);
      showSuggest = true;
      setState(() {});
    }
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}

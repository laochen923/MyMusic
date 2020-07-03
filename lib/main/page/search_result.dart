import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mymusic/common/app_color.dart';
import 'package:mymusic/common/constants.dart';
import 'package:mymusic/main/entity/search_suggest_entity.dart';
import 'package:mymusic/main/model/model_search.dart';
import 'package:mymusic/main/page/page_search_result_album.dart';
import 'package:mymusic/main/page/page_search_result_inclusive.dart';
import 'package:mymusic/main/page/page_search_result_singer.dart';
import 'package:mymusic/main/page/page_search_result_single.dart';
import 'package:mymusic/main/page/page_search_result_song_list.dart';
import 'package:mymusic/main/page/page_search_result_video.dart';
import 'package:mymusic/main/view/view_search.dart';
import 'package:mymusic/provider/search_provider.dart';
import 'package:mymusic/r.dart';
import 'package:mymusic/widgets/app_tabs.dart';
import 'package:mymusic/widgets/app_underlinetabindicator.dart';
import 'package:mymusic/widgets/fixtabbarview.dart';
import 'package:mymusic/widgets/play_widget.dart';
import 'page_search_result_singer.dart';
import 'package:provider/provider.dart';

class SearchResultPage extends StatefulWidget {
  @override
  _SearchResultPageState createState() => _SearchResultPageState();
}

class _SearchResultPageState extends State<SearchResultPage>
    with SearchView, AutomaticKeepAliveClientMixin,SingleTickerProviderStateMixin{
  TextEditingController _searchController;
  bool showClear = false;
  List<SearchSuggest> allMatch;
  String oldKeywords;
  bool showSuggest = false;
  TabController _tabController;
  PageController _pageController;
  int _selectedIndex = 0;
  List<Widget> pages = new List();

  @override
  void initState() {
    SearchModel.getSearchDefault(context);
    _searchController = new TextEditingController(text: Provider.of<Search>(context,listen: false).searchKey);
    _searchController.addListener(() {
      if (_searchController.text.isNotEmpty) {
        showClear = true;
        if (oldKeywords != _searchController.text) {
          oldKeywords = _searchController.text;
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
    pages.add(InclusivePage());
    pages.add(SinglePage());
    pages.add(VideoPage());
    pages.add(SingerPage());
    pages.add(AlbumPage());
    pages.add(SongListPage());
    _pageController = new PageController();
    /*_pageController.addListener(() {
      print("${_selectedIndex}");

    });*/


    _tabController = TabController(length: 6, vsync: this);
    _tabController.addListener(() {
      if(_tabController.index!=_selectedIndex){
        _selectedIndex = _tabController.index;
        searchData(_selectedIndex, Provider.of<Search>(context,listen: false).searchKey);
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
                elevation: 0,
                title: Stack(
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        border: new Border(
                            bottom: BorderSide(color: Colors.white, width: 0.5)),
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
                                SearchModel.search(_searchController.text, context,0,Constants.SEARCH_TYPE_INCLUSIVE);
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
                  Scaffold(
                    appBar: PreferredSize(
                        child: AppBar(
                          automaticallyImplyLeading:false,
                          titleSpacing: 0,
                          elevation: 0,
                          backgroundColor: AppColors.color_main,
                          title: TabBar(
                            onTap: (index) {
                              print("${index}");
                              _selectedIndex=index;
                              searchData(index, search.searchKey);
                              _pageController.jumpToPage(index);
                            },
                            labelPadding: EdgeInsets.all(0),
                            controller: _tabController,
                            indicator: AppUnderlineTabIndicator(
                                insets: EdgeInsets.only(bottom: 0),
                                mWidth: 100.w,
                                borderSide: BorderSide(width: 2.0, color: Colors.white)),
                            tabs: <Widget>[
                              AppTab(
                                  tabHeight: 69.h,
                                  child: Container(
                                    margin: EdgeInsets.only(left: 20.w,right: 20.w),
                                    child: Text("综合",
                                        maxLines: 1, style: TextStyle(fontSize: 28.sp)),
                                  )),
                              AppTab(
                                  tabHeight: 69.h,
                                  child: Container(
                                    margin: EdgeInsets.only(left: 20.w,right: 20.w),
                                    child: Text("单曲",
                                        maxLines: 1, style: TextStyle(fontSize: 28.sp)),
                                  )),
                              AppTab(
                                  tabHeight: 69.h,
                                  child: Container(
                                    margin: EdgeInsets.only(left: 20.w,right: 20.w),
                                    child: Text("视频",
                                        maxLines: 1, style: TextStyle(fontSize: 28.sp)),
                                  )),
                              AppTab(
                                  tabHeight: 69.h,
                                  child: Container(
                                    margin: EdgeInsets.only(left: 20.w,right: 20.w),
                                    child: Text("歌手",
                                        maxLines: 1, style: TextStyle(fontSize: 28.sp)),
                                  )),
                              AppTab(
                                  tabHeight: 69.h,
                                  child: Container(
                                    margin: EdgeInsets.only(left: 20.w,right: 20.w),
                                    child: Text("专辑",
                                        maxLines: 1, style: TextStyle(fontSize: 28.sp)),
                                  )),
                              AppTab(
                                  tabHeight: 69.h,
                                  child: Container(
                                    margin: EdgeInsets.only(left: 20.w,right: 20.w),
                                    child: Text("歌单",
                                        maxLines: 1, style: TextStyle(fontSize: 28.sp)),
                                  )),
                            ],
                          ),
                        ),
                        preferredSize: Size.fromHeight(70.h)),
                    body: FixTabBarView(
                        pageController: _pageController,
                        tabController: _tabController,
                        children: <Widget>[pages[0], pages[1], pages[2], pages[3],pages[4],pages[5]]),
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
                                  SearchModel.search(
                                      allMatch[index].keyword, context,0,Constants.SEARCH_TYPE_INCLUSIVE);
                                  showSuggest = false;
                                  setState(() {});
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

  void searchData(int index, String searchKey) {
    switch(index){
      case 0:
        SearchModel.search(searchKey, context, 0, Constants.SEARCH_TYPE_INCLUSIVE);
        break;
      case 1:
        SearchModel.search(searchKey, context, 0, Constants.SEARCH_TYPE_SINGLE);
        break;
      case 2:
        SearchModel.search(searchKey, context, 0, Constants.SEARCH_TYPE_VIDEO);
        break;
      case 3:
        SearchModel.search(searchKey, context, 0, Constants.SEARCH_TYPE_SINGER);
        break;
      case 4:
        SearchModel.search(searchKey, context, 0, Constants.SEARCH_TYPE_ALBUM);
        break;
      case 5:
        SearchModel.search(searchKey, context, 0, Constants.SEARCH_TYPE_SONG_LIST);
        break;
    }
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

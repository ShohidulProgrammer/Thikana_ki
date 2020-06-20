import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:thikana_ki/UI/commonWidget/text_field/custom_text_input_field.dart';
import 'package:thikana_ki/cores/utils/keyboard_input/clear_text_field.dart';

import '../../../UI/widgets/category/app_category_item.dart';
import '../../../cores/api/local_file_api.dart';
import '../../../cores/configs/router/router_path_constants.dart';
import '../../../cores/models/import_model.dart';
import '../../../cores/models/screen_models/category_page_model.dart';
import '../../../cores/utils/language/translate.dart';
import '../category/emergency_category_list_tile_item.dart';

class EmergencyCategoryListFactory extends StatefulWidget {
  EmergencyCategoryListFactory({Key key, this.emergencyCategoryTitle})
      : super(key: key);
  final String emergencyCategoryTitle;

  @override
  _EmergencyCategoryListFactoryState createState() {
    return _EmergencyCategoryListFactoryState();
  }
}

class _EmergencyCategoryListFactoryState
    extends State<EmergencyCategoryListFactory> {
  final _controller = RefreshController(initialRefresh: false);
  final _textController = TextEditingController();

  CategoryPageModel _categoryPage;
  List<CategoryModel> _category;

  @override
  void initState() {
    _loadData();
    super.initState();
  }

  ///On clear search
  Future<void> _onClearTapped() async {
    clearTextField(_textController);
    _onSearch('');
  }

  ///Fetch API
  Future<void> _loadData() async {
    final ResultApiModel result = await LocalFileApi.getCategory();
    if (result.success) {
      setState(() {
        _categoryPage = CategoryPageModel.fromJson(result.data);
        _category = _categoryPage.category;
      });
    }
  }

  ///On refresh list
  Future<void> _onRefresh() async {
    await Future.delayed(Duration(seconds: 1));
    _controller.refreshCompleted();
  }

  ///On navigate list product
  void _onProductList(CategoryModel item) {
    Navigator.pushNamed(
      context,
      listProductPageRoute,
      arguments: item.title,
    );
  }

  ///On Search Category
  void _onSearch(String text) {
    if (text.isNotEmpty) {
      setState(() {
        _category = _category.where(((item) {
          return item.title.toUpperCase().contains(text.toUpperCase());
        })).toList();
      });
    } else {
      setState(() {
        _category = _categoryPage.category;
      });
    }
  }

  ///Build UI list
  Widget _buildList() {
    if (_category == null) {
      return ListView.builder(
        padding: EdgeInsets.only(
          left: 20,
          right: 20,
        ),
        itemCount: List.generate(8, (index) => index).length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(bottom: 15),
            child: AppCategoryItem(),
          );
        },
      );
    }
//
    if (_category.isEmpty) {
      return Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(Icons.sentiment_satisfied),
            Padding(
              padding: EdgeInsets.all(3.0),
              child: Text(
//                  widget.popularTitle,
                Translate.of(context).translate('category_not_found'),
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ),
          ],
        ),
      );
    }

    return ListView.separated(
      separatorBuilder: (context, index) => Divider(
        indent: 20,
        endIndent: 15,
//        color: Colors.black,
      ),
      itemCount: _category.length ?? 10,
      itemBuilder: (context, index) {
        // final item = _category[index];
        return Padding(
          padding: EdgeInsets.only(left: 10, right: 10, bottom: 15),
          child: EmergencyCategoryListTileIem(
            title: "Emergency Toilet",
            subTitle: "Red Service",
            mobileNo: "019447",
//            onPressed: (item) {
//              _onProductList(item);
//            },
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(Translate.of(context).translate('category')),
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(
                left: 20,
                right: 20,
                top: 15,
                bottom: 15,
              ),
              child: CustomTextInputField(
                hintText: Translate.of(context).translate('search'),
                onTapSuffixIcon: _onClearTapped,
                suffixIcon: Icon(Icons.clear),
                controller: _textController,
                onSubmitted: _onSearch,
                onChanged: _onSearch,
              ),
            ),
            Expanded(
              child: SmartRefresher(
                enablePullDown: true,
                enablePullUp: false,
                onRefresh: _onRefresh,
                controller: _controller,
                header: ClassicHeader(
                  idleText:
                      Translate.of(context).translate('pull_down_refresh'),
                  refreshingText: Translate.of(context).translate('refreshing'),
                  completeText:
                      Translate.of(context).translate('refresh_completed'),
                  releaseText:
                      Translate.of(context).translate('release_to_refresh'),
                  refreshingIcon: SizedBox(
                    width: 16.0,
                    height: 16.0,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  ),
                ),
                child: _buildList(),
              ),
            )
          ],
        ),
      ),
    );
  }
}

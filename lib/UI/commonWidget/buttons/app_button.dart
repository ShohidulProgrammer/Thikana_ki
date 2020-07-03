import 'package:flutter/material.dart';
import 'package:thikana_ki/cores/utils/language/translate.dart';

class AppButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final bool loading;
  final bool disableTouchWhenLoading;

  AppButton({
    Key key,
    this.onPressed,
    this.text,
    this.loading = false,
    this.disableTouchWhenLoading = false,
  }) : super(key: key);

  Widget _buildLoading() {
    if (!loading) {
      return Container();
    }
    return Container(
      margin: EdgeInsets.only(left: 10, right: 10),
      width: 14,
      height: 14,
      child: CircularProgressIndicator(strokeWidth: 2),
    );
  }

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: disableTouchWhenLoading && loading ? null : onPressed,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            text,
            style: Theme.of(context).textTheme.button.copyWith(
                color: Colors.white,
                fontSize: 16.0,
                fontWeight: FontWeight.w600),
          ),
          _buildLoading()
        ],
      ),
    );
  }
}

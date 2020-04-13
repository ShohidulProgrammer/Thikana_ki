import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShopContactAddressShimmer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Theme.of(context).hoverColor,
      highlightColor: Theme.of(context).highlightColor,
      enabled: true,
      child: Padding(
        padding: EdgeInsets.only(left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(
                bottom: 20,
                top: 20,
              ),
              height: 10,
              width: 150,
              color: Colors.white,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    _buildContainer(width: 100),
                    _buildPadding(top: 5),
                    _buildContainer(height: 20, width: 150),
                  ],
                ),
                _buildContainer(width: 100),
              ],
            ),
            _buildPadding(top: 20),
            Row(
              children: <Widget>[
                Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      _buildContainer(width: 100),
                      _buildPadding(top: 3),
                      _buildContainer(width: 200),
                    ],
                  ),
                )
              ],
            ),
            _buildPadding(top: 20),
            Row(
              children: <Widget>[
                Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      _buildContainer(width: 100),
                      _buildPadding(top: 3),
                      _buildContainer(width: 200),
                    ],
                  ),
                )
              ],
            ),
            _buildPadding(top: 20),
            Row(
              children: <Widget>[
                Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      _buildContainer(width: 100),
                      _buildPadding(top: 3),
                      _buildContainer(width: 200),
                    ],
                  ),
                )
              ],
            ),
            _buildPadding(top: 20),
            Row(
              children: <Widget>[
                Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      _buildContainer(width: 100),
                      _buildPadding(top: 3),
                      _buildContainer(width: 200),

                    ],
                  ),
                )
              ],
            ),
            _buildPadding(top: 20),

            Row(
              children: <Widget>[
                Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      _buildContainer(width: 100),
                      _buildPadding(top: 3),
                      _buildContainer(width: 200),
                    ],
                  ),
                )
              ],
            ),
            _buildPadding(top: 25, child: _buildContainer()),
            _buildPadding(child: _buildContainer()),
            _buildPadding(child: _buildContainer()),
            _buildPadding(child: _buildContainer()),
            _buildPadding(child: _buildContainer()),
            _buildPadding(child: _buildContainer()),
            _buildPadding(child: _buildContainer(width: 50)),
          ],
        ),
      ),
    );
  }

  Widget _buildPadding({double top: 5, Widget child}) {
    return Padding(
      padding: EdgeInsets.only(top: top),
      child: child,
    );
  }

  Widget _buildContainer({double height: 10, double width}) {
    return Container(height: height, width: width, color: Colors.white);
  }
}

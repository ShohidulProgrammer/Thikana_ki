import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:thikana_ki/UI/commonWidget/buttons/app_button.dart';
import 'package:thikana_ki/UI/commonWidget/dialog/dialog_utils.dart';
import 'package:thikana_ki/UI/screens/shop/widget_list/video_url_list.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import 'shop_text_form_field.dart';

/// Creates list of video players
class VideoList extends StatefulWidget {
  @override
  _VideoListState createState() => _VideoListState();
}

class _VideoListState extends State<VideoList> {
//  final List<YoutubePlayerController> _controllers = [
//    'zAQobDr17ug',
//    '0H25pV4vvJs',
//    'x8R5ReR9A1E',
//    '1n5CcRBdUf8',
//    'x8R5ReR9A1E',
//    'OscMyxCioZ8',
//    'EnRhAvlb9a4',
//    'oUb2UluKw7Q',
//    '2w0EwNSpp68',
//    'aIykbOVvdhI',
//    'BOBxcX2Hwns',
//    'VtJM8CIZJo4',
//    '1zjasCaqYJs',
//    'y0eUjXA_s2M&list=RD1zjasCaqYJs&index=12',
//    'pyaf1vR0nm0',
//    'zAQobDr17ug',
//    '0H25pV4vvJs',
//    'x8R5ReR9A1E',
//    '1n5CcRBdUf8',
//    '8cOi04y7LKY',
//  ]

  final List<YoutubePlayerController> _controllers = videoUrls
      .map<YoutubePlayerController>(
        (videoId) => YoutubePlayerController(
          initialVideoId: videoId,
          flags: YoutubePlayerFlags(
            autoPlay: false,
          ),
        ),
      )
      .toList();

  bool isEditor = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 5.0,
          ),
          isEditor
              ? Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: AppButton(
                    text: 'Add New Video',
                    onPressed: () {
                      addVideo();
                    },
                    disableTouchWhenLoading: true,
                  ),
                )
              : Container(
                  color: Colors.purpleAccent,
                ),
          Expanded(
            child: ListView.separated(
              padding: EdgeInsets.only(
                  top: 8.0, bottom: 180.0, left: 2.0, right: 2.0),
              itemBuilder: (context, index) {
                return YoutubePlayer(
                  key: ObjectKey(_controllers[index]),
                  controller: _controllers[index],
                  actionsPadding: EdgeInsets.only(left: 16.0),
                  bottomActions: [
                    CurrentPosition(),
                    SizedBox(width: 10.0),
                    ProgressBar(
                      isExpanded: true,
                      colors: ProgressBarColors(
                        playedColor: Colors.red,
                        handleColor: Colors.red,
                        bufferedColor: Colors.white,
//                backgroundColor: Colors.yellow,
                      ),
                    ),
                    SizedBox(width: 10.0),
                    RemainingDuration(),
                    SizedBox(width: 10.0),
                    PlaybackSpeedButton(),
                    SizedBox(width: 10.0),
//                     IconButton(
//                       icon: Icon(
//                         _rotation == 0 ? Icons.fullscreen : Icons.fullscreen_exit,
//                         color: Colors.white,
//                       ),
//                       onPressed: () async {
//                        _controllers[index].pause();
//                         if (_rotation == 0) {
//                           setState(() {
//                             _rotation = 1;
//                           });
//                         } else {
//                           setState(() {
//                             _rotation = 0;
//                           });
//                         }
//                       },
//                     ),
//                     InkWell(
//                       onTap: () => _controllers[index].pause(),
//                       child: FullScreenButton(
//                         controller: _controllers[index],
//                       ),
//                     ),
                  ],
//            onReady: () {
//              _isPlayerReady = true;
//            },
                );
              },
              itemCount: _controllers.length,
              separatorBuilder: (context, _) => SizedBox(height: 10.0),
            ),
          ),
        ],
      ),
    );
  }

  void addVideo() {
    DialogUtils.showCustomDialog(context,
        title: "New Video",
        okBtnText: "Add",
        cancelBtnText: "Cancel",
        child: shopTextFormField(labelText: "Youtube link"),
        /* call method in which you have write your logic and save process  */
        okBtnFunction: () => {});
  }
}

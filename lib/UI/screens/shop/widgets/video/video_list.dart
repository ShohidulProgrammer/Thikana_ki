import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:thikana_ki/UI/commonWidget/buttons/app_button.dart';
import 'package:thikana_ki/UI/commonWidget/dialog/dialog_utils.dart';
import 'package:thikana_ki/UI/screens/shop/widget_list/video_url_list.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../../../commonWidget/keyboard_input/normal_text_form_field.dart';
import 'total_duration.dart';

/// Creates list of video players
class VideoList extends StatefulWidget {
  @override
  _VideoListState createState() => _VideoListState();
}

class _VideoListState extends State<VideoList> {
  List<YoutubePlayerController> _controllers;

  loadVideo() {
    _controllers = videoUrls
        .map<YoutubePlayerController>(
          (videoId) => YoutubePlayerController(
            initialVideoId: videoId,
            flags: YoutubePlayerFlags(
              autoPlay: false,
            ),
          ),
        )
        .toList();
  }

  bool isEditor = true;
  bool isPlaying = false;
  int _rotation;

  @override
  void initState() {
    _rotation = 0;
    loadVideo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (_controllers == null) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }
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
            child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
              itemBuilder: (context, index) {
                return Container(
                  padding: EdgeInsets.symmetric(
                    vertical: 5.0,
                  ),
                  child: Card(
                    elevation: 10,
                    child: YoutubePlayer(
                      key: ObjectKey(_controllers[index]),
                      controller: _controllers[index],
                      actionsPadding: EdgeInsets.only(left: 16.0),
                      bottomActions: [
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
                        CurrentPosition(),
                        SizedBox(width: 10.0),
                        TotalDuration(),
                        SizedBox(width: 10.0),
                        SizedBox(width: 10.0),
                        PlaybackSpeedButton(),
                        SizedBox(width: 10.0),
                        InkWell(
                          onTap: () => _controllers[index].pause(),
                          child: FullScreenButton(
                            controller: _controllers[index],
                          ),
                        ),
                      ],
//                      onReady: () {
//                        _isPlayerReady = true;
//                      },
                    ),
                  ),
                );
              },
              itemCount: _controllers.length,
//              separatorBuilder: (context, _) => Divider(
//                indent: 8,
//                endIndent: 8,
//                thickness: 1.0,
//                color: Colors.blueGrey[100],
//              ),
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
        child: normalTextFormField(labelText: "Youtube link"),
        /* call method in which you have write your logic and save process  */
        okBtnFunction: () => {});
  }
}

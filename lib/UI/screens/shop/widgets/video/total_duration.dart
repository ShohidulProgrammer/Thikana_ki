
import 'package:flutter/material.dart';
import 'package:thikana_ki/UI/commonWidget/clock/duration_formatter.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

/// A widget which displays the remaining duration of the video.
class TotalDuration extends StatefulWidget {
  /// Overrides the default [YoutubePlayerController].
  final YoutubePlayerController controller;

  /// Creates [TotalDuration] widget.
  TotalDuration({this.controller});

  @override
  _TotalDurationState createState() => _TotalDurationState();
}

class _TotalDurationState extends State<TotalDuration> {
  YoutubePlayerController _controller;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _controller = YoutubePlayerController.of(context);
    if (_controller == null) {
      assert(
      widget.controller != null,
      '\n\nNo controller could be found in the provided context.\n\n'
          'Try passing the controller explicitly.',
      );
      _controller = widget.controller;
    }
    _controller.removeListener(listener);
    _controller.addListener(listener);
  }

  @override
  void dispose() {
    _controller.removeListener(listener);
    super.dispose();
  }

  void listener() {
    if (mounted) setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      "/${durationFormatter(
          _controller.metadata.duration?.inMilliseconds ?? 0
      )}",
      style: TextStyle(
        color: Colors.white,
        fontSize: 12.0,
      ),
    );
  }
}



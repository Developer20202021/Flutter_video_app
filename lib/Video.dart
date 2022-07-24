import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Video extends StatefulWidget {
  const Video({Key? key, required this.id}) : super(key: key);
  final String id;

  @override
  State<Video> createState() => _VideoState();
}

class _VideoState extends State<Video> {
  // @override
  // void initState() {

  //   _controller.load(id!);
  //   super.initState();
  // }

  
  @override
  Widget build(BuildContext context) {

    final YoutubePlayerController _controller = YoutubePlayerController(
    initialVideoId: widget.id,
    flags: const YoutubePlayerFlags(
      autoPlay: true,
      mute: false,
    ),
  );



    void initState() {
      setState(() {
        _controller.reload();
        _controller.load(widget.id);
      });
      print(widget.id);
      super.initState();
    }

    return Scaffold(
      appBar: AppBar(title: Text('kjdshkjhfksdhk')),
      body: Center(
        child: YoutubePlayer(
          controller: _controller,
          liveUIColor: Colors.amber,
          progressIndicatorColor: Colors.brown,
          
        ),
      ),
    );
  }
}

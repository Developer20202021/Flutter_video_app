import 'package:flutter/material.dart';
import 'package:video_app/Video.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Hide the debug banner
      debugShowCheckedModeBanner: false,

      title: 'Flutter Example',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // static String myVideoId = 'GLSG_Wh_YWc';

  // the full url: https://www.youtube.com/watch?v=PQSagzssvUQ&ab_channel=NASA
  final YoutubePlayerController _controller = YoutubePlayerController(
    initialVideoId: 'GLSG_Wh_YWc',
    flags: const YoutubePlayerFlags(
      autoPlay: true,
      mute: false,
    ),
  );

  var text;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  pressNow() {
    text = getController.text;
    setState(() {
      // myVideoId = YoutubePlayer.convertUrlToId(text).toString();
      // print(myVideoId);

      _controller.load(YoutubePlayer.convertUrlToId(text).toString());
    });
  }

  void dispose() {
    // Clean up the controller when the widget is removed from the
    // widget tree.
    getController.dispose();
    super.dispose();
  }

  var getController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Flutter and Youtube'),
        ),
        body: Column(
          children: [
            TextField(
              decoration: InputDecoration(labelText: "Give url"),
              controller: getController,
            ),
            InkWell(
              onTap: () {
                text = getController.text;
                setState(() {
                  // myVideoId = YoutubePlayer.convertUrlToId(text).toString();
                  // print(myVideoId);

                  _controller
                      .load(YoutubePlayer.convertUrlToId(text).toString());
                });

                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) =>
                  Video(id: YoutubePlayer.convertUrlToId(text).toString())
                  
                ));
              },
              child: Text("Search"),
            ),
            YoutubePlayer(
              controller: _controller,
              liveUIColor: Colors.amber,
              progressIndicatorColor: Colors.brown,
            )
          ],
        ));
  }
}









// class MyHomePage extends StatefulWidget {
//   const MyHomePage({Key? key, required this.title}) : super(key: key);

//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;

//   late VideoPlayerController _controller;

//   @override
//   void initState() {
//     _controller = VideoPlayerController.network(
//         "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4")
//       ..initialize().then((value) {
     
//         setState(() {});
//       });

//     super.initState();
//   }

//   void _incrementCounter() {
//     setState(() {
//       _counter++;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             _controller.value.isInitialized
//                 ? AspectRatio(
//                     aspectRatio: _controller.value.aspectRatio,
//                     child: VideoPlayer(_controller),
//                   )
//                 : Container(),
            
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           setState(() {
//             _controller.value.isPlaying
//                 ? _controller.pause()
//                 : _controller.play();
//           });
//         },
//         tooltip: 'Increment',
//         child:
//             Icon(_controller.value.isPlaying ? Icons.pause : Icons.play_arrow),
//       ), // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }

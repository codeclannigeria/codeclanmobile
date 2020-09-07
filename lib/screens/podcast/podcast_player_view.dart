import 'package:audio_service/audio_service.dart';
import 'package:codeclanmobile/screens/podcast/bloc/podcast_bloc.dart';
import 'package:codeclanmobile/screens/podcast/seek_bar.dart';
import 'package:codeclanmobile/services/audio/podcast_background_service.dart';
import 'package:codeclanmobile/utils/spaces.dart';
import 'package:codeclanmobile/values/values.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_media_notification/flutter_media_notification.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:just_audio/just_audio.dart';
import 'package:podcast_search/podcast_search.dart';

class PodcastPlayerView extends StatefulWidget {
  final Episode episode;

  const PodcastPlayerView({Key key, @required this.episode}) : super(key: key);
  @override
  _PodcastPlayerViewState createState() => _PodcastPlayerViewState();
}

class _PodcastPlayerViewState extends State<PodcastPlayerView> {
  AudioPlayer audioPlayer = AudioPlayer();
  bool isPlaying = false;
  String status = 'hidden';
  Duration position = Duration.zero;
  @override
  void initState() {
    audioPlayer.setUrl(widget.episode.contentUrl);
    super.initState();
    MediaNotification.setListener('pause', () {
      setState(() => status = 'pause');
    });

    MediaNotification.setListener('play', () {
      setState(() => status = 'play');
    });

    MediaNotification.setListener('next', () {});

    MediaNotification.setListener('prev', () {});

    MediaNotification.setListener('select', () {});
  }

  @override
  Widget build(BuildContext context) {
    var widthOfScreen = MediaQuery.of(context).size.width;
    var heightOfScreen = MediaQuery.of(context).size.height;
    return Scaffold(
        body: BlocProvider(
      create: (context) => PodcastBloc(),
      child: Stack(
        children: <Widget>[
          //Container for header
          Container(
            height: heightOfScreen,
            width: widthOfScreen,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    end: Alignment.bottomCenter,
                    begin: Alignment.topCenter,
                    stops: [
                  0,
                  0.7,
                  1.0
                ],
                    colors: [
                  AppColors.backgroundShade1,
                  AppColors.backgroundShade2,
                  AppColors.backgroundShade3,
                ])),
          ),
          //Container for playlist header
          BlocConsumer<PodcastBloc, PodcastState>(listener: (context, state) {
            if (state is PodcastPlaying) {
              setState(() {
                isPlaying = true;
              });
            }
            if (state is PodcastPaused) {
              setState(() {
                isPlaying = false;
              });
            }
          }, builder: (context, state) {
            return SafeArea(
                child: Container(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () => Navigator.of(context).pop(),
                    child: Icon(
                      FlutterIcons.arrow_left_sli,
                      color: Colors.white,
                    ),
                  ),
                  SpaceH12(),
                  SpaceH30(),
                  Container(
                    width: widthOfScreen,
                    height: heightOfScreen * 0.3,
                    child: Center(
                      child: Icon(
                        Feather.headphones,
                        color: AppColors.blackShade1,
                        size: 60,
                      ),
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        gradient: LinearGradient(
                            end: Alignment.bottomCenter,
                            begin: Alignment.topCenter,
                            colors: [
                              AppColors.alternateShade1,
                              AppColors.alternateShade3
                            ])),
                  ),
                  SpaceH30(),
                  Center(
                    child: Text('${widget.episode.title}',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                color: AppColors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w400))),
                  ),
                  Center(
                    child: Text('Episode ${widget.episode.episode}',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                color: AppColors.alternateShade3,
                                fontSize: 15,
                                fontWeight: FontWeight.w400))),
                  ),
                  SpaceH30(),
                  //       //Container for audio player
                  Center(
                    child: Container(
                      width: 300,
                      height: 80,
                      padding: EdgeInsets.only(left: 16, right: 16),
                      decoration: BoxDecoration(
                          color: AppColors.backgroundShade3.withOpacity(0.2),
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                          boxShadow: [
                            BoxShadow(
                                color: AppColors.backgroundShade1,
                                blurRadius: 10.0,
                                spreadRadius: 0.1)
                          ]),
                      child: StreamBuilder<PlayerState>(
                          stream: audioPlayer.playerStateStream,
                          builder: (context, snapshot) {
                            final playing = snapshot.data?.playing ?? false;
                            final processingState =
                                snapshot.data?.processingState ??
                                    AudioProcessingState.stopped;
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                IconButton(
                                  icon: Icon(
                                    Feather.skip_back,
                                    color: AppColors.greyShade1,
                                    size: 30,
                                  ),
                                ),
                                playing
                                    ? IconButton(
                                        onPressed: () => pause(),
                                        icon: Icon(
                                          Feather.pause,
                                          color: AppColors.greyShade1,
                                          size: 30,
                                        ),
                                      )
                                    : IconButton(
                                        onPressed: () => play(),
                                        icon: Icon(
                                          Feather.play,
                                          color: AppColors.greyShade1,
                                          size: 30,
                                        ),
                                      ),
                                IconButton(
                                  onPressed: () => stop(),
                                  icon: Icon(
                                    Feather.stop_circle,
                                    color: AppColors.greyShade1,
                                    size: 30,
                                  ),
                                ),
                                IconButton(
                                  onPressed: () => audioPlayer.seek(Duration(
                                      seconds: position.inSeconds + 10)),
                                  icon: Icon(
                                    Feather.skip_forward,
                                    color: AppColors.greyShade1,
                                    size: 30,
                                  ),
                                )
                              ],
                            );
                          }),
                    ),
                  ),
                  SpaceH30(),
                  StreamBuilder<Duration>(
                    stream: audioPlayer.durationStream,
                    builder: (context, snapshot) {
                      final duration = snapshot.data ?? Duration.zero;
                      return StreamBuilder<Duration>(
                        stream: audioPlayer.positionStream,
                        builder: (context, snapshot) {
                          var position = snapshot.data ?? Duration.zero;
                          if (position > duration) {
                            position = duration;
                          }
                          return SeekBar(
                            duration: duration,
                            position: position,
                            onChangeEnd: (newPosition) {
                              audioPlayer.seek(newPosition);
                            },
                          );
                        },
                      );
                    },
                  ),
                ],
              ),
            ));
          })
        ],
      ),
    ));
  }

  play() async {
    audioPlayer.play();
    MediaNotification.showNotification(
        title: widget.episode.title,
        isPlaying: true,
        author: 'Episode ${widget.episode.episode}');
  }

  pause() {
    audioPlayer.pause();
    MediaNotification.showNotification(
        title: widget.episode.title,
        author: 'Episode ${widget.episode.episode}',
        isPlaying: false);
  }

  stop() => audioPlayer.stop();
}

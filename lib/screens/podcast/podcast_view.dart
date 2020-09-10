import 'package:codeclanmobile/screens/podcast/podcast_item.dart';
import 'package:codeclanmobile/utils/spaces.dart';
import 'package:codeclanmobile/values/values.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import 'bloc/podcast_bloc.dart';

class PodcastView extends StatefulWidget {
  final PanelController pc;

  const PodcastView({Key key, this.pc}) : super(key: key);
  @override
  _PodcastViewState createState() => _PodcastViewState();
}

class _PodcastViewState extends State<PodcastView> {
  @override
  Widget build(BuildContext context) {
    var widthOfScreen = MediaQuery.of(context).size.width;
    var heightOfScreen = MediaQuery.of(context).size.height;
    return Scaffold(
      body: BlocProvider(
        create: (context) => PodcastBloc()..add(GetPodcast()),
        child: Container(
          height: heightOfScreen,
          width: widthOfScreen,
          child: Stack(
            children: <Widget>[
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
              Image.asset('assets/images/eclipse.png'),
              BlocConsumer<PodcastBloc, PodcastState>(
                listener: (context, state) {},
                builder: (context, state) {
                  return Container(
                    height: heightOfScreen,
                    width: widthOfScreen,
                    child: SafeArea(
                      child: Container(
                        padding: EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            RichText(
                              text: TextSpan(
                                  text: 'Listen to our ',
                                  style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                          color: AppColors.white,
                                          fontWeight: FontWeight.w200,
                                          fontSize: 18)),
                                  children: <TextSpan>[
                                    TextSpan(
                                        text: 'Podcast',
                                        style: GoogleFonts.poppins(
                                            textStyle: TextStyle(
                                                color: AppColors.white,
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold)))
                                  ]),
                            ),
                            SpaceH30(),
                            state is PodcastLoading
                                ? Center(
                                    child: CircularProgressIndicator(),
                                  )
                                : state is PodcastLoaded
                                    ? Expanded(
                                        child: Container(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                  '${state.podcast.description}',
                                                  overflow: TextOverflow.fade,
                                                  maxLines: 3,
                                                  style: GoogleFonts.poppins(
                                                      textStyle: TextStyle(
                                                          color:
                                                              AppColors.white,
                                                          fontSize: 12,
                                                          fontWeight: FontWeight
                                                              .w300))),
                                              SpaceH30(),
                                              Text(
                                                  '${state.podcast.episodes.length} Episodes',
                                                  overflow: TextOverflow.fade,
                                                  maxLines: 3,
                                                  style: GoogleFonts.poppins(
                                                      textStyle: TextStyle(
                                                          color:
                                                              AppColors.white,
                                                          fontSize: 15,
                                                          fontWeight: FontWeight
                                                              .w400))),
                                              Expanded(
                                                  child: ListView.separated(
                                                      itemBuilder: (_, index) {
                                                        return PodcastItem(
                                                          episode: state.podcast
                                                              .episodes[index],
                                                        );
                                                      },
                                                      separatorBuilder:
                                                          (_, __) {
                                                        return SpaceH4();
                                                      },
                                                      itemCount: state.podcast
                                                          .episodes.length)),
                                            ],
                                          ),
                                        ),
                                      )
                                    : Container()
                          ],
                        ),
                      ),
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:codeclanmobile/blocs/track_bloc.dart';
import 'package:codeclanmobile/utils/spaces.dart';
import 'package:codeclanmobile/values/values.dart';
import 'package:codeclanmobile/widgets/track_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:google_fonts/google_fonts.dart';

class TrackListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var widthOfScreen = MediaQuery.of(context).size.width;
    var heightOfScreen = MediaQuery.of(context).size.height;
    return BlocProvider(
      create: (BuildContext context) {
        return TracksBloc()..add(FetchAllTracks());
      },
      child: Scaffold(
        // appBar: AppBar(
        //     backgroundColor: Color(0XFFf4f5f9),
        //     elevation: 0,
        //     leading: InkWell(
        //       onTap: () => Navigator.of(context).pop(),
        //       child: Icon(
        //         FlutterIcons.arrow_left_sli,
        //         color: Colors.black,
        //       ),
        //     )),
        // backgroundColor: Color(0XFFf4f5f9),
        body: Stack(
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
                    Color(0xFF3E3F62),
                    Color(0xFF343555),
                    Color(0xFFAE74EC)
                  ])),
            ),
            Image.asset('assets/images/eclipse.png'),
            Container(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 40),
              height: heightOfScreen,
              width: widthOfScreen,
              child: SingleChildScrollView(
                key: PageStorageKey('tracklist-key'),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    InkWell(
                      onTap: () => Navigator.of(context).pop(),
                      child: Icon(
                        FlutterIcons.arrow_left_sli,
                        color: Colors.white,
                      ),
                    ),
                    SpaceH12(),
                    Text(
                      'What do you want to learn?',
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              color: AppColors.white,
                              fontWeight: FontWeight.w400,
                              fontSize: 18)),
                    ),
                    SpaceH20(),
                    BlocBuilder<TracksBloc, TracksState>(
                        builder: (BuildContext context, TracksState state) {
                      if (state is TracksLoading) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      if (state is TracksLoaded) {
                        return Container(
                          height: heightOfScreen,
                          width: widthOfScreen,
                          child: ListView.separated(
                            itemBuilder: (BuildContext context, int index) {
                              return TrackItem(item: state.tracks.items[index]);
                            },
                            itemCount: state.tracks.items.length,
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return SpaceH16();
                            },
                          ),
                        );
                      }
                      return Container();
                    })
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

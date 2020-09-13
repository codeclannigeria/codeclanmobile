import 'package:codeclanmobile/utils/spaces.dart';
import 'package:codeclanmobile/values/values.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:timeline_tile/timeline_tile.dart';

import 'bloc/stages_bloc.dart';

class StagesView extends StatelessWidget {
  final String trackId;

  const StagesView({Key key, @required this.trackId}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var widthOfScreen = MediaQuery.of(context).size.width;
    var heightOfScreen = MediaQuery.of(context).size.height;
    return Scaffold(
      body: BlocProvider(
        create: (context) =>
            StagesBloc()..add(GetTrackStages(trackId: trackId)),
        child: Stack(
          children: [
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
                      'My Stages',
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              color: AppColors.white,
                              fontWeight: FontWeight.w400,
                              fontSize: 18)),
                    ),
                    Text(
                      'See all the stages to complete your track',
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              color: AppColors.white,
                              fontWeight: FontWeight.w200,
                              fontSize: 12)),
                    ),
                    SpaceH20(),
                    BlocConsumer<StagesBloc, StagesState>(
                      listener: (context, state) {},
                      builder: (context, state) {
                        if (state is StagesLoading) {
                          return Center(child: CircularProgressIndicator());
                        }
                        if (state is StagesLoaded) {
                          return SingleChildScrollView(
                            child: Container(
                              height: heightOfScreen,
                              width: widthOfScreen,
                              child: ListView.builder(
                                  shrinkWrap: true,
                                  padding: EdgeInsets.zero,
                                  itemCount: state.stages.items.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    final stage = state.stages.items[index];
                                    return TimelineTile(
                                      alignment: TimelineAlign.manual,
                                      lineX: 0.1,
                                      isFirst: index == 0,
                                      isLast: index ==
                                          state.stages.items.length - 1,
                                      indicatorStyle: IndicatorStyle(
                                        width: 40,
                                        height: 40,
                                        indicator: _IndicatorExample(
                                            number: '${index + 1}'),
                                        drawGap: true,
                                      ),
                                      topLineStyle: LineStyle(
                                        color: Colors.white.withOpacity(0.2),
                                      ),
                                      rightChild: Padding(
                                        padding: const EdgeInsets.all(20),
                                        child: Row(
                                          children: <Widget>[
                                            Expanded(
                                                child: Text('${stage.title}',
                                                    style: GoogleFonts.poppins(
                                                        textStyle: TextStyle(
                                                            color:
                                                                AppColors.white,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontSize: 12)))),
                                            const Icon(
                                              Icons.navigate_next,
                                              color: Colors.white,
                                              size: 26,
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  }),
                            ),
                          );
                        }
                        return Container();
                      },
                    ),
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

class _IndicatorExample extends StatelessWidget {
  const _IndicatorExample({Key key, this.number}) : super(key: key);

  final String number;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.fromBorderSide(
          BorderSide(
            color: Colors.white.withOpacity(0.2),
            width: 4,
          ),
        ),
      ),
      child: Center(
        child: Text(
          number,
          style: const TextStyle(fontSize: 20, color: AppColors.white),
        ),
      ),
    );
  }
}

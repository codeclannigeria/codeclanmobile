import 'package:codeclanmobile/screens/podcast/podcast_player_view.dart';
import 'package:codeclanmobile/values/values.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:podcast_search/podcast_search.dart';
import 'package:timeago/timeago.dart' as timeago;

class PodcastItem extends StatelessWidget {
  final Episode episode;

  const PodcastItem({Key key, @required this.episode}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: AppColors.backgroundShade3.withOpacity(0.3),
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 10),
        onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => PodcastPlayerView(
                      episode: episode,
                    ))),
        leading: Container(
          width: 60,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              gradient: LinearGradient(
                  end: Alignment.bottomCenter,
                  begin: Alignment.topCenter,
                  colors: [
                    AppColors.alternateShade1,
                    AppColors.alternateShade3
                  ])),
          child: Center(
            child: Icon(Feather.headphones),
          ),
        ),
        //isThreeLine: true,
        subtitle: Text('${episode.title}',
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            style: GoogleFonts.poppins(
                textStyle: TextStyle(
                    color: AppColors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w300))),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('${timeUntil(episode.publicationDate)}',
                style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                        color: AppColors.alternateShade3,
                        fontSize: 12,
                        fontWeight: FontWeight.w300))),
            Text('${episode.duration.toString().substring(2, 7)} mins',
                style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                        color: AppColors.whiteShade1,
                        fontSize: 12,
                        fontWeight: FontWeight.w300))),
          ],
        ),
        trailing: Icon(
          Feather.chevron_right,
          color: AppColors.alternateShade2,
        ),
      ),
    );
  }
}

String timeUntil(DateTime date) {
  return timeago.format(date, locale: 'en', allowFromNow: true);
}

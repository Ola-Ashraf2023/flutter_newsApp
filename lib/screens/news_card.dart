import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news/models/NewsDataModel.dart';
import 'package:news/shared/styles/colors.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsCard extends StatefulWidget {
  Articles? articles;

  NewsCard(this.articles);

  @override
  State<NewsCard> createState() => _NewsCardState();
}

class _NewsCardState extends State<NewsCard> {
  bool showMore = false;

  @override
  Widget build(BuildContext context) {
    final Uri _url = Uri.parse(widget?.articles?.url ?? "");
    return Container(
      margin: EdgeInsets.symmetric(vertical: 6, horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          InkWell(
            onTap: () {
              showMore = !showMore;
              print("Length is ${widget.articles?.content?.length}");
              setState(() {});
            },
            child: CachedNetworkImage(
              imageUrl: widget.articles?.urlToImage ?? "",
              height: 180,
              fit: BoxFit.fill,
              placeholder: (context, url) {
                return Center(
                  child: CircularProgressIndicator(
                    color: MyColors.mainColor,
                  ),
                );
              },
              errorWidget: (context, url, error) {
                return Icon(Icons.error);
              },
            ),
          ),
          Text(widget.articles?.author ?? "",
              style: GoogleFonts.poppins(
                  color: MyColors.sourceColor,
                  fontSize: 10,
                  fontWeight: FontWeight.w400)),
          Text(widget.articles?.title ?? "",
              style: GoogleFonts.poppins(
                  color: MyColors.titleColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w500)),
          Text(
            widget.articles?.publishedAt?.substring(0, 10) ?? "",
            style: GoogleFonts.inter(
                color: MyColors.timeColor,
                fontSize: 13,
                fontWeight: FontWeight.w400),
            textAlign: TextAlign.right,
          ),
          showMore
              ? Text(
                  "${widget.articles?.content?.substring(0, ((widget.articles?.content?.length)! - 13) ?? 0) ?? "No content available"} ")
              : Text(""),
          showMore
              ? InkWell(
                  onTap: () {
                    _launchUrl(_url);
                  },
                  child: Text(
                    "Show more",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ))
              : Text("")
        ],
      ),
    );
  }

  Future<void> _launchUrl(_url) async {
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }
}

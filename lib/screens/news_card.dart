import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news/models/NewsDataModel.dart';
import 'package:news/shared/styles/colors.dart';

class NewsCard extends StatelessWidget {

  Articles articles;
  NewsCard(this.articles);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 6, horizontal: 10),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CachedNetworkImage(imageUrl: articles.urlToImage??"", height: 180, fit: BoxFit.fill,
            placeholder: (context, url) {return Center(child: CircularProgressIndicator(color: MyColors.mainColor,),);},
             errorWidget: (context, url, error) {
               return Icon(Icons.error);
             },),
           Text(articles.author??"",style: GoogleFonts.poppins(color: MyColors.sourceColor,fontSize: 10, fontWeight: FontWeight.w400)),
           Text(articles.title??"",style: GoogleFonts.poppins(color: MyColors.titleColor,fontSize: 14,fontWeight: FontWeight.w500)),
           Text(articles.publishedAt?.substring(0,10)??"",style: GoogleFonts.inter(color: MyColors.timeColor,fontSize: 13,fontWeight: FontWeight.w400),textAlign: TextAlign.right,),

        ],
      ),
    );
  }
}

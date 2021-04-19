import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:zoe/app/data/component/CustomIndicator.dart';

class CustomImageCached extends StatelessWidget {
  CustomImageCached({@required this.imageUrl});
  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return  CachedNetworkImage(imageUrl: imageUrl,

    ); 
  }
}

/*


 return CachedNetworkImage(
      imageUrl: imageUrl,
      placeholder: (context, url) => Center(
        child: SizedBox(
          width: 50,
          child: CustomIndicator(
            indicatorStatus: IndicatorStatus.imageplaceholder,
          ),
        ),
      ),
      errorWidget: (context, url, error) => Center(
        child: CustomIndicator(
          indicatorStatus: IndicatorStatus.error,
        ),
      ),

    );
          
          
          
          */

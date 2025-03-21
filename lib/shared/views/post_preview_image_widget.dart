import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class PostPreviewImageWidget extends StatelessWidget {
  final String? imageUrl;
  const PostPreviewImageWidget({super.key,  this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return  ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
      child: CachedNetworkImage(
        imageUrl: imageUrl.toString(),
        
        fit: BoxFit.cover,
        width:    MediaQuery.sizeOf(context).width*.30,
                  height: MediaQuery.sizeOf(context).height/7,
        placeholder: (context, url) => Center(child: CircularProgressIndicator()),
        errorWidget: (context, url, error) => Icon(Icons.photo_camera_outlined , 
        size: 50,
        
        ),
      ),
    );
  }
}
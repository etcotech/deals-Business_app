import 'package:deals_and_business/core/constants/translate.dart';
import 'package:deals_and_business/data/models/post/post_model.dart';
import 'package:flutter/material.dart';

class HomeListings extends StatefulWidget {
  const HomeListings({super.key});

  @override
  State<HomeListings> createState() => _HomeListingsState();
}

class _HomeListingsState extends State<HomeListings> {
  bool isList= true;
  @override
  Widget build(BuildContext context) {
    return Padding(
    padding: EdgeInsets.symmetric(horizontal: 18), 
      child: Column(
        children: [
      
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(getTranslated('last_ads', context)!,
                    
                    style: TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold
                    ),
                    ),


            AnimatedCrossFade(
              
              firstCurve: Curves.bounceIn,
              secondCurve: Curves.bounceOut,
              firstChild: 

            IconButton(onPressed: (){
isList = false;
setState(() {
  
});
            }, icon: Icon(Icons.list, color: Colors.grey,))
            , secondChild: IconButton(onPressed: (){
isList = true;
setState(() {
  
});
            }, icon: Icon(Icons.widgets, color: Colors.grey,)) 
            , crossFadeState: isList?
            CrossFadeState.showFirst:CrossFadeState.showSecond
            , duration: Duration(
microseconds: 500
            ))
            ],
          ), 
        ],
      ),
    );
  }
}
class HomePost extends StatelessWidget {
  final bool? isList;
  final PostModel? postModel;
  const HomePost({super.key, this.isList=false, this.postModel});

  @override
  Widget build(BuildContext context) {
    return AnimatedCrossFade(firstChild: 
    SizedBox(
      width: double.infinity,
      height: MediaQuery.sizeOf(context).height/6,
  
  
      child: Container(
        padding: EdgeInsets.all(3),
        child: Card(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
        Row(
          children: [
            Image.network(postModel!.picture!.url.toString()),


            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
Text(postModel!.title!), 


Row(
  mainAxisSize: MainAxisSize.min,
  children: [
    Icon(Icons.lock_clock),
Text(postModel!.createdAt!), 
  ],
)

              ],
            )
          ],
        ), 
        
        
        Icon(Icons.more_vert_outlined, color: Colors.grey,)
        
        
          ],
        ),
        
        ),
      ))
    
    
    , secondChild: 
     SizedBox(
      width: MediaQuery.sizeOf(context).width*.40,
      height: MediaQuery.sizeOf(context).height/3,
child: Card(
shape: RoundedRectangleBorder(
  borderRadius: BorderRadius.circular(15)
),
child: Column(
  children: [
    SizedBox(
      height: (MediaQuery.sizeOf(context).height/3)*.65,
      width: MediaQuery.sizeOf(context).width*.40,
    
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15)
          
              ),
            child: Image.network(postModel!.picture!.url.toString())),

            PositionedDirectional(
              start: 5,
              child: Visibility(
                visible: postModel!.featured==1,
                child: Icon(Icons.featured_play_list)))
        ],
      ), 
    
        
        
        )
,
SizedBox(height: 8,),
Padding(padding: EdgeInsets.symmetric(horizontal: 8),
child: Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
      ],
),

)

  ],
),


),
     )
    , crossFadeState: 
    isList!?CrossFadeState.showFirst: 
    CrossFadeState.showSecond, duration: Duration(milliseconds: 500));
  }
}
import 'package:deals_and_business/core/constants/strings.dart';
import 'package:deals_and_business/core/constants/translate.dart';
import 'package:flutter/material.dart';

class ReportButton extends StatelessWidget {
  final Function? onTap;
  final bool? isDelete;
  final Function?  onDelete;
  const ReportButton({super.key, this.onTap, this.isDelete=false, this.onDelete});


  @override
  Widget build(BuildContext context) {
    return 
    
    Center(
      child: 
                      PopupMenuButton(
                                      onSelected: (choice){
                        if (choice==Strings.reportApost) {
                                                          onTap!();

                        }
                        
                        if(choice==Strings.deleteThePost){
                                onDelete!();

                        }
                                      },
                                      padding: EdgeInsets.zero,
                                      // initialValue: choices[_selection],
                                      itemBuilder: (BuildContext context) {
                      return [
                      isDelete!?
                      Strings.deleteThePost:
                        
                        Strings.reportThePost].map((String choice) {
                        return  PopupMenuItem<String>(
                        value: choice,
                        child: Text(getTranslated(choice, context)!
                        ,
                         style: TextStyle(
                        color: Colors.grey
                      ),
                        ),
                      );}
                      ).toList();
                                      },
                                      menuPadding: EdgeInsets.zero,
                                    position: PopupMenuPosition.under,
                                
                                      child:
                                      
                                       Container(
                                  
                                    width: 35, height: 35,
                                    margin: EdgeInsets.symmetric(horizontal: 5),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8), 
                                      color: Colors.white, 
                                      boxShadow: [
                      BoxShadow(
                        offset: Offset(0, 1),
                        color: Colors.grey[300]!,
                        blurRadius: 4,
                        spreadRadius: 1
                      )
                                      ]
                                    ),
                                  
                                    child: Center(
                                      child: Icon(Icons.more_vert),
                                    ),
                                  ),
                                
                                    )
                                
    );
    
     Center(
      child: GestureDetector(

        onTap: (){
          onTap!();
        },
        child: Container(
        margin: EdgeInsets.symmetric(horizontal: 8),
          width: 35, height: 35,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8), 
            color: Colors.white, 
            boxShadow: [
             BoxShadow(
                offset: Offset(0, 1),
                color: Colors.grey[300]!,
                blurRadius: 4,
                spreadRadius: 1
              )
            ]
          ),
          child: Center(
            child: Icon(Icons.more_vert_outlined,
            color: Colors.grey,
            ),
          ),
        ),
      ),
    );
  }
}
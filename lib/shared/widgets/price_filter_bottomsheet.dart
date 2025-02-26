import 'package:deals_and_business/core/constants/strings.dart';
import 'package:deals_and_business/core/constants/translate.dart';
import 'package:deals_and_business/shared/widgets/mini_button.dart';
import 'package:deals_and_business/shared/widgets/price_input_field.dart';
import 'package:flutter/material.dart';

class PriceFilterBottomsheet extends StatefulWidget {
  final Function(double,double) setPrices;
  final Function? apply;
   const PriceFilterBottomsheet({super.key, required this.setPrices, this.apply});

  @override
  State<PriceFilterBottomsheet> createState() => _PriceFilterBottomsheetState();
}

class _PriceFilterBottomsheetState extends State<PriceFilterBottomsheet> {
  var formKey = GlobalKey<FormState>();
var  startPriceController = TextEditingController();
var  endPriceController = TextEditingController();
double startPrice=0.0,endPrice =0.0;
  @override
  Widget build(BuildContext context) {
    return 
        SingleChildScrollView(
           padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).viewInsets.bottom
          
            ),
          child: Container(
           
            height: MediaQuery.sizeOf(context).height*.35,
            padding: EdgeInsets.only(
          
              top: 5, left: 5,right: 5,
                                      // bottom: MediaQuery.of(context).viewInsets.bottom
          
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(20),
            ),
            ),
            child: 
            
            Column(
              children: [
                // Drag handle
                Container(
                  margin: EdgeInsets.only(top: 8),
                  width: 40,
                  height: 4,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
                SizedBox(height: 16),
                
                Builder(
                  builder: (context) {
                    return
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                     getTranslated(Strings.filtrtByPrice, context)!,
                      style: TextStyle(fontSize: 15,color: Colors.grey,
                        fontWeight: FontWeight.bold),
                    ),              SizedBox(height: 8),
                    
          
          
          
          Column(
            spacing: 16,
          children: [
            PriceInputField(controller: startPriceController, hintText: getTranslated(
              Strings.startPrice
              , context)!
              ,
              keyboardType: TextInputType.number,
              iconData: Icons.paid_outlined,
              onTextChange: (str){
          startPrice = double.parse(str!);
          setState(() {
            
          });
          widget.setPrices(startPrice,endPrice);
          
              }
              ), 
              PriceInputField(controller: endPriceController, hintText: getTranslated(
              Strings.endPrice
              , context)!,
              onTextChange: (str){
          endPrice = double.parse(str!);
          setState(() {
            
          });
          widget.setPrices(startPrice,endPrice);
              }
              ,
              keyboardType: TextInputType.number,
              iconData: Icons.paid_outlined,
              
              ), 
          ],
          ),
                        
                        Spacer(), 
            
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              MiniButton(title:getTranslated(Strings.apply, context),
                              color: Theme.of(context).primaryColor, 
                              
                              onTap: (){
                                // if (widget.onSelectCategory!=null && categoryModel!=null) {
                                  // widget.onSelectCategory!(categoryModel!);
                                // }
                              widget.  apply!();
                                Navigator.pop(context);
                              },
                              ),
            MiniButton(title:getTranslated(Strings.delte, context),
                              color: Colors.grey, 
                              
                              onTap: (){
                            // if (widget.selectedOrder!=null) {
                            //                                 // widget.selectedOrder!();
            
                            // }
                                Navigator.pop(context);
                              },
                              ),
            
            
            
                            ],
                          ),
                        ), 
                        SizedBox(height: 16,)
                        ],
            
                      ),
                    );
                  }
                ),
                
              ],
            ),
          ),
        );
     
  }
}
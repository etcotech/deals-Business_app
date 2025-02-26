import 'package:deals_and_business/core/constants/strings.dart';
import 'package:deals_and_business/core/constants/translate.dart';
import 'package:deals_and_business/shared/widgets/mini_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../../features/home/providers/home_provider.dart';

class SortBottomsheet extends StatefulWidget {
  final Function(String?)? selectedSort;
    final Function(String?)? selectedOrder;
    final Function? apply;

  const SortBottomsheet({super.key, this.selectedOrder, this.selectedSort, this.apply});

  @override
  State<SortBottomsheet> createState() => _SortBottomsheetState();
}

class _SortBottomsheetState extends State<SortBottomsheet> {
String? selectedOption;
List<String> sortByOptions =[
  'sort_by_price' ,'sort_by_aplh'
];



String? selectedOrder;

List<String> priceOrderOptions =[
  
  'sort_price_desc' ,'sort_price_asc'
];
List<String> alhpOrderOptions =[
  'sort_alph_az' ,'sort_alph_za'
];
@override
  void initState() {
    // TODO: implement initState
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_){
// context.read<HomeProvider>().getCategories(context);

    });
  }
   int? selectedCat;



  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (context,  provider, child) {

        return 
        
        Container(
          height: MediaQuery.sizeOf(context).height*.35,
          padding: EdgeInsets.all(8),
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
                   getTranslated(Strings.sortBy, context)!,
                    style: TextStyle(fontSize: 15,color: Colors.grey,  fontWeight: FontWeight.bold),
                  ),              SizedBox(height: 8),
                  
Column(
  children: [
 DropdownButton(
  padding: EdgeInsets.all(8),
  underline: SizedBox(),
                isExpanded: true, // Make the dropdown fill the width
              // Initial Value
              value: selectedOption,
              hint: Text(
getTranslated('please_choose_value', context)! ,
style: TextStyle(
   color: Colors.grey , fontSize: 18 , 
                    fontWeight: FontWeight.bold
),

              ),
              
              // Down Arrow Icon
              icon: const Icon(Icons.arrow_drop_down),    
              
              // Array list of items
              items: sortByOptions.map((String items) {
                return DropdownMenuItem(
                  
                  value: items,
                  child: Text(getTranslated(items, context)!, 
                  
                  style: TextStyle(
                    color: Theme.of(context).primaryColor , fontSize: 18 , 
                    fontWeight: FontWeight.bold
                  ),
                  ),
                );
              }).toList(),
              // After selecting the desired option,it will
              // change button value to selected value
              onChanged: (String? newValue) { 
                setState(() {
                  selectedOrder=null;
                  selectedOption = newValue!;
                });
                                widget.selectedSort!(selectedOption);

              },
            ),




DropdownButton(
  padding: EdgeInsets.all(8),
  underline: SizedBox(),
                isExpanded: true, // Make the dropdown fill the width
              // Initial Value
              value: selectedOrder,
              hint: Text(
getTranslated('please_choose_value', context)! ,
style: TextStyle(
   color: Colors.grey , fontSize: 18 , 
                    fontWeight: FontWeight.bold
),

              ),
              
              // Down Arrow Icon
              icon: const Icon(Icons.arrow_drop_down),    
              
              // Array list of items
              items: 
              (
                selectedOption!=null?
selectedOption.toString().contains("price")?
priceOrderOptions: alhpOrderOptions


:
                priceOrderOptions
              )
              .map((String items) {
                return DropdownMenuItem(
                  
                  value: items,
                  child: Text(getTranslated(items, context)!, 
                  
                  style: TextStyle(
                    color: Theme.of(context).primaryColor , fontSize: 18 , 
                    fontWeight: FontWeight.bold
                  ),
                  ),
                );
              }).toList(),
              // After selecting the desired option,it will
              // change button value to selected value
              onChanged: (String? newValue) { 
                setState(() {
                  selectedOrder = newValue!;
                });

                widget.selectedOrder!(selectedOrder);
              },
            ),


  ],
)
,



                      
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
        );
     
     
      }
    );
  }

  getIcon(String? icon){
    switch (icon) {
      case  "fas fa-store":
         return  FontAwesomeIcons.store;
        case  "fas fa-cog":
         return  FontAwesomeIcons.gear;
         case  "fas fa-users":
         return  FontAwesomeIcons.users;


      default:
               return  Icons.category;

    }
  }
}
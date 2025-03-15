import 'package:deals_and_business/core/constants/strings.dart';
import 'package:deals_and_business/core/constants/translate.dart';
import 'package:deals_and_business/data/models/country/city_model.dart';
import 'package:deals_and_business/shared/widgets/main_button.dart';
import 'package:deals_and_business/shared/widgets/mini_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../features/home/providers/home_provider.dart';

class CitiesBottomsheet extends StatefulWidget {
  final Function(CityModel)? onSelectCity;
  const CitiesBottomsheet({super.key, this.onSelectCity});

  @override
  State<CitiesBottomsheet> createState() => _CitiesBottomsheetState();
}

class _CitiesBottomsheetState extends State<CitiesBottomsheet> {
@override
  void initState() {
    // TODO: implement initState
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_){
context.read<HomeProvider>().getCities(context);

    });
  }
 CityModel? cityModel;

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (context,  provider, child) {
        return Container(
          height: MediaQuery.sizeOf(context).height/2,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(20),
          ),
          ),
          child: 
          
          Builder(
            builder: (context) {
              if (provider.isCityLoading) {
                return Center(child: CircularProgressIndicator(color: Theme.of(context).primaryColor,),);
              }
              return Column(
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
                      provider.isCountryLoading?
                      Expanded(child: Center(child: CircularProgressIndicator(color: Theme.of(context).primaryColor,),))
              
                      : Expanded(
                        child: Column(
                          children: [
                            Text(
                                        getTranslated(Strings.cities, context)!,

                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),              SizedBox(height: 8),
                      
                            Expanded(
                              child: ListView.builder(
                                itemCount: provider.cities.length,
                                shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  var city = provider.cities[index];
                                          
                                          return GestureDetector(
                                            onTap: (){
                                              cityModel = city;
                                              setState(() {
                                                
                                              });
                                            },
                                            child: Padding(padding: EdgeInsets.symmetric(horizontal: 40 ,
                                            
                                            vertical: 12, 
                                            
                                            
                                            
                                            ), 
                                            child: Text(city.name.toString(), 
                                            
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold ,
                                              color: cityModel!=null? city.id==cityModel!.id?Theme.of(context).primaryColor  :  Colors.grey  :  Colors.grey
                                            ),
                                            ),
                                            
                                            ),
                                          );
                               
                               
                                },
                              ),
                            ),
                          
                          // Spacer(), 
              
              
              
              widget.onSelectCity!=null?
               Padding(
                            padding: const EdgeInsets.all(8.0),
              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    MiniButton(title:getTranslated(Strings.apply, context),
                                    color: Theme.of(context).primaryColor, 
                                    
                                    onTap: (){
                                      if (widget.onSelectCity!=null && cityModel!=null) {
                                        widget.onSelectCity!(cityModel!);
                                      }
                                                                  // Navigator.pop(context);
              
                                      Navigator.pop(context);
                                    },
                                    ),
                  MiniButton(title:getTranslated(Strings.delte, context),
                                    color: Colors.grey, 
                                    
                                    onTap: (){
                                      Navigator.pop(context);
                                    },
                                    ),
                  
                  
                  
                                  ],
                                ),
              
               ):
              
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: MainButton(title: 'continue',
                            color: Theme.of(context).primaryColor, 
              
                            onTap: (){
                              Navigator.pop(context);
                            },
                            ),
                          ), 
                          SizedBox(height: 24,)
                          ],
              
                        ),
                      );
                    }
                  ),
                  
                ],
              );
            }
          ),
        );
      }
    );
  }
}
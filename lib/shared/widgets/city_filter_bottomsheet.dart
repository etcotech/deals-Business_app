import 'package:deals_and_business/data/models/country/city_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../features/home/providers/home_provider.dart';

class CityFilterBottomsheet extends StatefulWidget {
  final Function(CityModel)? onSelectCity;
  const CityFilterBottomsheet({super.key, this.onSelectCity});

  @override
  State<CityFilterBottomsheet> createState() => _CityFilterBottomsheetState();
}

class _CityFilterBottomsheetState extends State<CityFilterBottomsheet> {
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
                      provider.isCityLoading?
                      Expanded(child: Center(child: CircularProgressIndicator(color: Theme.of(context).primaryColor,),))
              
                      : 
                      Expanded(
                        child: Column(
                          children: [
                            Text(
                        'Cities',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                              ),              SizedBox(height: 8),
                                              
                            Expanded(
                              child: ListView.builder(
                                itemCount: provider.cities.length,
                                // shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  var city = provider.cities[index];
                                            
                                            return GestureDetector(
                                              onTap: (){
                                                cityModel = city;
                                                setState(() {
                                                  
                                                });
                                                widget.onSelectCity!(cityModel!);
                                                Navigator.pop(context);
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
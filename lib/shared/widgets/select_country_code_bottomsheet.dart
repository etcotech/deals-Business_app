import 'package:deals_and_business/core/constants/strings.dart';
import 'package:deals_and_business/core/constants/translate.dart';
import 'package:deals_and_business/data/models/country/country_model.dart';
import 'package:deals_and_business/shared/widgets/main_button.dart';
import 'package:deals_and_business/shared/widgets/mini_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../features/home/providers/home_provider.dart';

class SelectCountryCodeBottomsheet extends StatefulWidget {
  final Function(CountryModel)? onSelectCountry;
  const SelectCountryCodeBottomsheet({super.key, this.onSelectCountry});

  @override
  State<SelectCountryCodeBottomsheet> createState() => _SelectCountryCodeBottomsheetState();
}

class _SelectCountryCodeBottomsheetState extends State<SelectCountryCodeBottomsheet> {
@override
  void initState() {
    // TODO: implement initState
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_){
context.read<HomeProvider>().getCountries(context);

    });
  }
 CountryModel? countryModel;


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
                  provider.isCountryLoading?
                  Expanded(child: Center(child: CircularProgressIndicator(color: Theme.of(context).primaryColor,),))

                  :
                   Column(
                     children: [
                       Text(
                   'Countries',
                   style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                     ),              SizedBox(height: 8),
                                     
                       Padding(
                         padding: const EdgeInsets.symmetric(horizontal: 14),
                         child: ListView.builder(
                           itemCount: provider.countries.length,
                           shrinkWrap: true,
                           itemBuilder: (context, index) {
                             var country = provider.countries[index];
                             return ListTile(
                               onTap: (){
                                            countryModel=country;
                                            setState(() {
                                              
                                            });
                                  if (widget.onSelectCountry!=null && countryModel!=null) {
                                 widget.onSelectCountry!(countryModel!);
                               }
                                                           Navigator.pop(context);
                                            
                               },
                               title: Row(
                                 mainAxisSize: MainAxisSize.min,
                                 children: [
                                   Image.network(country.flag24Url.toString()), 
                         
                                   SizedBox(width: 3,),
                                   Text(country.name!)
                                 ],
                               ),
                               trailing: Icon(Icons.check ,color: Theme.of(context).primaryColor,),
                             );
                           },
                         ),
                       ),
                     
                     ],
                   
                   );
                }
              ),
              
            ],
          ),
        );
      }
    );
  }
}
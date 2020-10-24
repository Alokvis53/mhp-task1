import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_sample_mahapatra/BLCountries.dart';
import 'package:flutter_app_sample_mahapatra/components/country_details.dart';
import 'package:flutter_app_sample_mahapatra/models.dart';
import 'package:flutter_app_sample_mahapatra/utilities.dart';
import 'package:flutter_svg/svg.dart';

void main() {
  runApp(MyApp());
  // purple 112, 48, 160 || 7352480
  // blue  1, 101, 255 || 91647
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // Define the default brightness and colors.
        brightness: Brightness.light,
        primaryColor: Colors.lightBlue[800],
        accentColor: Colors.cyan[600],

        // Define the default font family.
        fontFamily: 'Roboto',

        // Define the default TextTheme. Use this to specify the default
        // text styling for headlines, titles, bodies of text, and more.
        textTheme: TextTheme(
          headline5: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w600,
              color: Colors.grey[500]),
          bodyText1: TextStyle(
              fontSize: 12.0, fontWeight: FontWeight.w500, color: Colors.white),
        ),
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  var defaultCountryIndex;
  Country _selectedCountry;
  int _currentStep1 = 0;
  var actionTags = ['Select a region', 'Select a country', 'Country Details'];
  var regionTags = ['Asia', 'Europe'];
  List<Region> regions = List<Region>();
  Region _selectedRegion;

  get currentStep1 => _currentStep1;

  void generateInitData() {
    regions
        .add(Region(rName: 'Asia', rColor: Clr(a: 255, r: 1, g: 101, b: 255)));
    regions.add(
        Region(rName: 'Europe', rColor: Clr(a: 255, r: 112, g: 48, b: 160)));
  }

  @override
  void initState() {
    // TODO: data init here
    super.initState();
    defaultCountryIndex = 0;
  }

  @override
  Widget build(BuildContext context) {
    generateInitData();
    log("current Step is : ${_currentStep1}");
    return Scaffold(
      body: new Stepper(
        controlsBuilder: (BuildContext context,
            {VoidCallback onStepContinue, VoidCallback onStepCancel}) {
          // more functionality can be implemented here
          return Row(
            children: <Widget>[
              Container(
                child: null,
              ),
              Container(
                child: null,
              ),
            ],
          );
        },
        //physics: ClampingScrollPhysics(),
        currentStep: this._currentStep1,
        onStepTapped: (step) {
          setState(() {
            this._currentStep1 = step;
          });
        },
        onStepContinue: () {
          setState(() {
            if (this._currentStep1 < 2) {
              this._currentStep1 += 1;
            } else {
              //step additional logic
            }
          });
        },
        onStepCancel: () {
          setState(() {
            if (this._currentStep1 > 0) {
              this._currentStep1 -= 1;
            } else {
              this._currentStep1 = 0;
            }
          });
        },
        steps: [
          Step(
              title: new Text(actionTags[0],
                  style: Theme.of(context).textTheme.headline5),
              content: _regionSelector(),
              isActive: _currentStep1 >= 0),
          Step(
              title: new Text(actionTags[1],
                  style: Theme.of(context).textTheme.headline5),
              content: Center(
                child: FutureBuilder<List<Country>>(
                  future: _currentStep1 == 1
                      ? BLCountries().fetchCountryOfRegion(_selectedRegion)
                      : null,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      //return Text('Some data will be here...');
                      return Container(
                        height: MediaQuery.of(context).size.height * 0.4,
                        child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: snapshot.data.length,
                            itemBuilder: (context, index) {
                              Country country = snapshot.data.elementAt(index);
                              return Container(
                                  height: 48,
                                  padding: EdgeInsets.all(4.0),
                                  margin: EdgeInsets.only(top: 4.0),
                                  decoration: BoxDecoration(
                                      color: defaultCountryIndex == index
                                          ? ColorHelper.generateColor(
                                              level: ColorHelper
                                                  .LEVEL_COUNTRIES_SELECTED,
                                              clr: country.region.colorMode)
                                          : ColorHelper.generateColor(
                                              level: ColorHelper
                                                  .LEVEL_COUNTRIES_NOT_SELECTED,
                                              clr: country.region.colorMode),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(8.0))),
                                  child: ListTile(
                                      title: Row(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: <Widget>[
                                          Expanded(
                                            child: Text(
                                              '${country.name}',
                                              overflow: TextOverflow.fade,
                                              style: defaultCountryIndex == index ? TextStyle(
                                                  fontSize: 14.0, fontWeight: FontWeight.w500, color: Colors.white) :
                                              TextStyle(
                                                  fontSize: 14.0, fontWeight: FontWeight.w500, color: ColorHelper.generateColor(
                                                  level: ColorHelper
                                                      .LEVEL_COUNTRIES_SELECTED,
                                                  clr: country.region.colorMode)),
                                              maxLines: 1,
                                            ),
                                            flex: 2,
                                          ),
                                        ],
                                      ),
                                      trailing: Container(
                                        height: 24,
                                        width: 34,
                                        child:
                                            SvgPicture.network(country.flagUrl),
                                      ),
                                      onTap: () {
                                        setState(() {
                                          defaultCountryIndex = index;
                                          _selectedCountry = country;
                                          this._currentStep1 = 2;
                                        });
                                      }));
                            }),
                      );
                    } else if (snapshot.hasError) {
                      log("Error -> ${snapshot.error}");
                      return Text("Failed to load country, try later.");
                    }
                    // By default, show a loading spinner.
                    return CircularProgressIndicator();
                    //return Text('progress block here...');
                  },
                ),
              ),
              isActive: _currentStep1 >= 2),
          Step(
              title: new Text(actionTags[2],
                  style: Theme.of(context).textTheme.headline5),
              content: CountryDetails(_selectedCountry),
              isActive: _currentStep1 >= 3),
        ],
      ),
    );
  }

  Widget _regionSelector() {
    return Column(
      children: <Widget>[
        _genRegionElement(regions[0]),
        _genRegionElement(regions[1]),
      ],
    );
  }

  Widget _genRegionElement(Region region) {
    return GestureDetector(
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(8.0),
        margin: EdgeInsets.only(top: 10.0),
        width: 200,
        decoration: BoxDecoration(
          color: ColorHelper.generateColor(
              level: ColorHelper.LEVEL_REGION, clr: region.colorMode),
          borderRadius: BorderRadius.all(
            Radius.circular(4),
          ),
        ),
        child: GestureDetector(
          child: Text(
            region.name,
            style: Theme.of(context).textTheme.bodyText1,
          ),
          onTap: () {
            onRegionSelected(region);
          },
        ),
      ),
      onTap: () {
        onRegionSelected(region);
      },
    );
  }

  void onRegionSelected(Region region) {
    log("tapped on ${region.name}");
    //BLCountries().fetchCountryOfRegion(region);
    setState(() {
      // UI Component
      this._currentStep1 = 1;
      // functional component
      _selectedRegion = region;
    });
  }
}

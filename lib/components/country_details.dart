import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_sample_mahapatra/models.dart';
import 'package:flutter_svg/svg.dart';

import '../utilities.dart';

class CountryDetails extends StatelessWidget {
  final Country _country;

  Country get country => _country;

  CountryDetails(this._country);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 5.0, bottom: 5.0, left: 2.0, right: 2.0),
      child: Center(
        child: Card(
          margin: EdgeInsets.only(left: 10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              _rowOne(),
              _rowTwo(),
              _rowThree(),
              _rowFour(),
              _rowFive(),
              _rowSix()
            ],
          ),
        ),
      ),
    );
  }

  Widget _rowOne() {
    return Row(
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(5.0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(4)),
              color: Colors.grey[300]),
          child: RichText(
            text: TextSpan(children: <TextSpan>[
              TextSpan(
                  text: "${country.region.name}",
                  style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w500,
                      color: Colors.black)),
              TextSpan(
                  text: " / ",
                  style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w500,
                      color: Colors.black)),
              TextSpan(
                  text: "${country.name}",
                  style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w500,
                      color: ColorHelper.generateColor(
                          level: ColorHelper.LEVEL_COUNTRIES_SELECTED,
                          clr: country.region.colorMode)))
            ]),
          ),
        )
      ],
    );
  }

  Widget _rowTwo() {
    int elementHeight = 36;
    return Container(
      padding: EdgeInsets.only(top: 10, bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(
              height: 36,
              width: 60,
              child: SvgPicture.network(country.flagUrl),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              height: 36,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  RichText(
                    text: TextSpan(children: <TextSpan>[
                      TextSpan(
                          text: "${country.name}",
                          style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.w500,
                              color: Colors.black)),
                      TextSpan(
                          text: "(${country.alpha3Code})",
                          style: TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey))
                    ]),
                  ),
                  Text(
                    country.capital,
                    style: TextStyle(
                        fontSize: 10.0,
                        fontWeight: FontWeight.w500,
                        color: Colors.black),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _rowThree() {
    int elementHeight = 36;
    return Container(
      padding: EdgeInsets.only(top: 10, bottom: 10,left: 17),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Container(
              padding: EdgeInsets.only(top: 4, bottom: 4,left: 4, right: 4),
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey[500],
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(5))
              ),
              height: 36,
              child: RichText(
                text: TextSpan(children: <TextSpan>[
                  TextSpan(
                      text: "Demonym : ",
                      style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey)),
                  TextSpan(
                      text: "${country.demonym}",
                      style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w500,
                          color: Colors.black)),
                ]),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _rowFour() {
    int elementHeight = 36;
    return Container(
      padding: EdgeInsets.only(top: 10, bottom: 10,left: 17),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Container(
              padding: EdgeInsets.only(top: 4, bottom: 4,left: 4, right: 4),
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey[500],
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(5))
              ),
              height: 36,
              child: RichText(
                text: TextSpan(children: <TextSpan>[
                  TextSpan(
                      text: "Calling Code : ",
                      style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey)),
                  TextSpan(
                      text: "${country.callingCodes}",
                      style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w500,
                          color: Colors.black)),
                ]),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _rowFive() {
    int elementHeight = 36;
    return Container(
      padding: EdgeInsets.only(top: 10, bottom: 10,left: 17),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Container(
              padding: EdgeInsets.only(top: 4, bottom: 4,left: 4, right: 4),
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey[500],
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(5))
              ),
              height: 36,
              child: RichText(
                text: TextSpan(children: <TextSpan>[
                  TextSpan(
                      text: "Currency : ",
                      style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey)),
                  TextSpan(
                      text: "${country.currencyName}",
                      style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w500,
                          color: Colors.black)),
                ]),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _rowSix() {
    int elementHeight = 36;
    return Container(
      padding: EdgeInsets.only(top: 10,left: 17),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Container(
              padding: EdgeInsets.only(top: 4, bottom: 4,left: 4, right: 4),
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey[500],
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(5))
              ),
              height: 36,
              child: RichText(
                text: TextSpan(children: <TextSpan>[
                  TextSpan(
                      text: "Population : ",
                      style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey)),
                  TextSpan(
                      text: "${country.population}",
                      style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w500,
                          color: Colors.black)),
                ]),
              ),
            ),
          )
        ],
      ),
    );
  }
}

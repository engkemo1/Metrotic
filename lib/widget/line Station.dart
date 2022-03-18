import 'package:flutter/material.dart';

import '../helper.dart';
import 'Line.dart';

class LineStation extends StatelessWidget {
  final String Text1;
  final String Text2;
  final String Text3;
  final String Text4;
  final String Text5;
  final String Text6;
  final String Text7;
  final String Text8;
  final String Text9;
  final String Text10;
  final String Text11;
  final String Text12;
  final String Text13;

  const LineStation(
      {Key? key,
      required this.Text1,
      required this.Text2,
      required this.Text3,
      required this.Text4,
      required this.Text5,
      required this.Text6,
      required this.Text7,
      required this.Text8,
      required this.Text9,
      required this.Text10,
      required this.Text11,
      required this.Text12,
      required this.Text13})
      : super(key: key);


  @override
  Widget build(BuildContext context) {
int? index1;
int? index2;

    return ListView(
      children: [
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Align(
            alignment: Alignment.topCenter,
            child: Text(
              "First Line",
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: ColorsHelp.background,
                  decoration: TextDecoration.none),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Container(
                height: 10,
                width: 10,
                decoration: BoxDecoration(
                    color: ColorsHelp.background,
                    borderRadius: BorderRadius.circular(20)),
              ),
              SizedBox(
                width: 15,
              ),
              GestureDetector(child: Text(
                Text1,
                style: TextStyle(
                    color: ColorsHelp.background,
                    fontSize: 10,
                    fontWeight: FontWeight.normal,
                    decoration: TextDecoration.none),
              ),onTap: (){},)
            ],
          ),
          Line(),
          Row(
            children: [
              Container(
                height: 10,
                width: 10,
                decoration: BoxDecoration(
                    color: ColorsHelp.background,
                    borderRadius: BorderRadius.circular(20)),
              ),
              SizedBox(
                width: 10,
              ),
            GestureDetector(
              child:   Text(
                Text2,
                style: TextStyle(
                    fontWeight: FontWeight.normal,
                    color: ColorsHelp.background,
                    fontSize: 10,
                    decoration: TextDecoration.none),
              ),
              onTap: (){
                if(index1 != null){
index2=1;
                }
                index1=1;

              },
            )
            ],
          ),
          Line(),
          Row(
            children: [
              Container(
                height: 10,
                width: 10,
                decoration: BoxDecoration(
                    color: ColorsHelp.background,
                    borderRadius: BorderRadius.circular(20)),
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                Text3,
                style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 10,
                    color: ColorsHelp.background,
                    decoration: TextDecoration.none),
              )
            ],
          ),
          Line(),
          Row(
            children: [
              Container(
                height: 10,
                width: 10,
                decoration: BoxDecoration(
                    color: ColorsHelp.background,
                    borderRadius: BorderRadius.circular(20)),
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                Text4,
                style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 10,
                    color: ColorsHelp.background,
                    decoration: TextDecoration.none),
              )
            ],
          ),
          Line(),
          Row(
            children: [
              Container(
                height: 10,
                width: 10,
                decoration: BoxDecoration(
                    color: ColorsHelp.background,
                    borderRadius: BorderRadius.circular(20)),
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                Text5,
                style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 10,
                    color: ColorsHelp.background,
                    decoration: TextDecoration.none),
              )
            ],
          ),
          Line(),
          Row(
            children: [
              Container(
                height: 10,
                width: 10,
                decoration: BoxDecoration(
                    color: ColorsHelp.background,
                    borderRadius: BorderRadius.circular(20)),
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                Text6,
                style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 10,
                    color: ColorsHelp.background,
                    decoration: TextDecoration.none),
              )
            ],
          ),
          Line(),
          Row(
            children: [
              Container(
                height: 10,
                width: 10,
                decoration: BoxDecoration(
                    color: ColorsHelp.background,
                    borderRadius: BorderRadius.circular(20)),
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                Text7,
                style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 10,
                    color: ColorsHelp.background,
                    decoration: TextDecoration.none),
              )
            ],
          ),
          Line(),
          Row(
            children: [
              Container(
                height: 10,
                width: 10,
                decoration: BoxDecoration(
                    color: ColorsHelp.background,
                    borderRadius: BorderRadius.circular(20)),
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                Text8,
                style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 10,
                    color: ColorsHelp.background,
                    decoration: TextDecoration.none),
              )
            ],
          ),
          Line(),
          Row(
            children: [
              Container(
                height: 10,
                width: 10,
                decoration: BoxDecoration(
                    color: ColorsHelp.background,
                    borderRadius: BorderRadius.circular(20)),
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                Text9,
                style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 10,
                    color: ColorsHelp.background,
                    decoration: TextDecoration.none),
              )
            ],
          ),
          Line(),
          Row(
            children: [
              Container(
                height: 10,
                width: 10,
                decoration: BoxDecoration(
                    color: ColorsHelp.background,
                    borderRadius: BorderRadius.circular(20)),
              ),
              SizedBox(
                width: 20,
              ),
              Text(
                Text10,
                style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 10,
                    color: ColorsHelp.background,
                    decoration: TextDecoration.none),
              )
            ],
          ),
          Line(),
          Row(
            children: [
              Container(
                height: 10,
                width: 10,
                decoration: BoxDecoration(
                    color: ColorsHelp.background,
                    borderRadius: BorderRadius.circular(20)),
              ),
              SizedBox(
                width: 20,
              ),
              Text(
                Text11,
                style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 10,
                    color: ColorsHelp.background,
                    decoration: TextDecoration.none),
              )
            ],
          ),
          Line(),
          Row(
            children: [
              Container(
                height: 10,
                width: 10,
                decoration: BoxDecoration(
                    color: ColorsHelp.background,
                    borderRadius: BorderRadius.circular(20)),
              ),
              SizedBox(
                width: 20,
              ),
              Text(
                Text12,
                style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 10,
                    color: ColorsHelp.background,
                    decoration: TextDecoration.none),
              )
            ],
          ),
          Line(),
          Row(
            children: [
              Container(
                height: 10,
                width: 10,
                decoration: BoxDecoration(
                    color: ColorsHelp.background,
                    borderRadius: BorderRadius.circular(20)),
              ),
              SizedBox(
                width: 20,
              ),
              Text(
                Text13,
                style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 10,
                    color: ColorsHelp.background,
                    decoration: TextDecoration.none),
              )
            ],
          ),
        ])
      ],
    );
  }
}

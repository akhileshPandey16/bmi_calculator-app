import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/reusable_card.dart';
import 'package:flutter/material.dart';
class ResultsPage extends StatelessWidget {
  ResultsPage(@required this.bmi,@required this.interpretation, @required this.result);
  final String bmi;
  final String interpretation;
  final String result;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: Container(
                child: Text(
                    "Your Result",
                    style:kTitleStyle
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: ReuseableCard(colour: kActiveCardColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(result,style: kBMITextStyle,),
                      Text(bmi,style: kBMIResultStyle,),
                      Text(interpretation,style: kBMITextStyle,),
                      SizedBox(height: 40,),
                    ],
                  ),
              ),
            ),
                    Container(
                      child: FlatButton(
                        onPressed: (){
                         Navigator.pop(context);
                        },
                      child: Text('RE-CALCULATE',
                        style:kLargeButtonStyle
                      ),
                      ),
                        height: kBottomContainerHeight,
                        color: kSecondaryColor,
                        width: double.infinity,
                        margin: EdgeInsets.only(top: 10),
                        padding: EdgeInsets.only(bottom: 10),
                    ),
          ],
        ),
      );
  }
}
import 'package:bmi_calculator/results_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'card_content.dart';
import 'reusable_card.dart';
import 'constants.dart';
import 'calc_brain.dart';
class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}


enum Gender{
  male,
  female
}

class _InputPageState extends State<InputPage> {
  Color maleCardColor = kInactiveColor;
  Color femaleCardColor = kInactiveColor;
  Gender selectedGender;
  int height = 180;
  int weight = 60;
  int age = 18;

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
            child: Row(
              children: <Widget>[
                Expanded(
                  child:ReuseableCard(
                    colour: selectedGender==Gender.male?kActiveCardColor:kInactiveColor,
                    cardChild: CardContent(icon: FontAwesomeIcons.mars,text: 'Male',),
                    onPress: (){
                      setState(() {
                        selectedGender=Gender.male;
                      });
                    },
                  ),
                ),
                Expanded(
                  child:ReuseableCard(
                    colour: selectedGender==Gender.female?kActiveCardColor:kInactiveColor,
                    cardChild: CardContent(icon: FontAwesomeIcons.venus,text: 'Female',),
                    onPress: (){
                      setState(() {
                        selectedGender=Gender.female;
                      });
                    },
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child:ReuseableCard(
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('HEIGHT',
                  style: kLabelTextStyle),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(height.toString(),
                      style:kNumericLabel
                      ),
                      Text("cm"),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      thumbShape:
                        RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayShape:
                        RoundSliderOverlayShape(overlayRadius:30),
                      thumbColor: kSecondaryColor,
                      overlayColor: kSliderOverlayColor,
                      activeTrackColor: kSliderActiveColor,
                      inactiveTrackColor: kInactiveSliderColor
                    ),

                    child: Slider(
                      value: height.toDouble(),
                      min: 50,
                      max: 300,
                      onChanged: (double d){
                        setState(() {
                          height=d.toInt();
                        });
                      },
                    ),
                  )
                ],
              ),
              colour: kActiveCardColor,
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child:ReuseableCard(
                    colour: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('WEIGHT',style: kLabelTextStyle),
                        Text(weight.toString(), style: kNumericLabel,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundButton(
                                icon: FontAwesomeIcons.minus,
                                onPressed: (){
                                  setState(() {
                                    weight-=1;
                                  });
                                }

                            ),
                            SizedBox(width: 10,),
                            RoundButton(
                                icon: FontAwesomeIcons.plus,
                                onPressed: (){
                                  setState(() {
                                    weight+=1;
                                  });
                                }
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child:ReuseableCard(
                    colour: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('AGE',style: kLabelTextStyle),
                        Text(age.toString(), style: kNumericLabel,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundButton(
                                icon: FontAwesomeIcons.minus,
                                onPressed: (){
                                  setState(() {
                                    age-=1;
                                  });
                                }

                            ),
                            SizedBox(width: 10,),
                            RoundButton(
                                icon: FontAwesomeIcons.plus,
                                onPressed: (){
                                  setState(() {
                                    age+=1;
                                  });
                                }
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(

            child: FlatButton(
              onPressed: (){
              CalculateBrain calc= CalculateBrain(weight,height,age);
              Navigator.push(context,
              MaterialPageRoute(
                builder: (context) => ResultsPage(
                  calc.getBMI(),"Normal","Good"

                ),
                ),
                );
                },
              child: Text('CALCULATE',
              style:kLargeButtonStyle
              ),
            ),
            height: kBottomContainerHeight,
            color: kSecondaryColor,
            width: double.infinity,
            margin: EdgeInsets.only(top: 10),
            padding: EdgeInsets.only(bottom: 10),
          )
         ],
      ),
    );
  }
}

class RoundButton extends StatelessWidget {
  RoundButton({@required this.icon, @required this.onPressed});
  final IconData icon;
  final Function onPressed;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(
        icon,
        color: kIconColor,
      ),
      elevation: 06.0,
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0
      ),
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4D5E),
      onPressed: onPressed,
    );
  }
}



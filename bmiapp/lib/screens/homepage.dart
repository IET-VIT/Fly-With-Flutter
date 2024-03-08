import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../main.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController c=TextEditingController();
  TextEditingController c2=TextEditingController();
  @override
  Widget build(BuildContext context) {
    mq=MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Stack(
        children: [
          Image.network('https://i.pinimg.com/736x/c0/d4/b1/c0d4b1cf7f28e9a912ab472a55eca50e.jpg',
          fit: BoxFit.fitHeight,),
          Scaffold(
            backgroundColor: Colors.transparent,
              body: Padding(
                  padding: EdgeInsets.symmetric(horizontal: mq.width*.05),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                      children : [
                        Image.network('https://i.ibb.co/pRhWHJY/indikator-bmi-white-background-chart-concept-vector-icon-100456-6278-removebg-preview.png" alt="indikator-bmi-white-background-chart-concept-vector-icon-100456-6278-removebg-preview',
                        height: mq.height*.2,width: mq.width*.8,),
                        Text("BMI Application", style: const TextStyle(
                            color: Colors.black, fontSize: 26,fontWeight: FontWeight.w500
                        )),
                        SizedBox(
                            height: mq.height*.04),
                        TextFormField(
                            style: TextStyle(color: Colors.white),
                            controller: c,
                            maxLength: 3,
                            enabled: true,
                            validator: (val) => val!=null && val.isNotEmpty?null : 'Required Field',
                            decoration: InputDecoration(prefixIcon: Icon(Icons.height,color: Colors.blue,),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  borderSide: BorderSide(color: Colors.white)
                                ),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: BorderSide(color: Colors.white)
                                ),
                                hintText: 'Enter Height in cm',hintStyle: TextStyle(color: Colors.white),
                                label: Text('Height',style: TextStyle(color: Colors.white),))),
                        SizedBox(
                            height: mq.height*.02),
                        TextFormField(
                          style: TextStyle(color: Colors.white),
                            controller: c2,
                            maxLength: 3,
                            enabled: true,
                            validator: (val) => val!=null && val.isNotEmpty?null : 'Required Field',
                            decoration: InputDecoration(prefixIcon: Icon(Icons.line_weight,color: Colors.blue,),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: BorderSide(color: Colors.white)
                                ),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: BorderSide(color: Colors.white)
                                ),
                                hintText: 'Enter Weight in kg',hintStyle: TextStyle(color: Colors.white),
                                label: Text('Weight',style: TextStyle(color: Colors.white),))),
                        SizedBox(
                            height: mq.height*.02),
                        ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            shape: const StadiumBorder(),
                            textStyle: TextStyle(color: Colors.black,fontWeight: FontWeight.w500),
                            minimumSize: Size(mq.width*.4, mq.height*.06),
                            backgroundColor: Colors.lightBlueAccent,
                          ),
                          onPressed: (){
                            if(c.text!="" && c2.text!="") {
                              try {
                                double height=double.parse(c.text)*0.01;
                                double weight=double.parse(c2.text);
                                var title_display="";
                                Color clr=Colors.white;
                                var result=weight/(height*height);
                                var bmi=((result*100)/100).floor();
                                if (bmi<=18.4) {
                                  title_display="Underweight";
                                  clr=Colors.grey;
                                } else if (bmi>18.4 && bmi<=24.9) {
                                  title_display="Normal";
                                  clr=Colors.blue;
                                } else if (bmi>24.9 && bmi<=29.9) {
                                  title_display="Overweight";
                                  clr=Colors.green;
                                } else if (bmi>29.9 && bmi<=39.9) {
                                  title_display="Obese";
                                  clr=Colors.yellow;
                                } else {
                                  title_display="Morbidly Obese";
                                  clr=Colors.red;
                                }
                                _showResult(clr,bmi,title_display);
                              } catch (e) {
                                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Enter values properly"),backgroundColor: Colors.orange,duration: Duration(seconds: 1)));
                              }
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Enter all values",),backgroundColor:Colors.red,duration: Duration(seconds: 1),));
                            }
                          },
                          icon: const Icon(Icons.done_outline,size:28,color: Colors.black54,),
                          label: const Text('Calculate',style: TextStyle(fontSize: 16,color: Colors.black54),),
                        )
                      ]
                  )),
          ),
        ],
      ),
    );
  }
  void _showResult(Color res,int bmi,String text){
    showDialog(context: context, builder: (_)=> AlertDialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20)
      ),
      title: Row(children: [
        Icon(CupertinoIcons.clock_fill,color: res,size: 28,),
        Text(" ${text}")
      ],),
      content:
      Text("Your BMI is : ${bmi}\nYou are ${text}",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400),textAlign: TextAlign.left),
      actions: [
        MaterialButton(onPressed: (){
          Navigator.pop(context);
        },child: Text('OK',style: TextStyle(color: res,fontSize: 16),),),
      ],
    ));
  }
}

 import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
 import 'package:pie_chart/pie_chart.dart';
/*


class S_setting extends StatelessWidget {
   double d1=10;
   S_setting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return */
/*Lottie.asset('assets/lottie/112463-loader.json');*//*

    Slider(value:d1 , onChanged:(double){ setState((){ d1 =double;}); }  , max: 128, min:8 , );


  }
}
*/
 class S_setting extends StatefulWidget {
   const S_setting({Key? key}) : super(key: key);

   @override
   State<S_setting> createState() => _S_settingState();
 }

 class _S_settingState extends State<S_setting> {
   double d1=10;
   @override
   Widget build(BuildContext context) {
     return  Column(

        mainAxisAlignment:MainAxisAlignment.spaceAround ,
        crossAxisAlignment: CrossAxisAlignment.center,
       children: [
         SizedBox(
            height: 200,width: 1000,
           child: PieChart(dataMap: { 'key':d1 , 'blue':25 , 'black':50 },chartType:ChartType.ring , emptyColor: Colors.white, colorList: [Colors.white , Colors.red , Colors.orange],ringStrokeWidth: 10,   ),
         )
         ,Slider(value:d1 , onChanged:(double){ setState((){ d1 =double;}); }  , max: 128, min:8 , ),
     Text('${d1.toInt()}'),



     ],  );
   }
 }

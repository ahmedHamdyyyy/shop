import 'dart:ffi';

import 'package:aaaaaa/screens/webVeww.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';

Widget Textformfild({
  required TextEditingController? control,
  required TextInputType? type,
  Function? onfild,
   Function? OnChanged  ,
  bool ispassword = false,
  required Function validat,
  required String labl,
  required IconData? prefix,
  IconData? SUFAKS,
  Function? ontap,

  bool Enable=true,
})=>TextFormField(controller:control,
  obscureText: ispassword,
  keyboardType:type,
  onFieldSubmitted:onfild!() ,
  onChanged: OnChanged!(),
  validator: validat(),
  onTap: ontap!(),

  decoration:InputDecoration(labelText:labl,
    border: OutlineInputBorder(),
    prefixIcon: Icon(
      prefix,
    ),
    suffixIcon: SUFAKS!=null ? Icon(SUFAKS,):null,
  ),
);
Widget countener()=>Container(
  height: 1,
  width: double.infinity,
  color: Colors.grey,
);
Widget biledItime(artic,context)=>InkWell(
  onTap: (){
    navigatorTo(context, WebVieww(
      artic["url"],
    ));
  },
  child:   Padding(
    padding: const EdgeInsets.all(20.0),
    child: Row(
      children: [
        Container(
          width: 120,
          height: 120,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              image: NetworkImage("${artic["urlToImage"]}"),
              fit: BoxFit.cover,
            ),
          ),
        ),

        SizedBox(
          width: 10,
        ),
        Expanded(
          child: Container(
            height: 120,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    "${artic["title"]}",
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style:  Theme.of(context).textTheme.bodyText1,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                 " ${artic["publishedAt"]}",
                  style: TextStyle(

                    fontWeight: FontWeight.bold,

                    fontSize: 15,
                    color: Colors.grey,

                  ),

                ),

              ],

            ),

          ),

        ),
      ],



    ),



  ),
);
Widget ItmeScreen( list,context)=>ConditionalBuilder(
  condition: list.length>0,
  builder: (BuildContext context) => ListView.separated(
    itemCount: 12,
    itemBuilder: (BuildContext context, int index) {
      return biledItime(list[index], context);
    },
    separatorBuilder: (BuildContext context, int index) => countener(),
  ),
  fallback: (BuildContext context) =>
      Center(child: CircularProgressIndicator()),
);
void  navigatorTo(context,Widget)=>Navigator.push(
    context,
    MaterialPageRoute(builder:(context) =>Widget,),);





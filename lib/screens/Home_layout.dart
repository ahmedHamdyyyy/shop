import 'package:aaaaaa/bloc/bloc/cubit.dart';
import 'package:aaaaaa/bloc/bloc/stute.dart';
import 'package:aaaaaa/local/cach_helper.dart';
import 'package:aaaaaa/screens/scince.dart';
import 'package:aaaaaa/screens/serch.dart';
import 'package:aaaaaa/shared/bloc/cubit.dart';
import 'package:aaaaaa/shared/coponents/componants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeLayOutl extends StatelessWidget {
  const HomeLayOutl({Key? key}) : super(key: key);
  //var cubit = NewsCubit.get(context);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsState>(
      listener: (BuildContext context, state) {},
      builder: (BuildContext context, Object? state) {
        var cubit = NewsCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            actions: [
              IconButton(
                  onPressed: () {
                    navigatorTo(context, searchScreen(),);
                  },
                  icon: Icon(
                    Icons.search,
                  )),
              IconButton(
                  onPressed: () {
                    bloc.get(context).changAppMode();
                  },
                  icon: Icon(
                    Icons.brightness_4_outlined,
                  )),
            ],
          ),
          drawer: Drawer(


            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SafeArea(
                    child: Container(
                      height: 40,
                    ),
                  ),
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(
                      "https://scontent.fcai20-5.fna.fbcdn.net/v/t39.30808-6/289644114_785709556134924_648724095673018097_n.jpg?_nc_cat=109&ccb=1-7&_nc_sid=09cbfe&_nc_eui2=AeHJ0KIPi1oDt3LmleNpbaVmfQTujwq8xAl9BO6PCrzECQZb3Wpjcl8J5ngcytleFofHXWvQ9NXIrOukwF7erVi8&_nc_ohc=14d4FvI-K-oAX8vxdSp&_nc_ht=scontent.fcai20-5.fna&oh=00_AT_rElsjX8VVUEeIMM-PCJjI5fFzG4Im5mfGvrm4Fsb_LQ&oe=62D67485",
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Ahmed Hamdi",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  ),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          bloc.get(context).changAppMode();

                        },
                        icon: Icon(Icons.brightness_4,
                          color:bloc.get(context).isDark? Colors.white :Colors.deepOrange ,
                        ),
                      ),
                      Text(
                        "ممكن تغير المود",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          body: cubit.Screen[cubit.currentIndx],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: cubit.currentIndx,
            items: cubit.BottomItem,
            onTap: (index) {
              cubit.changeBottomNavBar(index);
            },
          ),
        );
      },
    );
  }
}

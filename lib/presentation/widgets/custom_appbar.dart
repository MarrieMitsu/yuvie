import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yuvie/presentation/blocs/movie/movie.dart';
import 'package:yuvie/presentation/widgets/custom_buttons.dart';

class CustomAppbar extends StatelessWidget {
  
  const CustomAppbar({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TabsCubit, int>(
      builder: (context, state) {
        return Container(
          padding: EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              CustomIconButton(
                onTap: () {
                  BlocProvider.of<TabsCubit>(context)
                    .switchTab(0);
                }, 
                icon: Icons.local_movies,
                color: state == 0 ? Colors.purpleAccent : Colors.black,
              ),
              SizedBox(width: 20.0),
              CustomIconButton(
                onTap: () {
                  BlocProvider.of<TabsCubit>(context)
                    .switchTab(1);
                },
                icon: Icons.api,
                color: state == 1 ? Colors.blueAccent : Colors.black,
              ),
            ],
          ),
        );
      }
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reservamos/application/pages/home_page/bloc/home_logic_bloc.dart';

class ButtonPlace extends StatelessWidget {
  const ButtonPlace({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 120, right: 120, bottom: 30),
      child: InkResponse(
        onTap: () {
     BlocProvider.of<HomeLogicBloc>(context).add(HomeRequestedEvent());
     BlocProvider.of<HomeLogicBloc>(context).add(TempRequestedEvent());
      }, 
      child: Material(
        elevation: 20,
        borderRadius: BorderRadius.circular(15),
        child: Container(
          width: 600,
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color:  Colors.green[400],
          ),
          child: const Padding(
            padding:   EdgeInsets.symmetric(horizontal: 10, vertical: 15),
            child:  Center(child: Text("Buscar", style: TextStyle(color: Colors.white, fontSize: 20))),
          )))),
    );
  }
}
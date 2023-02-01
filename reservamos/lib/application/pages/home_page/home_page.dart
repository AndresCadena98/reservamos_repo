import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reservamos/application/injection.dart';
import 'package:reservamos/application/pages/home_page/widgets/advice_field.dart';
import 'package:reservamos/application/pages/home_page/widgets/button_place.dart';
import 'package:reservamos/application/pages/home_page/widgets/card_place.dart';
import 'package:reservamos/application/pages/home_page/widgets/error_message.dart';
import 'widgets/text_place_field.dart';

import 'bloc/home_logic_bloc.dart';

class HomePageWrapperProvider extends StatelessWidget {
  const HomePageWrapperProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => serverLocator<HomeLogicBloc>(),
      child: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Scaffold(
      backgroundColor: Colors.white,

      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: [
            SizedBox(child: Image.asset('assets/reservamoslogo.png',width: 50,height: 70,scale: 1,),),
             const TextPlaceField(),
             const ButtonPlace(),
            Align(
              alignment: Alignment.topCenter,
              child: BlocBuilder<HomeLogicBloc, HomeLogicState>(
            
            builder: (context, state) {
              if (state is HomeLogicInitial) {
                return const AdviceField(
                    advice: "Ingresa tu ciudad para ver que te espera");
              } else if (state is HomeLStateLoading) {
                return CircularProgressIndicator(
                  color: themeData.colorScheme.secondary,
                );  
              } else if (state is HomeLStateLoaded) {
                return  CardPlace(
                    placeLocation: state.generalInf.city ?? "", daily: state.generalInf.daily ?? [],);
              } else if (state is HomeLStateError) {
                return ErrorMessage(message: state.message);
              }
      
              return const SizedBox();
            },
              ),
            )
          ],
        ),
      ),
    );
  }


}

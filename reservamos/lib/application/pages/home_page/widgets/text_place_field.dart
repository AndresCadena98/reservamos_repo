import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reservamos/application/pages/home_page/bloc/home_logic_bloc.dart';


class TextPlaceField extends StatelessWidget {
  const TextPlaceField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: TextField(
        cursorColor: Colors.green[400],
        onChanged: (value) {
          BlocProvider.of<HomeLogicBloc>(context)
              .add(HomeRequestedTextedEvent(value));
        },
        decoration: const InputDecoration(
            focusedBorder: OutlineInputBorder(),
            border: OutlineInputBorder(),
            hintText: 'Buscar ciudad',
            enabledBorder: OutlineInputBorder()),
      ),
    );
  }
}

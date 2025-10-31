import 'package:flutter/material.dart';

class UiControlsScreen extends StatelessWidget {
  static const name = 'ui_controls_screen';

  const UiControlsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('UI-Controllks')),
      body: _UiControllsView(),
    );
  }
}

class _UiControllsView extends StatefulWidget {
  const _UiControllsView({super.key});

  @override
  State<_UiControllsView> createState() => _UiControllsViewState();
}

enum Transportation { car, plane, boat, submarine }

class _UiControllsViewState extends State<_UiControllsView> {
  bool isDeveloper = false;
  Transportation selectedTransportation = Transportation.boat;
  bool wantsBreakfast = false;
  bool wantsLunch = false;
  bool wantsDinner = false;

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const ClampingScrollPhysics(),
      children: [
        SwitchListTile(
          title: Text('Developer Mode'),
          subtitle: Text('Controles adicionales'),
          value: isDeveloper,
          onChanged: (value) => setState(() {
            isDeveloper != isDeveloper;
          }),
        ),

        ExpansionTile(
          title: Text('Vehiculo de Transporte'),
          subtitle: Text('$selectedTransportation'),
          children: [
            RadioGroup(
              groupValue: selectedTransportation,
              onChanged: (value) {
                setState(() {
                  selectedTransportation = Transportation.car;
                });
              },
              child: RadioListTile(
                title: Text('By Car'),
                subtitle: Text('Viajar por carro'),
                value: Transportation.car,
              ),
            ),
            RadioGroup(
              groupValue: selectedTransportation,
              onChanged: (value) {
                setState(() {
                  selectedTransportation = Transportation.boat;
                });
              },
              child: RadioListTile(
                title: Text('By Boat'),
                subtitle: Text('Viajar por bote'),
                value: Transportation.boat,
              ),
            ),
            RadioGroup(
              groupValue: selectedTransportation,
              onChanged: (value) {
                setState(() {
                  selectedTransportation = Transportation.plane;
                });
              },
              child: RadioListTile(
                title: Text('By Plane'),
                subtitle: Text('Viajar por avion'),
                value: Transportation.plane,
              ),
            ),
            RadioGroup(
              groupValue: selectedTransportation,
              onChanged: (value) {
                setState(() {
                  selectedTransportation = Transportation.submarine;
                });
              },
              child: RadioListTile(
                title: Text('By Submarine'),
                subtitle: Text('Viajar por submarino'),
                value: Transportation.submarine,
              ),
            ),
          ],
        ),

        CheckboxListTile(
          title: Text('Desayuno?'),
          value: wantsBreakfast,
          onChanged: (value) => setState(() {
            wantsBreakfast = !wantsBreakfast;
          }),
        ),
        CheckboxListTile(
          title: Text('Almuerzo?'),
          value: wantsLunch,
          onChanged: (value) => setState(() {
            wantsLunch = !wantsLunch;
          }),
        ),
        CheckboxListTile(
          title: Text('Cena?'),
          value: wantsDinner,
          onChanged: (value) => setState(() {
            wantsDinner = !wantsDinner;
          }),
        ),
      ],
    );
  }
}

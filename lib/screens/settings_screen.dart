import 'package:flutter/material.dart';
import 'package:meals_recipes/models/settings.dart';
import 'package:meals_recipes/widgets/main_drawer.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key, required this.onSettingsChanged, required this.settings}) : super(key: key);

  final Settings settings;
  final Function(Settings) onSettingsChanged;

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  var settings = Settings();


  @override
  void initState() {
    super.initState();
    settings = widget.settings;
  }

  Widget _createSwitch(
      String title, String subtitle, bool value, Function(bool) onChanged) {
    return SwitchListTile.adaptive(
      title: Text(title),
      value: value,
      onChanged: (value){
        onChanged(value);
        widget.onSettingsChanged(settings);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      drawer: const MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            child: Text(
              'Settings',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                _createSwitch(
                  'Gluten Free',
                  'Only gluten free meals',
                  settings.isGlutenFree,
                  (value) => setState(() {
                    settings.isGlutenFree = true;
                  }),
                ),
                _createSwitch(
                  'Lactose Free',
                  'Only lactose free meals',
                  settings.isLactoseFree,
                  (value) => setState(() {
                    settings.isLactoseFree = true;
                  }),
                ),
                _createSwitch(
                  'Vegan',
                  'Only vegan meals',
                  settings.isVegan,
                  (value) => setState(() {
                    settings.isVegan = true;
                  }),
                ),
                _createSwitch(
                  'Vegetarian',
                  'Only vegetarian meals',
                  settings.isVegetarian,
                  (value) => setState(() {
                    settings.isVegetarian = true;
                  }),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
 late bool _receiveNotifications;
 late bool _receivePromotions;
 late bool _darkMode;

  @override
  void initState() {
    super.initState();
    _loadPreferences();
}

    Future<void> _loadPreferences() async {
      try{
      SharedPreferences prefs = await SharedPreferences.getInstance();
      setState(() {
        _receiveNotifications = prefs.getBool('receiveNotifications') ?? true;
        _receivePromotions = prefs.getBool('receivePromotions') ?? false;
        _darkMode = prefs.getBool('darkMode') ?? false;
      }
      );
    }
      catch(e){
    print('Error loading preferences: $e');
   }
  }
    

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
    title: 'RentandBuy',
    theme: _darkMode ? ThemeData.dark() : ThemeData.light(),
    home: Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children:<Widget>[
          ListTile(
            title: const Text('Receive Notifications'),
            leading: const Icon(Icons.notifications),
            trailing: Switch(
              value:_receiveNotifications,
              onChanged:(value){  
                setState(() {
                  _receiveNotifications = value;
                  _savePreferences('receiveNotifications', value);
                });
                
                },
                ),
            ),
          
          const SizedBox(height: 10),
          const Divider(),
          ListTile(
            title: const Text('Receive Promotions'),
            leading: const Icon(Icons.local_offer),
            trailing: Switch(
              value:_receivePromotions,
              onChanged:(value){
                setState(() {
                  _receivePromotions = value;
                  _savePreferences('receivePromotions', value);
                });
                
                },
                ),
            ),
          const SizedBox(height: 10),
          const Divider(),
          ListTile(
            title: const Text('Dark Mode'),
            leading: const Icon(Icons.dark_mode),
            trailing:Switch(
              value:_darkMode,
             onChanged: (value){
              setState(() {
                _darkMode = value;
                _savePreferences('darkMode', value);
              });
             }, 
            ),
          ),
          const SizedBox(height: 10),
          const Divider(),
          ListTile(
            title: const Text('Privacy and Security'),
            leading: const Icon(Icons.security),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {

            },
          ),
        ],
      ),
    ),
    );
  }

Future<void> _savePreferences(String key, bool value) async {
  try {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(key, value);
  } catch (e) {
    print('Error saving preference: $e');
  }
  }
}
void main () {
  runApp(SettingsPage());
}
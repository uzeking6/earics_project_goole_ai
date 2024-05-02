import 'package:firstapp/views/hard_of_hearing.dart';
import 'package:flutter/material.dart';

class Intensity_Settings extends StatefulWidget {
  const Intensity_Settings({Key? key}) : super(key: key);

  @override
  _Intensity_SettingsState createState() => _Intensity_SettingsState();
}

class _Intensity_SettingsState extends State<Intensity_Settings> {
  bool noiseReduction = false;
  bool amplifierOD = false;
  List<bool> choiceHear = [true, false]; // for OD and OG
  Map<String, double> Intensities = {
    '20dB': 0,
    '23dB': 0,
    '29dB': 0,
    '32dB': 0,
    '48dB': 0,
    '58dB': 0,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(20.0),
          ),
          SwitchListTile(
            title: const Text('Noise  Reduction'),
            value: noiseReduction,
            onChanged: (bool value) {
              setState(() {
                noiseReduction = value;
              });
            },
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (int i = 0; i < choiceHear.length; i++)
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4.0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: choiceHear[i]
                              ? const Color.fromRGBO(122, 198, 189, 1)
                              : Colors.grey, // Colors based on selection
                        ),
                        child: Text(i == 0 ? 'freq' : 'inten'),
                        onPressed: () {
                          setState(() {
                            for (int j = 0; j < choiceHear.length; j++) {
                              choiceHear[j] = i == j;
                            }
                          });
                          //     if (i ==){
                          //       Navigator.of(context).push(MaterialPageRoute(
                          //  builder: (BuildContext context) => FrequencySettings()));
                          //     }
                        },
                      ),
                    ),
                  ),
              ],
            ),
          ),
          SwitchListTile(
            title: const Text('Amplify_inten'),
            value: amplifierOD,
            onChanged: (bool value) {
              setState(() {
                amplifierOD = value;
              });
            },
          ),
          ...Intensities.keys.map((String key) {
            return Slider(
              value: Intensities[key]!,
              onChanged: (double value) {
                setState(() {
                  Intensities[key] = value;
                });
              },
              min: 0,
              max: 100,
              divisions: 20,
              label: key,
            );
          }),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (BuildContext context) =>
                        HardHearing(title: 'register')));
              },
              child: Text('SAVE'),
            ),
          ),
        ],
      ),
    ));
  }
}

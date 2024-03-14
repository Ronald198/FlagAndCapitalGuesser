import 'dart:convert';
import 'dart:math';

import 'package:flagguesser/constants.dart';
import 'package:flagguesser/databaseManager.dart';
import 'package:flagguesser/pages/home_page.dart';
import 'package:flagguesser/services/countries.dart';
import 'package:flagguesser/widgets/square_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';

class FlagPresetPage extends StatefulWidget {
  final Function refreshHomePageCallback;

  const FlagPresetPage({super.key, required this.refreshHomePageCallback });

  @override
  State<FlagPresetPage> createState() => _FlagPresetPageState();
}

class _FlagPresetPageState extends State<FlagPresetPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getHeader(),
      body: getBody(),
    );
  }

  PreferredSizeWidget getHeader() {
    return AppBar(
      title: const Text("Flags Preset"),
      actions: [
        Text("${CountriesApi.chosenPresetLength} / 255"),
        IconButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: const Text("Confirm"),
                  content: const Text("This will override the current custom preset. Are you sure you want to continue?"),
                  actions: [
                    TextButton(
                      onPressed: () async {
                        List<String> customPreset = [];
                        customPreset = CountriesApi.chosenPreset.toList();
                        
                        String flags = json.encode(customPreset);
                        int res = await DatabaseManager.instance.updateCustomPreset(flags, 1);

                        if (res != 0)
                        {
                          Fluttertoast.showToast(msg: "Saved flags to custom preset!");
                        }
                        else
                        {
                          Fluttertoast.showToast(msg: "Error while saving to preset!");
                        }

                        if (context.mounted)
                        {
                          Navigator.pop(context);
                        }

                        return;
                      },
                      child: const Text("Yes"),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      
                        return;
                      },
                      child: const Text("No"),
                    ),
                  ],
                );
              },
            );
          },
          icon: const Icon(Icons.save),
        ),
      ],
    );
  }

  Widget getBody() {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      child: RawScrollbar(
        thumbColor: FlagGuesserPalette.mainColor,
        thickness: 8,
        radius: const Radius.circular(36),
        crossAxisMargin: 2,
        child: ListView(
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SquareButton(
                        onPress: () {
                          CountriesApi.chosenPreset = CountriesApi.sporclePreset.toList();
                          CountriesApi.chosenPresetLength = CountriesApi.sporclePreset.length;
                          
                          generateFlag();

                          Fluttertoast.showToast(msg: "Loaded preset!");
                        },
                        text: "Sporcle+ preset",
                        iconData: Icons.data_array
                      ),
                      SquareButton(
                        onPress: () {

                        },
                        text: "Europe\npreset",
                        iconData: Icons.data_array
                      ),
                      SquareButton(
                        onPress: () {
                          
                        },
                        text: "Africa\npreset",
                        iconData: Icons.data_array
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SquareButton(
                        onPress: () {

                        },
                        text: "Asia\npreset",
                        iconData: Icons.data_array
                      ),
                      SquareButton(
                        onPress: () {
                  
                        },
                        text: "N America preset",
                        iconData: Icons.data_array
                      ),
                      SquareButton(
                        onPress: () {
                          
                        },
                        text: "S America\npreset",
                        iconData: Icons.data_array
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SquareButton(
                        onPress: () {
                          
                        },
                        text: "Oceania\npreset",
                        iconData: Icons.data_array
                      ),
                      SquareButton(
                        onPress: () async {
                          FlagPreset notFound = await DatabaseManager.instance.getFlagPresetById(1);

                          if (notFound.flags.isNotEmpty)
                          {
                            CountriesApi.chosenPreset = notFound.flags.toList();
                            CountriesApi.chosenPresetLength = notFound.flags.length;
                            
                            generateFlag();
                            Fluttertoast.showToast(msg: "Loaded preset!");
                          }
                          else
                          {
                            Fluttertoast.showToast(msg: "This preset is empty!");
                          }
                        },
                        text: "Custom preset",
                        iconData: Icons.data_array
                      ),
                      SquareButton(
                        onPress: () {
                          CountriesApi.chosenPreset = CountriesApi.allCountries.toList();
                          CountriesApi.chosenPresetLength = CountriesApi.allCountries.length;
                          
                          generateFlag();    
                          Fluttertoast.showToast(msg: "Loaded preset!");
                        },
                        text: "Worldwide preset",
                        iconData: Icons.data_array
                      ),
                    ],
                  ),
                ),
              ],
            ),
            GridView(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 0.79
              ),
              children: [
                for (int i = 0; i < 255; i++) ...[
                  flagTile(i)
                ],
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget flagTile(int index) {
    bool isContained = false;
    String countryKey = CountriesApi.allCountries[index];
    String imageLink = "assets/country-flags/${countryKey.toLowerCase()}.png";
    String countryName = CountriesApi.getNameFromKey(countryKey)!;

    if (CountriesApi.chosenPreset.contains(countryKey))
    {
      isContained = true;
    }

    return InkWell(
      onTap: () {
        if (FlagGuessingData.countriesFound != 0) // ongoing game
        {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text("Confirm"),
                content: const Text("Changing the preset restarts the current game. Are you sure you want to continue?"),
                actions: [
                  TextButton(
                    onPressed: () {
                      if (isContained) {
                        removeFlagFromPreset(countryKey);
                        isContained = false;
                      }
                      else {
                        addFlagToPreset(countryKey);
                        isContained = true;
                      }

                      generateFlag();
  
                      Navigator.pop(context);

                      return;
                    },
                    child: const Text("Yes"),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    
                      return;
                    },
                    child: const Text("No"),
                  ),
                ],
              );
            },
          );
        }
        else
        {
          if (isContained) {
            removeFlagFromPreset(countryKey);
            isContained = false;
          }
          else {
            addFlagToPreset(countryKey);
            isContained = true;
          }
        }
      },
      child: Stack(
        fit: StackFit.expand,
        children: [
          Card(
            color: const Color.fromARGB(255, 186, 186, 187),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(imageLink, width: 100,),
                Text(countryName, textAlign: TextAlign.center,)
              ],
            ),
          ),
          if (isContained) ...[
            Container(
              decoration: BoxDecoration(
                color: const Color.fromARGB(158, 255, 255, 255),
                borderRadius: BorderRadius.circular(18),
              ),
            ),
            Icon(Icons.check_circle, color: Colors.green.shade900, size: 52,)
          ],
        ],
      ),
    );
  }

  /// Removes flag to preset
  void removeFlagFromPreset(String countryKey) {
    CountriesApi.chosenPreset.remove(countryKey);
    CountriesApi.chosenPresetLength--;

    if (FlagGuessingData.countryKey == countryKey)
    {
      generateFlag();
    }

    widget.refreshHomePageCallback();
    setState(() {});
  }

  /// Adds flag to preset
  void addFlagToPreset(String countryKey) {
    CountriesApi.chosenPreset.add(countryKey);
    CountriesApi.chosenPresetLength++;

    widget.refreshHomePageCallback();
    setState(() {});
  }

  /// Generates flag to start game
  void generateFlag() {
    FlagGuessingData.countriesToFind = CountriesApi.chosenPreset.toList();
    FlagGuessingData.countriesFound = 0;
    FlagGuessingData.countriesFoundPercentage = 0;
    FlagGuessingData.countryIndex = Random().nextInt(CountriesApi.chosenPresetLength);
    FlagGuessingData.countryKey = FlagGuessingData.countriesToFind[FlagGuessingData.countryIndex];
    FlagGuessingData.imageLink = "assets/country-flags/${FlagGuessingData.countryKey.toLowerCase()}.png";
    FlagGuessingData.answer = CountriesApi.getNameFromKey(FlagGuessingData.countryKey)!;

    widget.refreshHomePageCallback();
    setState(() {});
  }
}
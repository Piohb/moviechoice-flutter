import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:movie_choice/constants.dart';
import 'package:movie_choice/model/category.dart';
import 'package:http/http.dart' as http;
import 'package:filter_list/filter_list.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _Settings();
}

class _Settings extends State<Settings> {

  final preferencesKey = 'category';
  SharedPreferences? preferences;

  List<Category> categories = [];
  List<Category> selected = [];

  Future<void> loadCategories() async {
    final response = await http.get(
      Uri.parse('$apiUrl/genre/movie/list?api_key=$apiKey&language=fr-FR')
    );
    final json = jsonDecode(response.body);
    var parsed = json['genres'] as List;

    List<Category> results = [];
    for(var genre in parsed){
      results.add(Category(name: genre['name'], id: genre['id']));
    }
    
    setState(() {
      categories = results;
    });
  }

  void saveCategory(list){
    preferences?.setString(preferencesKey, Category.encode(list));
  }

  @override
  void initState() {
    init();
    super.initState();
  }

  Future<void> init() async {
    await loadCategories();
    preferences = await SharedPreferences.getInstance();
    var cache = Category.decode(preferences?.getString(preferencesKey));

    for(var item in cache){
      selected = selected + categories.where((category) => category.name == item.name).toList();
    }
  }
  
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body:  FilterListWidget<Category>(
        backgroundColor: bgColor,
        themeData: FilterListThemeData(
          context,
          backgroundColor: bgColor,
          choiceChipTheme: const ChoiceChipThemeData(
            selectedBackgroundColor: whiteColor,
            selectedTextStyle: TextStyle(
              color: bgColor
            ),

            backgroundColor: bgColor,
            textStyle: TextStyle(
              color: whiteColor
            ),
          )
        ),
        listData: categories,
        selectedListData: selected,
        onApplyButtonClick: ((list) {
          saveCategory(list);
        }),
        validateSelectedItem: ((list, item) {
          return list!.contains(item);
        }),  
        onItemSearch: ((item, query) {
          return item.name.toLowerCase().contains(query.toLowerCase());
        }),
        choiceChipLabel: ((category) {
          return category!.name;
        }),
        /*choiceChipBuilder: (context, item, isSelected) {
          
        }, */
      ),
    );
  }
}
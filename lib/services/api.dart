import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:recipe_app_si/models/recipe.dart';

class RecipeApi{
  Future<List<Recipe>> recipe() async{
    final response = await http.get(
      Uri.parse('https://dummyjson.com/recipes'),
    );
    if (response.statusCode == 200){
      final data = jsonDecode(response.body);
      List recipes = data['recipes'];
      return recipes.map((recipe) => Recipe.fromJson(recipe)).toList();
    } 
    else{
      throw Exception('Failed to load recipes');
    }
  }
}
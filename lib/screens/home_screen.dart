import 'package:flutter/material.dart';
import 'package:recipe_app_si/models/recipe.dart';
import 'package:recipe_app_si/services/api.dart';

class HomeScreen extends StatelessWidget{
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Recipe>>(
      future: RecipeApi().recipe(), 
      builder: (context, snapshot) {
        if(snapshot.connectionState == ConnectionState.waiting){
          return Center(child: CircularProgressIndicator(),);
        }
        final recipes = snapshot.data!;
        return ListView.builder(
          itemCount: recipes.length,
          itemBuilder: (context, index) {
            final recipe = recipes[index];
            return Card(
              child: Row(
              children: [
              Image.network(recipe.img,
              height: 100,
              width: 100,
              fit: BoxFit.fill,
            ),
            SizedBox(width: 50,),
            Container(
             padding: EdgeInsets.only(top: 25),
              height: 100,
              width: 150,
              child: Column(children: [
              Text(recipe.name, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12,), textAlign: TextAlign.center,),
              SizedBox(height: 10,),
              Text('Ratings: ${recipe.rating}', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),)
            ],
            ),
          )
        ],
      ),
            );
          },
        );
      },);
  }
}
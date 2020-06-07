import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_app_ui/constants.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: "Poppins",
        scaffoldBackgroundColor: kWhiteColor,
        primaryColor: kPrimaryColor,
        textTheme: TextTheme(
          headline5: TextStyle(fontWeight: FontWeight.bold),
          button: TextStyle(fontWeight: FontWeight.bold),
          headline6: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        
        Padding(
          padding: const EdgeInsets.only(top: 60, right: 20),
          child: Align(
            alignment: Alignment.topRight,
            child: SvgPicture.asset('assets/icons/menu.svg', height: 11,),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(20),
          child: Container(
            child: Text("Simple way to find \nTasty food", style: Theme.of(context).textTheme.headline5,)),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
            CategoryTitle(title: 'All', active: true,),
            CategoryTitle(title: 'Italian'),
            CategoryTitle(title: 'Asian'),
            CategoryTitle(title: 'Russian'),
            CategoryTitle(title: 'Vietnam'),
            CategoryTitle(title: 'French'),
            CategoryTitle(title: 'Germany'),
          ],),
        ),
        Container(
          alignment: Alignment.centerLeft,
          margin: EdgeInsets.symmetric(vertical: 18, horizontal: 18),
          padding: EdgeInsets.symmetric(horizontal: 18, vertical: 10),
          height: 50,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: kBorderColor),
          ),
          child: SvgPicture.asset('assets/icons/search.svg'),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              FoodCard(
                title: 'Вегетарианский салат',
                calories: 44,
                image: 'assets/images/image_1.png',
                description: 'Вегетарианскую еду стоит попробовать хотя бы из любопытства: такой эксперимент не только разнообразит привычный рацион, но и сэкономит время: завтрак из ржаных тостов с авокадо',
                ingredient: 'С красными томатами',
                price: 800,
              ),
              FoodCard(
                title: 'Вегетарианский салат',
                calories: 44,
                image: 'assets/images/image_1.png',
                description: 'Вегетарианскую еду стоит попробовать хотя бы из любопытства: такой эксперимент не только разнообразит привычный рацион, но и сэкономит время: завтрак из ржаных тостов с авокадо',
                ingredient: 'С красными томатами',
                price: 800,
              ),
              FoodCard(
                title: 'Вегетарианский салат',
                calories: 44,
                image: 'assets/images/image_1.png',
                description: 'Вегетарианскую еду стоит попробовать хотя бы из любопытства: такой эксперимент не только разнообразит привычный рацион, но и сэкономит время: завтрак из ржаных тостов с авокадо',
                ingredient: 'С красными томатами',
                price: 800,
              ),
              SizedBox(width: 20)
            ],
          ),
        )

      ],),
      floatingActionButton: Container(
        padding: EdgeInsets.all(10),
        height: 60,
        width: 60,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: kPrimaryColor.withOpacity(.25)
        ),
        child:  Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: kPrimaryColor
          ),
          child: SvgPicture.asset('assets/icons/plus.svg'),
        ),
      ),
    );
  }
}

class FoodCard extends StatelessWidget {
  final String title;
  final String ingredient;
  final String image;
  final int price;
  final int calories;
  final String description;

  const FoodCard({
    Key key, this.title, this.ingredient, this.image, this.price, this.calories, this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20),
      height: 400,
      width: 270,
      child: Stack(
        children: [
          Positioned(
            right: 0,
            bottom: 0,

            child: Container(
              height: 380,
              width: 250,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(34),
              color: kPrimaryColor.withOpacity(.06),
              ),
            ),
          ),
          Positioned(
            left: 10,
            top: 10,
            child: Container(
              height: 181,
              width: 181,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: kPrimaryColor.withOpacity(.15)
                ),
            ),
          ),
          Positioned(
            left: -50,
            child: Container(
              height: 184,
              width: 276,
              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage(image))
              ),
            ),
          ),
          Positioned(
            right: 6,
            top: 50,
            child: Text('$price р.', style: Theme.of(context).textTheme.headline5.copyWith(color: kPrimaryColor)),
          ),
          Positioned(
            top: 200,
            left: 40,
            child: Container(
              width: 210,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start ,
                children: [
                  Text(title, style: Theme.of(context).textTheme.headline6.copyWith(height: 1.1)),
                  Text(ingredient, style: TextStyle(color: kTextColor.withOpacity(.4)),),
                  SizedBox(height: 10),
                  Text(
                    description,
                    maxLines: 3,
                    style: TextStyle(color: kTextColor.withOpacity(.6)),
                  ),
                  SizedBox(height: 10),
                  Text('$calories Ккал.')
                ]
              ),
            ),
          )
        ],
      ),
      );
  }
}

class CategoryTitle extends StatelessWidget {
  final String title;
  final bool active;

  const CategoryTitle({
    Key key, this.active = false, this.title
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 18),
      child: Text(title,
        style: Theme.of(context).textTheme.button.copyWith(color: active ? kPrimaryColor : kTextColor.withOpacity(.4))
      ),
    );
  }
}
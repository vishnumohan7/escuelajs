import 'package:escuelajs/src/cubit/category_cubit/category_cubit.dart';
import 'package:escuelajs/src/models/category_model.dart';
import 'package:escuelajs/src/pages/products_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CategoryCubit()..getAllCategories(),
      child: Scaffold(
        appBar: AppBar(
          title: Text("Categories"),
          backgroundColor: Colors.lightGreen,
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => ProductsPage()));
                },
                icon: Icon(Icons.production_quantity_limits_sharp))
          ],
        ),
        body: BlocBuilder<CategoryCubit, CategoryState>(
          builder: (context, state) {
            if (state is CategoryLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (state is CategoryLoadSuccess) {
              return _buildCategoryUI(state.categoriesList);
            } else if (state is CategoryLoadError) {
              return Text(state.errorMessage);
            } else {
              return CircularProgressIndicator();
            }
            return Text("");
          },
        ),
      ),
    );
  }

  _buildCategoryUI(List<CategoryModel> categories) {
    return ListView.builder(
        itemCount: categories.length,
        itemBuilder: (context, index) {
          CategoryModel item = categories[index];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(item.image ?? ""),
                    radius: 35,
                  ),
                  title: Text(item.name.toString()),
                ),
              ),
            ),
          );
        });
  }
}

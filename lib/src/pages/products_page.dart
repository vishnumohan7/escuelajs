import 'package:escuelajs/src/cubit/products_cubit/products_cubit.dart';
import 'package:escuelajs/src/models/products_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductsPage extends StatefulWidget {
  const ProductsPage({Key? key}) : super(key: key);

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
      ProductsCubit()
        ..getAllProducts(),
      child: Scaffold(
        appBar: AppBar(
          title: Text("Products"),
          backgroundColor: Colors.lightGreen,
        ),
        body: BlocBuilder<ProductsCubit, ProductsState>(
          builder: (context, state) {
            if(state is ProductsLoadSuccess){
              return _buildProductUI(state.products);
            }
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }

  _buildProductUI(List<ProductsModel> products) {
    return ListView.builder(
        itemCount: 3,
        itemBuilder: (context, index) {
          ProductsModel item = products[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(item.images![index]),
            ),
            title: Text(item.title??""),
            subtitle: Text("Price: ${item.price.toString()}"),
            trailing: IconButton(onPressed: (){},icon: Icon(Icons.shopping_cart_rounded),),
          );
        });
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:heroicons/heroicons.dart';
import 'package:shopping_app/constant/app_color.dart';
import 'package:shopping_app/constant/app_text_style.dart';
import 'package:shopping_app/domain/entities/product_entity.dart';
import 'package:shopping_app/presentation/providers/bloc/product_bloc.dart';
import 'package:shopping_app/presentation/screens/home_page.dart';
import 'package:shopping_app/presentation/screens/skeleton_loading_screen.dart';
import 'package:shopping_app/presentation/widgets/product_card_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<ProductEntity> products = [];

  Widget page = SkeletonLoadingScreen();

  @override
  void initState() {
    context.read<ProductBloc>().add(GetAllProducts());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home', style: AppTextStyle.appBarTextStyle),
        centerTitle: true,
        backgroundColor: AppColor.aquarius,
      ),
      body: BlocConsumer<ProductBloc, ProductState>(
        listener: (context, state) {
          if (state is GetAllSuccessState) {
            setState(() {
              products = state.products;
              page = HomePage(products: products);
            });
          } else if (state is TryToGetState) {
            setState(() {
              page = SkeletonLoadingScreen();
            });
          }
        },
        builder: (context, UserState) {
          return page;
        },
      ),
    );
  }
}

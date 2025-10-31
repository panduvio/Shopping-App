import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:heroicons/heroicons.dart';
import 'package:shopping_app/constant/app_color.dart';
import 'package:shopping_app/constant/app_text_style.dart';
import 'package:shopping_app/domain/entities/product_entity.dart';
import 'package:shopping_app/domain/usecases/search_product_usecase.dart';
import 'package:shopping_app/presentation/providers/bloc/product_bloc.dart';
import 'package:shopping_app/presentation/widgets/product_card_widget.dart';

class HomePage extends StatefulWidget {
  List<ProductEntity> products;

  HomePage({required this.products, super.key});

  @override
  State<HomePage> createState() => _HomePageState(products);
}

class _HomePageState extends State<HomePage> {
  List<ProductEntity> filteredProducts;
  TextEditingController searchController = TextEditingController();
  _HomePageState(this.filteredProducts);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        height: double.maxFinite,
        width: double.maxFinite,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8),
                height: 50,
                width: double.maxFinite,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  border: Border.all(color: AppColor.blackMana, width: 2),
                ),
                child: TextField(
                  controller: searchController,
                  onChanged: (value) {
                    setState(() {
                      filteredProducts = SearchProductUsecase().searchProducts(
                        searchController.text,
                        widget.products,
                      );
                    });
                  },
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    icon: HeroIcon(
                      HeroIcons.magnifyingGlass,
                      color: AppColor.blackMana,
                    ),
                    hint: Text(
                      'Search Product',
                      style: AppTextStyle.contentStyle,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Column(
                children: List.generate(filteredProducts.length, (index) {
                  return InkWell(
                    onTap: () => showModalBottomSheet(
                      context: context,
                      builder: (context) => Container(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        height: 1200,
                        width: double.maxFinite,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadiusGeometry.vertical(
                            top: Radius.circular(50),
                          ),
                          color: Colors.white,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 20),
                            Align(
                              alignment: Alignment.center,
                              child: SizedBox(
                                height: 160,
                                child: Image.network(
                                  filteredProducts[index].image,
                                ),
                              ),
                            ),
                            SizedBox(height: 15),
                            Text(
                              filteredProducts[index].title +
                                  ' (${filteredProducts[index].category})',
                              style: AppTextStyle.contentStyle,
                            ),
                            SizedBox(height: 4),
                            Text(
                              "Price: \$ ${filteredProducts[index].price}",
                              style: AppTextStyle.subContentStyle,
                            ),
                            SizedBox(height: 4),
                            Text(
                              "Rating: ${filteredProducts[index].rate}/5.0 (${widget.products[index].count})",
                              style: AppTextStyle.subContentStyle,
                            ),
                            SizedBox(height: 10),
                            Text(
                              "   ${filteredProducts[index].description}",
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.justify,
                              style: AppTextStyle.smallContentStyle,
                            ),
                            Spacer(),
                            Container(
                              padding: EdgeInsets.all(5),
                              height: 60,
                              width: 200,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                border: Border.all(
                                  width: 2,
                                  color: AppColor.aquarius,
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  HeroIcon(
                                    HeroIcons.shoppingCart,
                                    color: AppColor.aquarius,
                                    size: 30,
                                  ),
                                  Text(
                                    'Add to Cart',
                                    style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.w500,
                                      color: AppColor.aquarius,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 20),
                          ],
                        ),
                      ),
                    ),
                    child: ProductCardWidget(
                      productName: filteredProducts[index].title,
                      image: filteredProducts[index].image,
                      price: filteredProducts[index].price,
                    ),
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

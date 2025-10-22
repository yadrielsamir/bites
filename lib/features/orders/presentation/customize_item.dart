import 'package:bites/app/theme/app_colors.dart';
import 'package:bites/app/theme/app_spacing.dart';
import 'package:bites/features/orders/presentation/widgets/item_info_modal.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sizer/sizer.dart';

class Topping {
  final String name;
  final double price;
  const Topping(this.name, this.price);
}

class CustomizeItem extends StatefulWidget {
  final String item;
  final double price;
  final String description;

  const CustomizeItem({
    super.key,
    required this.item,
    required this.price,
    required this.description,
  });

  @override
  State<CustomizeItem> createState() => _CustomizeItemState();
}

class _CustomizeItemState extends State<CustomizeItem> {
  int count = 1;

  final List<Topping> toppings = const [
    Topping('Bacon', 0.60),
    Topping('Sour Cream', 0.50),
    Topping('Onions', 0.35),
    Topping('Potato Sticks', 0.40),
  ];

  final List<String> ingredients = const ['Plantains', 'Cheese', 'Chicken'];

  final Set<String> selectedAdds = {};
  final Set<String> selectedRemoves = {};

  double get addOnsSubtotal {
    double s = 0;
    for (final t in toppings) {
      if (selectedAdds.contains(t.name)) s += t.price;
    }
    return s;
  }

  double get total => (widget.price + addOnsSubtotal) * count;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundWhite,
      appBar: _appBar(context),
      bottomNavigationBar: _bottomBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: AppSpacing.sm),
          child: Column(
            children: [
              SizedBox(height: 2.h),
              Text(widget.item, style: TextStyle(fontSize: 20.sp)),
              SizedBox(height: 2.h),
              _itemCount(),
              SizedBox(height: 4.h),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Customize your order',
                        style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 1.h),

                      _toppings('Add Toppings'),
                      ...toppings.map(
                        (t) => selectRow(
                          item: t.name,
                          price: t.price,
                          prefix: 'ADD',
                          selected: selectedAdds.contains(t.name),
                          onTap: () {
                            setState(() {
                              selectedRemoves.remove(t.name);
                              if (!selectedAdds.add(t.name)) {
                                selectedAdds.remove(t.name);
                              }
                            });
                          },
                        ),
                      ),

                      _toppings('Remove Toppings'),
                      ...ingredients.map(
                        (t) => selectRow(
                          item: t,
                          price: 0,
                          prefix: 'REMOVE',
                          selected: selectedRemoves.contains(t),
                          onTap: () {
                            setState(() {
                              selectedAdds.remove(t);
                              if (!selectedRemoves.add(t)) {
                                selectedRemoves.remove(t);
                              }
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 10.h),
            ],
          ),
        ),
      ),
    );
  }

  PreferredSizeWidget _appBar(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.white,
      surfaceTintColor: Colors.transparent,
      scrolledUnderElevation: 0,
      elevation: 0,
      leading: IconButton(
        onPressed: () => context.pop(),
        icon: Icon(Icons.arrow_back, color: AppColors.uprmGreen, size: 20.sp),
      ),
      actions: [
        CupertinoButton(
          padding: EdgeInsets.only(right: 1.w),
          onPressed: _showItemInfoSheet,
          child: Icon(
            Icons.info_outline,
            color: AppColors.uprmGreen,
            size: 20.sp,
          ),
        ),
      ],
    );
  }

  Widget _itemCount() {
    return Container(
      height: 4.h,
      width: 30.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100.sp),
        border: Border.all(color: AppColors.uprmGreen),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CupertinoButton(
            onPressed: () {
              if (count > 1) setState(() => count--);
            },
            padding: EdgeInsets.zero,
            child: Icon(Icons.remove, color: AppColors.uprmGreen, size: 20.sp),
          ),
          Text(
            count.toString(),
            style: TextStyle(fontSize: 20.sp, color: AppColors.uprmGreen),
          ),
          CupertinoButton(
            onPressed: () => setState(() => count++),
            padding: EdgeInsets.zero,
            child: Icon(Icons.add, color: AppColors.uprmGreen, size: 20.sp),
          ),
        ],
      ),
    );
  }

  Widget _toppings(String title) {
    return Row(
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
        ),
        SizedBox(width: 2.w),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100.sp),
            color: AppColors.lightGrey,
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.w),
            child: Text('Optional', style: TextStyle(fontSize: 14.sp)),
          ),
        ),
      ],
    );
  }

  Widget selectRow({
    required String item,
    required double price,
    required String prefix,
    required bool selected,
    required VoidCallback onTap,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: AppSpacing.xs),
      child: Row(
        children: [
          GestureDetector(
            onTap: onTap,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 150),
              height: 3.h,
              width: 3.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.sp),
                border: Border.all(color: AppColors.uprmGreen, width: 0.5.w),
                color: selected ? AppColors.uprmGreen : Colors.transparent,
              ),
              child: selected
                  ? Icon(
                      Icons.check,
                      size: 18.sp,
                      color: AppColors.backgroundWhite,
                    )
                  : null,
            ),
          ),
          SizedBox(width: 4.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '$prefix $item',
                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500),
              ),
              if (price != 0)
                Text(
                  '\$${price.toStringAsFixed(2)}',
                  style: TextStyle(fontSize: 15.sp, color: AppColors.darkGrey),
                ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _bottomBar() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: AppSpacing.sm, vertical: 1.6.h),
      decoration: BoxDecoration(
        color: AppColors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 10,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: SafeArea(
        top: false,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Text(
                'Total: \$${total.toStringAsFixed(2)}',
                style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600),
              ),
            ),
            SizedBox(
              height: 5.2.h,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.uprmGreen,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100.sp),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 6.w),
                ),
                onPressed: () {
                  // TODO: Handle add to cart
                },
                child: Text(
                  'Add to cart',
                  style: TextStyle(
                    color: AppColors.backgroundWhite,
                    fontSize: 16.sp,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showItemInfoSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      backgroundColor: AppColors.white,
      barrierColor: Colors.black.withOpacity(0.25),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (context) => ItemInfoModal(
        item: widget.item,
        price: widget.price,
        description: widget.description,
        ingredients: ingredients,
      ),
    );
  }
}

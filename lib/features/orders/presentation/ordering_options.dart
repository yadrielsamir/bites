import 'package:bites/app/theme/app_colors.dart';
import 'package:bites/app/theme/app_spacing.dart';
import 'package:bites/features/orders/domain/models/category.dart';
import 'package:bites/features/orders/presentation/widgets/menu_categories_modal.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sizer/sizer.dart';

class OrderingOptions extends StatefulWidget {
  const OrderingOptions({super.key});

  @override
  State<OrderingOptions> createState() => _OrderingOptionsState();
}

class _OrderingOptionsState extends State<OrderingOptions> {
  final List<String> options = [
    'yams',
    'burgers',
    'chicken',
    'sides',
    'beverages',
  ];

  final ScrollController _listCtrl = ScrollController();
  late final Map<String, GlobalKey> _sectionKeys;

  int _selected = 0;

  @override
  void initState() {
    super.initState();
    _sectionKeys = {for (final o in options) o: GlobalKey()};
  }

  Future<void> _goTo(String option, int index) async {
    setState(() => _selected = index);

    final ctx = _sectionKeys[option]!.currentContext;
    if (ctx == null) return;

    await Scrollable.ensureVisible(
      ctx,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      alignment: 0.0,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundWhite,
      appBar: _appBar(context),
      body: Column(
        children: [
          _foodSpotImage(),

          Container(
            height: 6.h,
            width: double.infinity,
            color: AppColors.uprmGreen,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(horizontal: AppSpacing.sm),
              child: Row(
                children: [
                  CupertinoButton(
                    onPressed: () async {
                      final categories = options
                          .map((name) => Category(name, 0))
                          .toList();

                      final picked = await showMenuCategoriesModal(
                        context,
                        categories: categories,
                        selectedIndex: _selected,
                      );

                      if (picked != null) {
                        _goTo(options[picked], picked);
                      }
                    },
                    padding: EdgeInsets.zero,
                    child: Icon(
                      Icons.format_list_bulleted,
                      color: AppColors.white,
                      size: 20.sp,
                    ),
                  ),
                  SizedBox(width: 3.w),
                  for (int i = 0; i < options.length; i++) ...[
                    _CategoryChip(
                      label: options[i],
                      selected: _selected == i,
                      onTap: () => _goTo(options[i], i),
                    ),
                    SizedBox(width: 4.w),
                  ],
                ],
              ),
            ),
          ),

          Expanded(
            child: SingleChildScrollView(
              controller: _listCtrl,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: AppSpacing.sm),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    for (final o in options) ...[
                      _SectionHeader(key: _sectionKeys[o], title: o),
                      const _MenuItem(title: 'Classic', price: '\$8.99'),
                      const _MenuItem(title: 'La Jibarita', price: '\$9.49'),
                      const _MenuItem(title: 'La Favorita', price: '\$10.69'),
                      const _MenuItem(title: 'El Guerrero', price: '\$8.79'),
                      SizedBox(height: 2.h),
                    ],
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

PreferredSizeWidget _appBar(BuildContext context) {
  return AppBar(
    backgroundColor: AppColors.backgroundWhite,
    leading: IconButton(
      onPressed: () => context.pop(),
      icon: Icon(Icons.arrow_back, color: AppColors.uprmGreen, size: 20.sp),
    ),
    actions: [
      CupertinoButton(
        onPressed: () {},
        padding: EdgeInsets.zero,
        child: Icon(Icons.search, color: AppColors.uprmGreen, size: 20.sp),
      ),
      CupertinoButton(
        onPressed: () {},
        padding: EdgeInsets.zero,
        child: Icon(
          Icons.shopping_cart_outlined,
          color: AppColors.uprmGreen,
          size: 20.sp,
        ),
      ),
    ],
  );
}

Widget _foodSpotImage() {
  return Container(
    width: double.infinity,
    height: 35.h,
    color: AppColors.lightGrey,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          'Food Spot Name',
          style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w600),
        ),
        SizedBox(height: 0.5.h),
        const Text('Edf. Ernesto Martinez Nadal'),
        const Text('Open hours: 11:00 am - 5:00 pm'),
        SizedBox(height: 2.h),
      ],
    ),
  );
}

class _CategoryChip extends StatelessWidget {
  const _CategoryChip({
    required this.label,
    required this.selected,
    required this.onTap,
  });

  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        padding: EdgeInsets.symmetric(horizontal: 3.6.w, vertical: 0.8.h),
        decoration: BoxDecoration(
          color: selected ? AppColors.white : Colors.transparent,
          borderRadius: BorderRadius.circular(999),
          border: selected
              ? Border.all(color: AppColors.white, width: 0)
              : null,
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 16.sp,
            color: selected ? AppColors.uprmGreen : AppColors.white,
            fontWeight: selected ? FontWeight.w600 : FontWeight.w400,
          ),
        ),
      ),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  const _SectionHeader({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 2.2.h, bottom: 1.2.h),
      child: Text(
        title,
        style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w700),
      ),
    );
  }
}

class _MenuItem extends StatelessWidget {
  const _MenuItem({required this.title, required this.price});

  final String title;
  final String price;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: TextStyle(fontSize: 16.sp)),
            SizedBox(height: 1.h),
            Text(price, style: TextStyle(fontSize: 16.sp)),
          ],
        ),
        Divider(height: 2.h),
      ],
    );
  }
}

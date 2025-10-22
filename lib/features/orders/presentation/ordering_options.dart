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

  final ScrollController _scrollCtrl = ScrollController();
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

    // Works with slivers as long as each section has a context/key.
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
      body: CustomScrollView(
        controller: _scrollCtrl,
        slivers: [
          // Top hero / image
          SliverToBoxAdapter(child: _foodSpotImage()),

          // Pinned categories bar
          SliverPersistentHeader(
            pinned: true,
            delegate: _CategoriesHeaderDelegate(
              minExtentHeight: 7.h,
              maxExtentHeight: 7.h,
              child: _CategoriesBar(
                options: options,
                selected: _selected,
                onOpenModal: () async {
                  final categories = options
                      .map((n) => Category(n, 0))
                      .toList();
                  final picked = await showMenuCategoriesModal(
                    context,
                    categories: categories,
                    selectedIndex: _selected,
                  );
                  if (picked != null) _goTo(options[picked], picked);
                },
                onTapChip: (i) => _goTo(options[i], i),
              ),
            ),
          ),

          SliverList(
            delegate: SliverChildListDelegate([
              Padding(
                padding: EdgeInsets.symmetric(horizontal: AppSpacing.sm),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    for (final o in options) ...[
                      _SectionHeader(key: _sectionKeys[o], title: o),
                      _MenuItem(
                        title: 'Classic',
                        price: '\$8.99',
                        onTap: () => context.pushNamed(
                          'customize_item',
                          extra: {
                            'item': 'Classic',
                            'description': 'La mejor comida del mundo',
                            'price': 8.99,
                          },
                        ),
                      ),
                      _MenuItem(
                        title: 'La Jibarita',
                        price: '\$9.49',
                        onTap: () => context.pushNamed(
                          'customize_item',

                          extra: {
                            'item': 'La Jibarita',
                            'description': 'La mejor comida del mundo',
                            'price': 9.49,
                          },
                        ),
                      ),
                      _MenuItem(
                        title: 'La Favorita',
                        price: '\$10.69',
                        onTap: () => context.pushNamed(
                          'customize_item',
                          extra: {
                            'item': 'La Favorita',
                            'description': 'La mejor comida del mundo',
                            'price': 10.69,
                          },
                        ),
                      ),
                      _MenuItem(
                        title: 'El Guerrero',
                        price: '\$8.79',
                        onTap: () => context.pushNamed(
                          'customize_item',
                          extra: {
                            'item': 'El Guerrero',
                            'description': 'La mejor comida del mundo',
                            'price': 8.79,
                          },
                        ),
                      ),
                      SizedBox(height: 1.h),
                    ],
                  ],
                ),
              ),
              SizedBox(height: 2.h),
            ]),
          ),
        ],
      ),
    );
  }
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
          'Batatas Potatoes',
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

class _CategoriesHeaderDelegate extends SliverPersistentHeaderDelegate {
  _CategoriesHeaderDelegate({
    required this.minExtentHeight,
    required this.maxExtentHeight,
    required this.child,
  });

  final double minExtentHeight;
  final double maxExtentHeight;
  final Widget child;

  @override
  double get minExtent => minExtentHeight;

  @override
  double get maxExtent => maxExtentHeight;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return Container(
      color: AppColors.uprmGreen, // keep background while pinned
      child: child,
    );
  }

  @override
  bool shouldRebuild(covariant _CategoriesHeaderDelegate oldDelegate) {
    return oldDelegate.minExtentHeight != minExtentHeight ||
        oldDelegate.maxExtentHeight != maxExtentHeight ||
        oldDelegate.child != child;
  }
}

class _CategoriesBar extends StatelessWidget {
  const _CategoriesBar({
    required this.options,
    required this.selected,
    required this.onOpenModal,
    required this.onTapChip,
  });

  final List<String> options;
  final int selected;
  final VoidCallback onOpenModal;
  final void Function(int index) onTapChip;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 7.h,
      width: double.infinity,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: AppSpacing.sm),
        child: Row(
          children: [
            CupertinoButton(
              onPressed: onOpenModal,
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
                selected: selected == i,
                onTap: () => onTapChip(i),
              ),
              SizedBox(width: 4.w),
            ],
          ],
        ),
      ),
    );
  }
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
        style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w700),
      ),
    );
  }
}

class _MenuItem extends StatelessWidget {
  const _MenuItem({required this.title, required this.price, this.onTap});

  final String title;
  final String price;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: TextStyle(fontSize: 16.sp)),
          SizedBox(height: 1.5.h),
          Text(price, style: TextStyle(fontSize: 16.sp)),
          Divider(height: 2.h, color: Colors.grey[300]),
        ],
      ),
    );
  }
}

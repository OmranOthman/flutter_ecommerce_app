import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/core/widgets/custom_bottom_sheet.dart';
import 'package:flutter_ecommerce_app/core/widgets/custom_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VendorPage extends StatefulWidget {
  const VendorPage({super.key});

  @override
  State<VendorPage> createState() => _VendorPageState();
}

class _VendorPageState extends State<VendorPage> {
  String _selectedCategory = 'All';
  final List<String> categories = [
    'All',
    'Latest',
    'Most Popular',
    'Cheapest',
  ];
  final TextEditingController _searchController = TextEditingController();

  final List<Map<String, dynamic>> products = [
    {
      'name': 'Bag Box 283',
      'designer': 'Lisa Robber',
      'price': '\$163.00',
      'image':
      'https://a.1stdibscdn.com/archivesE/upload/1121189/v_116288621729853567193/11628862_datamatics.jpg?disable=upscale&auto=webp&quality=60&width=1400',
    },
    {
      'name': 'Box Biggan 992',
      'designer': 'Gazuna Resika',
      'price': '\$163.00',
      'image':
      'https://a.1stdibscdn.com/archivesE/upload/1121189/v_116288621729853567193/11628862_datamatics.jpg?disable=upscale&auto=webp&quality=60&width=1400',
    },
    {
      'name': 'Big Biggan 283',
      'designer': 'Gazuna Resika',
      'price': '\$134.00',
      'image':
      'https://a.1stdibscdn.com/archivesE/upload/1121189/v_116288621729853567193/11628862_datamatics.jpg?disable=upscale&auto=webp&quality=60&width=1400',
    },
    {
      'name': 'Bog Bag 223',
      'designer': 'Lisa Robber',
      'price': '\$105.00',
      'image':
      'https://a.1stdibscdn.com/archivesE/upload/1121189/v_116288621729853567193/11628862_datamatics.jpg?disable=upscale&auto=webp&quality=60&width=1400',
    },
  ];

  void _showFilterOptions() {
    double minPrice = 0;
    double maxPrice = 80;
    String selectedColor = 'Black';
    String selectedLocation = 'San Diego';

    final List<String> colors = ['Black', 'White', 'Red', 'Blue', 'Green', 'Yellow', 'Pink'];
    final List<String> locations = ['San Diego', 'New York', 'Amsterdam', 'London', 'Paris', 'Tokyo'];

    CustomBottomSheet.show(
      context: context,
      child: SingleChildScrollView(
        padding: EdgeInsets.only(bottom: 20.h),
        child: StatefulBuilder(
          builder: (BuildContext context, StateSetter setModalState) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Text(
                    'Filter By',
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 24.h),

                // Price Filter
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Text(
                    'Price',
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 12.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      trackHeight: 4.h,
                      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 8.r),
                      overlayShape: RoundSliderOverlayShape(overlayRadius: 12.r),
                      activeTrackColor: Theme.of(context).primaryColor,
                      inactiveTrackColor: Colors.grey[300],
                      thumbColor: Colors.white,
                      overlayColor: Theme.of(context).primaryColor.withOpacity(0.2),
                    ),
                    child: RangeSlider(
                      values: RangeValues(minPrice, maxPrice),
                      min: 0,
                      max: 200,
                      divisions: 10,
                      labels: RangeLabels(
                        '\$${minPrice.toInt()}',
                        '\$${maxPrice.toInt()}',
                      ),
                      onChanged: (RangeValues values) {
                        setModalState(() {
                          minPrice = values.start;
                          maxPrice = values.end;
                        });
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('\$0', style: TextStyle(color: Colors.grey[600], fontSize: 12.sp)),
                      Text('\$200', style: TextStyle(color: Colors.grey[600], fontSize: 12.sp)),
                    ],
                  ),
                ),
                SizedBox(height: 24.h),

                // Color Filter
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Text(
                    'Color',
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 12.h),
                SizedBox(
                  height: 50.h,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    itemCount: colors.length,
                    itemBuilder: (context, index) {
                      final color = _getColorFromString(colors[index]);
                      final isSelected = selectedColor == colors[index];
                      return Padding(
                        padding: EdgeInsets.only(right: 16.w),
                        child: GestureDetector(
                          onTap: () {
                            setModalState(() {
                              selectedColor = colors[index];
                            });
                          },
                          child: Column(
                            children: [
                              Container(
                                width: 32.w,
                                height: 32.h,
                                decoration: BoxDecoration(
                                  color: color,
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: isSelected
                                        ? Theme.of(context).primaryColor
                                        : Colors.grey[300]!,
                                    width: isSelected ? 2 : 1,
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.1),
                                      blurRadius: 4,
                                      spreadRadius: 1,
                                    )
                                  ],
                                ),
                                child: isSelected
                                    ? Icon(Icons.check, size: 16.sp, color: Theme.of(context).primaryColor)
                                    : null,
                              ),
                              SizedBox(height: 4.h),
                              if (isSelected)
                                Container(
                                  width: 6.w,
                                  height: 6.h,
                                  decoration: BoxDecoration(
                                    color: Theme.of(context).primaryColor,
                                    shape: BoxShape.circle,
                                  ),
                                ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(height: 24.h),

                // Location Filter
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Text(
                    'Location',
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 12.h),
                SizedBox(
                  height: 50.h,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    itemCount: locations.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(right: 12.w),
                        child: ChoiceChip(
                          label: Text(
                            locations[index],
                            style: TextStyle(fontSize: 12.sp),
                          ),
                          selected: selectedLocation == locations[index],
                          onSelected: (selected) {
                            setModalState(() {
                              selectedLocation = locations[index];
                            });
                          },
                          selectedColor: Theme.of(context).primaryColor,
                          labelStyle: TextStyle(
                            color: selectedLocation == locations[index]
                                ? Colors.white
                                : Colors.black,
                          ),
                          side: BorderSide(
                            color: selectedLocation == locations[index]
                                ? Theme.of(context).primaryColor
                                : Colors.grey[300]!,
                          ),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(height: 32.h),

                // Apply Button
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: CustomButton(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    text: 'Apply Filter',
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Color _getColorFromString(String colorName) {
    switch (colorName.toLowerCase()) {
      case 'black':
        return Colors.black;
      case 'white':
        return Colors.white;
      case 'red':
        return Colors.red;
      case 'blue':
        return Colors.blue;
      case 'green':
        return Colors.green;
      case 'yellow':
        return Colors.yellow;
      case 'pink':
        return Colors.pink;
      default:
        return Colors.grey;
    }
  }

  Widget _buildProductGridItem(Map<String, dynamic> product) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(top: Radius.circular(12.r)),
                image: DecorationImage(
                  image: NetworkImage(product['image']),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  product['name'],
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 4.h),
                Text(
                  product['designer'],
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(height: 8.h),
                Text(
                  product['price'],
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, size: 20.sp),
          onPressed: () => Navigator.pop(context),
        ),
        title: TextField(
          controller: _searchController,
          style: TextStyle(fontSize: 14.sp),
          decoration: InputDecoration(
            hintText: 'Search...',
            hintStyle: TextStyle(fontSize: 14.sp),
            border: InputBorder.none,
            prefixIcon: Icon(Icons.search, size: 20.sp),
            suffixIcon: IconButton(
              icon: Icon(Icons.filter_list, size: 20.sp),
              onPressed: _showFilterOptions,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 24.h),
              Text(
                'All',
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8.h),
              SizedBox(
                height: 40.h,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(right: 12.w),
                      child: ChoiceChip(
                        label: Text(
                          categories[index],
                          style: TextStyle(fontSize: 12.sp),
                        ),
                        selected: _selectedCategory == categories[index],
                        onSelected: (selected) {
                          setState(() {
                            _selectedCategory = categories[index];
                          });
                        },
                        selectedColor: Theme.of(context).primaryColor,
                        labelStyle: TextStyle(
                          color: _selectedCategory == categories[index]
                              ? Colors.white
                              : Colors.black,
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 24.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CircleAvatar(
                    radius: 30.r,
                    backgroundImage: NetworkImage('https://via.placeholder.com/60'),
                  ),
                  SizedBox(width: 16.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Uphox Bag', //name vendor
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 4.h),
                        Text(
                          '104 Products  1.3k Followers',
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Icon(
                    Icons.arrow_back_ios_new,
                    size: 20.sp,
                    textDirection: TextDirection.rtl,
                  ),
                ],
              ),
              SizedBox(height: 24.h),
              GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16.w,
                  mainAxisSpacing: 16.h,
                  childAspectRatio: 0.75,
                ),
                itemCount: products.length,
                itemBuilder: (context, index) {
                  return _buildProductGridItem(products[index]);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}
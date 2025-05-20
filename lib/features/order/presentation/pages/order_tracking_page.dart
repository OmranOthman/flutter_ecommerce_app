import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/core/constants/app_colors.dart';
import 'package:timeline_tile/timeline_tile.dart';

class OrderTrackingPage extends StatelessWidget {
  const OrderTrackingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Order Tracking",
          style: textTheme.headlineMedium,
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          SizedBox(
            height: 300,
            width: double.infinity,
            child: Image.asset(
              'assets/map_placeholder.png',
              fit: BoxFit.cover,
            ),
          ),
          DraggableScrollableSheet(
            initialChildSize: 0.45,
            minChildSize: 0.45,
            maxChildSize: 0.85,
            builder: (context, scrollController) {
              return Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                decoration: BoxDecoration(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 10,
                      offset: Offset(0, -4),
                    ),
                  ],
                ),
                child: ListView(
                  controller: scrollController,
                  children: [
                    Center(
                      child: Container(
                        width: 40,
                        height: 4,
                        margin: const EdgeInsets.only(bottom: 12),
                        decoration: BoxDecoration(
                          color: Theme.of(context).dividerColor,
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),

                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Theme.of(context).cardColor,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: Theme.of(context).dividerColor),
                      ),
                      child: ListTile(
                        leading: const CircleAvatar(
                          radius: 24,
                          backgroundImage: AssetImage('/.png'),
                        ),
                        title: Text(
                          'Alexander Jr',
                          style: textTheme.bodyLarge,
                        ),
                        subtitle: Text(
                          'Courier',
                          style: textTheme.bodyMedium,
                        ),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.public),
                              onPressed: () {},
                              color: Theme.of(context).primaryColor,
                            ),
                            IconButton(
                              icon: const Icon(Icons.call_outlined),
                              onPressed: () {},
                              color: Theme.of(context).primaryColor,
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),

                    Text(
                      'Progress of your Order',
                      style: textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 16),

                    // Timeline
                    _buildTimelineItem(
                      context,
                      isFirst: true,
                      icon: Icons.store,
                      title: 'Unbox Bag',
                      subtitle: 'Shop • 02:50PM',
                    ),
                    _buildTimelineItem(
                      context,
                      icon: Icons.local_shipping,
                      title: 'On the way',
                      subtitle: 'Delivery • 03:20PM',
                    ),
                    _buildTimelineItem(
                      context,
                      isLast: true,
                      icon: Icons.location_pin,
                      title: '5482 Adobe Falls Rd #15, San Diego...',
                      subtitle: 'House • 03:45PM',
                    ),

                    const SizedBox(height: 24),

                    SizedBox(
                      width: double.infinity,
                      child: OutlinedButton(
                        onPressed: () {},
                        style: OutlinedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          side:  BorderSide(color: Theme.of(context).primaryColor,),
                          padding: const EdgeInsets.symmetric(vertical: 16),
                        ),
                        child: Text(
                          'Mark as Done',
                          style: textTheme.labelLarge?.copyWith(color: Theme.of(context).primaryColor,),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildTimelineItem(
      BuildContext context, {
        required IconData icon,
        required String title,
        required String subtitle,
        bool isFirst = false,
        bool isLast = false,
      }) {
    //final textTheme = Theme.of(context).textTheme;

    return TimelineTile(
      isFirst: isFirst,
      isLast: isLast,
      indicatorStyle: IndicatorStyle(
        width: 30,
        height: 30,
        indicator: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Theme.of(context).primaryColor,
          ),
          child: Icon(icon, size: 16, color: Colors.white),
        ),
      ),
      beforeLineStyle:  LineStyle(
        color: Theme.of(context).primaryColor,
        thickness: 2,
      ),
      endChild: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold)),
            const SizedBox(height: 4),
            Text(subtitle, style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Theme.of(context).disabledColor)),
          ],
        ),
      ),
    );
  }
}

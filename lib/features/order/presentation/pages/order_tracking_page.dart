import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';

class OrderTrackingPage extends StatelessWidget {
  const OrderTrackingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Order Tracking"),
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
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
                  boxShadow: [
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
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),

                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: Colors.grey.shade300),
                      ),
                      child: ListTile(
                        leading: const CircleAvatar(
                          radius: 24,
                          backgroundImage: AssetImage('/.png'),
                        ),
                        title: const Text('Alexander Jr'),
                        subtitle: const Text('Courier'),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.public),
                              onPressed: () {},
                            ),
                            IconButton(
                              icon: const Icon(Icons.call_outlined),
                              onPressed: () {},
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),

                    const Text(
                      'Progress of your Order',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    const SizedBox(height: 16),

                    // Timeline
                    _buildTimelineItem(
                      isFirst: true,
                      icon: Icons.store,
                      title: 'Unbox Bag',
                      subtitle: 'Shop • 02:50PM',
                    ),
                    _buildTimelineItem(
                      icon: Icons.local_shipping,
                      title: 'On the way',
                      subtitle: 'Delivery • 03:20PM',
                    ),
                    _buildTimelineItem(
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
                          side: const BorderSide(color: Colors.deepPurple),
                          padding: const EdgeInsets.symmetric(vertical: 16),
                        ),
                        child: const Text(
                          'Mark as Done',
                          style:
                              TextStyle(fontSize: 16, color: Colors.deepPurple),
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

  Widget _buildTimelineItem({
    required IconData icon,
    required String title,
    required String subtitle,
    bool isFirst = false,
    bool isLast = false,
  }) {
    return TimelineTile(
      isFirst: isFirst,
      isLast: isLast,
      indicatorStyle: IndicatorStyle(
        width: 30,
        height: 30,
        indicator: Container(
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Color(0xFF6A4DFF),
          ),
          child: Icon(icon, size: 16, color: Colors.white),
        ),
      ),
      beforeLineStyle: const LineStyle(
        color: Color(0xFF6A4DFF),
        thickness: 2,
      ),
      endChild: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 4),
            Text(subtitle, style: const TextStyle(color: Colors.grey)),
          ],
        ),
      ),
    );
  }
}

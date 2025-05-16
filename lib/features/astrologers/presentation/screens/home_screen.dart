import 'package:astrosagga_assignment/features/astrologers/presentation/providers/astrologer_provider.dart';
import 'package:astrosagga_assignment/features/astrologers/presentation/screens/astrologer_details_screen.dart';
import 'package:astrosagga_assignment/features/astrologers/presentation/widgets/astrologer_card.dart';
import 'package:astrosagga_assignment/features/astrologers/presentation/widgets/live_astrologer_item.dart';
import 'package:astrosagga_assignment/features/astrologers/presentation/widgets/zodiac_category_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// Removed go_router import



class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print('🏠 HomeScreen loaded');  // Add this

    final astrologers = ref.watch(astrologersProvider);

    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            // App Bar
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      'assets/images/app_logo.png',
                      width: 40,
                      height: 40,
                    ),
                    Row(
                      children: [
                        Image.asset(
                          'assets/icons/search.png',
                          width: 24,
                          height: 24,
                        ),
                        const SizedBox(width: 16),
                        Image.asset(
                          'assets/icons/notification.png',
                          width: 24,
                          height: 24,
                        ),
                        const SizedBox(width: 16),
                        Image.asset(
                          'assets/images/trailing_appbar.png',
                          width: 80,
                          height: 40,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            // Zodiac Categories
            SliverToBoxAdapter(
              child: SizedBox(
                height: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5.0),
                        child: ZodiacCategoryItem(
                          image: 'assets/images/matchmaking.png',
                          title: 'Match Making',
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5.0),
                        child: ZodiacCategoryItem(
                          image: 'assets/images/subh_mahurat.png',
                          title: 'Subh Mahurat',
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5.0),
                        child: ZodiacCategoryItem(
                          image: 'assets/images/horoscope.png',
                          title: 'Horoscope',
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5.0),
                        child: ZodiacCategoryItem(
                          image: 'assets/images/kundali.png',
                          title: 'Kundali',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),


            // Banner
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(left:16.0,right:16,bottom:16),
                child: Container(
                  height: 180,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: const DecorationImage(
                      image: AssetImage('assets/images/banner.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),

            // Live Astrologers
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Container(
                      height: 150,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          LiveAstrologerItem(
                            name: 'Astro Vikram',
                            profileImage: 'assets/images/astrologer1.png',
                            viewers: 120,
                          ),
                          const SizedBox(width: 16),
                          LiveAstrologerItem(
                            name: 'Acharya Divya',
                            profileImage: 'assets/images/astrologer3.png',
                            viewers: 85,
                          ),
                          const SizedBox(width: 16),
                          LiveAstrologerItem(
                            name: 'Dr. Maya Joshi',
                            profileImage: 'assets/images/astrologer11.png',
                            viewers: 65,
                          ),
                          const SizedBox(width: 16),
                          LiveAstrologerItem(
                            name: 'Swami Vishnu',
                            profileImage: 'assets/images/astrologer9.png',
                            viewers: 210,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Our Experts Section
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Our experts',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Image.asset(
                      'assets/icons/filter.png',
                      width: 24,
                      height: 24,
                    ),
                  ],
                ),
              ),
            ),

            // Astrologer Grid
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              sliver: SliverGrid(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.7,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                ),
                delegate: SliverChildBuilderDelegate(
                      (context, index) {
                    final astrologer = astrologers[index];
                    return AstrologerCard(
                      astrologer: astrologer,
                      onTap: () {
                        // Replace go_router with Navigator.push
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AstrologerDetailScreen(
                              astrologerId: astrologer.id,
                            ),
                          ),
                        );
                      },
                    );
                  },
                  childCount: astrologers.length,
                ),
              ),
            ),

            // Bottom spacing
            const SliverToBoxAdapter(
              child: SizedBox(height: 80),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        height: 80,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 2.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  InkWell(
                    onTap: () {},
                    child: Image.asset(
                      'assets/navbar_icons/home.png',
                      width: 24,
                      height: 24,
                      color: const Color(0xFF0054DC),
                    ),
                  ),
                  const SizedBox(height: 4),
                  const Text('Home', style: TextStyle(fontSize: 12)),
                ],
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  InkWell(
                    onTap: () {},
                    child: Image.asset(
                      'assets/navbar_icons/courses.png',
                      width: 24,
                      height: 24,
                    ),
                  ),
                  const SizedBox(height: 4),
                  const Text('Course', style: TextStyle(fontSize: 12)),
                ],
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  InkWell(
                    onTap: () {},
                    child: Image.asset(
                      'assets/navbar_icons/shop.png',
                      width: 24,
                      height: 24,
                    ),
                  ),
                  const SizedBox(height: 4),
                  const Text('Shops', style: TextStyle(fontSize: 12)),
                ],
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  InkWell(
                    onTap: () {},
                    child: Image.asset(
                      'assets/navbar_icons/profile.png',
                      width: 24,
                      height: 24,
                    ),
                  ),
                  const SizedBox(height: 4),
                  const Text('Profile', style: TextStyle(fontSize: 12)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
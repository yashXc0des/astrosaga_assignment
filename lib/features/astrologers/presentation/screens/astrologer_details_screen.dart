import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/astrologer_provider.dart';

class AstrologerDetailScreen extends ConsumerWidget {
  final String astrologerId;

  const AstrologerDetailScreen({
    required this.astrologerId,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final astrologerAsyncValue = ref.watch(astrologerDetailProvider(astrologerId));

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        elevation: 0,
        title: astrologerAsyncValue.when(
          data: (astrologer) {
            return Row(
              children: [
                Text(
                  astrologer.name,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(width: 8),
                Container(
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                    color: astrologer.isOnline ? Colors.green : Colors.red,
                    shape: BoxShape.circle,
                  ),
                ),
              ],
            );
          },
          loading: () => const Text('Loading...'),
          error: (_, __) => const Text('Error'),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.share_outlined, color: Colors.white),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.more_vert, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: astrologerAsyncValue.when(
        data: (astrologer) {
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Profile Image
                Center(
                  child: Container(
                    width: 140,
                    height: 130,
                    padding: const EdgeInsets.only(
                      top: 10,
                      right: 10,
                      left: 10,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        astrologer.profileImage,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),

                // Name
                Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(
                      astrologer.name,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),

                // Stats Container
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      // First row (blue background)
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16.0,
                          vertical: 12.0,
                        ),
                        decoration: const BoxDecoration(
                          color: Color(0xFFEBF3FF),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                const Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                  size: 18,
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  '${astrologer.rating}',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                const Icon(
                                  Icons.work_outline,
                                  size: 18,
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  '${astrologer.experience} years',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                const Icon(
                                  Icons.people_outline,
                                  size: 18,
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  '${astrologer.followers}',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),

                      // Second row (gray background)
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16.0,
                          vertical: 12.0,
                        ),
                        decoration: const BoxDecoration(
                          color: Color(0xFFF7F7F7),
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                const Icon(
                                  Icons.phone_outlined,
                                  size: 18,
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  astrologer.totalCallTime,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                const Icon(
                                  Icons.chat_bubble_outline,
                                  size: 18,
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  astrologer.totalChatTime,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              width: 92,
                              height: 28,
                              padding: const EdgeInsets.symmetric(
                                vertical: 6,
                                horizontal: 20,
                              ),
                              decoration: BoxDecoration(
                                color: const Color(0xFF0054DC),
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: const Center(
                                child: Text(
                                  'FOLLOW',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                // Images Section
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Images',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 12),
                      SizedBox(
                        height: 122,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: astrologer.images.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(right: 6.0),
                              child: Container(
                                width: 122,
                                height: 122,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  image: DecorationImage(
                                    image: AssetImage(
                                      'assets/images/${astrologer.images[index]}',
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),

                // Profile Summary
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Profile Summary',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        astrologer.profileSummary,
                        style: const TextStyle(
                          color: Colors.black87,
                          height: 1.5,
                        ),
                      ),
                    ],
                  ),
                ),

                // Specialization
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Specialization',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        astrologer.specialization,
                        style: const TextStyle(
                          color: Colors.black87,
                          height: 1.5,
                        ),
                      ),
                    ],
                  ),
                ),

                // Languages
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Languages',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        astrologer.languages,
                        style: const TextStyle(
                          color: Colors.black87,
                          height: 1.5,
                        ),
                      ),
                    ],
                  ),
                ),

                // Bottom spacing
                const SizedBox(height: 100),
              ],
            ),
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(
          child: Text('Error: ${err.toString()}'),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          height: 80,
          child: Row(
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: const Color(0xFF0054DC).withOpacity(0.1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(Icons.chat_bubble_outline, color: Color(0xFF0054DC)),
                      SizedBox(width: 8),
                      Text(
                        'Chat',
                        style: TextStyle(
                          color: Color(0xFF0054DC),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: const Color(0xFF0054DC),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(Icons.call_outlined, color: Colors.white),
                      SizedBox(width: 8),
                      Text(
                        'Call',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

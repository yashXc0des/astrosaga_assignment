import 'package:flutter/material.dart';
import '../../data/models/astrologer_model.dart';

class AstrologerCard extends StatelessWidget {
  final AstrologerModel astrologer;
  final VoidCallback onTap;

  const AstrologerCard({
    required this.astrologer,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile picture with online status
            Stack(
              children: [
                // Profile image
                Container(
                  height: 120,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    ),
                    image: DecorationImage(
                      image: AssetImage(astrologer.profileImage),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                // Online status indicator
                Positioned(
                  top: 10,
                  right: 10,
                  child: Container(
                    width: 12,
                    height: 12,
                    decoration: BoxDecoration(
                      color: astrologer.isOnline ? Colors.green : Colors.red,
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 2),
                    ),
                  ),
                ),
              ],
            ),

            // Astrologer details
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Name
                  Text(
                    astrologer.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),

                  // Rating
                  Row(
                    children: [
                      const Text(
                        'Rating: ',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                      const Icon(
                        Icons.star,
                        color: Colors.amber,
                        size: 14,
                      ),
                      Text(
                        '${astrologer.rating}',
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),

                  // Experience
                  Text(
                    'Experience: ${astrologer.experience} years',
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),

            // Divider
            const Divider(height: 1),

            // Price section with different background
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 12.0,
                vertical: 8.0,
              ),
              decoration: const BoxDecoration(
                color: Color(0xFFE5EFFF),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    astrologer.callRate,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF0054DC),
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    astrologer.originalRate,
                    style: const TextStyle(
                      decoration: TextDecoration.lineThrough,
                      color: Colors.grey,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

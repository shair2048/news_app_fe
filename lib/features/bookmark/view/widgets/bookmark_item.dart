import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../model/bookmark_model.dart';
class BookmarkItem extends StatelessWidget {
  final BookmarkModel bookmarkItem;
  final VoidCallback onShare;
  final VoidCallback onBookmark;

  const BookmarkItem({
    super.key,
    required this.bookmarkItem,
    required this.onShare,
    required this.onBookmark,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 0),
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              bookmarkItem.imageUrl,
              fit: BoxFit.cover,
              width: double.infinity,
              height: 200,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  height: 200,
                  width: double.infinity,
                  color: Colors.grey[200],
                  child: const Icon(Icons.broken_image, color: Colors.grey),
                );
              },
            ),
          ),
          const SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  bookmarkItem.title,
                  style: const TextStyle(
                    fontFamily: 'Nunito',
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Text(
                  bookmarkItem.description,
                  style: const TextStyle(
                    fontFamily: 'Nunito',
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Icon(Icons.visibility, size: 16, color: Colors.blue), // Icon views
                    const SizedBox(width: 4),
                    Text(
                      '${bookmarkItem.views ~/ 1000}k',
                      style: const TextStyle(fontFamily: 'Nunito', fontSize: 12, color: Colors.black87),
                    ),
                    const SizedBox(width: 16),
                    const Icon(Icons.comment, size: 16, color: Colors.blue),
                    const SizedBox(width: 4),
                    Text(
                      '${bookmarkItem.comments} Comments',
                      style: const TextStyle(fontFamily: 'Nunito', fontSize: 12, color: Colors.black87),
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: onShare,
                      child: SvgPicture.asset(
                        'assets/icons/share.svg',
                        width: 20,
                        height: 20,
                        colorFilter: ColorFilter.mode(Colors.grey[700]!, BlendMode.srcIn),
                      ),
                    ),
                    const SizedBox(width: 16),
                    GestureDetector(
                      onTap: onBookmark,
                      child: SvgPicture.asset(
                        'assets/icons/bookmark.svg',
                        width: 20,
                        height: 20,
                        colorFilter: ColorFilter.mode(Colors.blue, BlendMode.srcIn),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
          const Divider(height: 1, thickness: 1, color: Colors.grey),
        ],
      ),
    );
  }
}
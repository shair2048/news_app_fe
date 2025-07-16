import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../model/bookmark_model.dart';

class BookmarkItem extends StatelessWidget {
  final BookmarkModel bookmarkItem;
  final VoidCallback onBookmark;

  const BookmarkItem({
    super.key,
    required this.bookmarkItem,
    required this.onBookmark,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: Color(0xffE9EAF0), width: 1)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            borderRadius: BorderRadius.circular(0),
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
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  bookmarkItem.title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Nunito',
                    color: Color(0xff191F33),
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 6),
                Text(
                  bookmarkItem.description,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Nunito',
                    color: Color(0xff767E94),
                  ),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.justify,
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    SvgPicture.asset(
                      'assets/icons/eye.svg',
                      width: 20,
                      height: 20,
                      colorFilter: ColorFilter.mode(
                        Color(0xff0864ED),
                        BlendMode.srcIn,
                      ),
                    ), // Icon views
                    const SizedBox(width: 6),
                    Text(
                      '${bookmarkItem.views ~/ 1000}k',
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Nunito',
                        color: Color(0xff464D61),
                      ),
                    ),
                    const Spacer(),
                    IconButton(
                      onPressed: () => onBookmark,
                      icon: SvgPicture.asset(
                        'assets/icons/bookmark_active.svg',
                        width: 20,
                        height: 20,
                        colorFilter: ColorFilter.mode(
                          Colors.blue,
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

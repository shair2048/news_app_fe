import 'package:flutter/material.dart';

class ArticleFeedbackSection extends StatelessWidget {
  final int likes;
  final int comments;

  const ArticleFeedbackSection({
    super.key,
    required this.likes,
    required this.comments,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Text('Share:', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(width: 16),
            for (var icon in [
              Icons.facebook,
              Icons.email,
              Icons.content_paste_go_outlined,
            ])
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                child: Icon(icon, size: 35, color: Colors.blueAccent),
              ),
          ],
        ),
        const SizedBox(height: 24),
        const Text(
          'Write your feedback?',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        TextField(
          decoration: InputDecoration(
            hintText: 'Write your feedback about this blog…',
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
            filled: true,
            fillColor: Colors.grey[100],
          ),
          maxLines: 3,
        ),
        const SizedBox(height: 12),
        ElevatedButton(onPressed: () {}, child: const Text('POST COMMENTS')),
      ],
    );
  }
}

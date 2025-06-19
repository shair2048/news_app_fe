import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app_fe/features/home/model/news_item_model.dart';

final mostReadProvider = Provider<List<NewsItem>>((ref) {
  return [
    NewsItem(
      title: 'Business',
      description: 'assets/icons/handshake.svg',
      imageUrl:
          "https://res.cloudinary.com/dkn3kk3un/image/upload/f_auto,q_auto/c_fill,g_auto,h_600,w_800/v1/news_images/nyxmheir9wbhyyxzkckt?_a=BAMClqZW0",
      readCount: 1200,
    ),
    NewsItem(
      title: 'Food & Culture',
      description: 'assets/icons/fork_knife.svg',
      imageUrl:
          "https://res.cloudinary.com/dkn3kk3un/image/upload/f_auto,q_auto/c_fill,g_auto,h_600,w_800/v1/news_images/nyxmheir9wbhyyxzkckt?_a=BAMClqZW0",
      readCount: 950,
    ),
    NewsItem(
      title: 'Office Productivity',
      description: 'assets/icons/coffee.svg',
      imageUrl:
          "https://res.cloudinary.com/dkn3kk3un/image/upload/f_auto,q_auto/c_fill,g_auto,h_600,w_800/v1/news_images/nyxmheir9wbhyyxzkckt?_a=BAMClqZW0",

      readCount: 800,
    ),
    NewsItem(
      title: 'Finance & Accounting',
      description: 'assets/icons/credit_card.svg',
      imageUrl:
          "https://res.cloudinary.com/dkn3kk3un/image/upload/f_auto,q_auto/c_fill,g_auto,h_600,w_800/v1/news_images/nyxmheir9wbhyyxzkckt?_a=BAMClqZW0",
      readCount: 700,
    ),
    NewsItem(
      title: 'IT & Software',
      description: 'assets/icons/buildings.svg',
      imageUrl:
          "https://res.cloudinary.com/dkn3kk3un/image/upload/f_auto,q_auto/c_fill,g_auto,h_600,w_800/v1/news_images/nyxmheir9wbhyyxzkckt?_a=BAMClqZW0",
      readCount: 650,
    ),
  ];
});

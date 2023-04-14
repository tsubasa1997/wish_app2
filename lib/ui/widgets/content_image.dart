import 'package:flutter/material.dart';

import '../../common/logger.dart';

class ContentImage extends StatelessWidget {
  const ContentImage(this.imageUrl,{super.key,});

  final String? imageUrl;

  @override
  Widget build(BuildContext context) {
    final url = imageUrl;
    return url != null
        ? Image.network(
      url,
      errorBuilder: (context, error, __) {
        logger.info(error);
        return const NoImage();
      },
    )
        : const NoImage();
  }
}

class NoImage extends StatelessWidget {
  const NoImage({super.key});

  @override
  Widget build(BuildContext context) {
    return const ColoredBox(
      color: Colors.grey,
      child: Center(
        child: Text(
          'NOIMAGE',
          style: TextStyle(
            fontSize: 25,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

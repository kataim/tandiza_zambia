import 'package:flutter/material.dart';
import 'package:tandiza/widgets/upload_doc_image.dart';
import '../utilities/settings.dart';

class UploadTripleDocuments extends StatelessWidget {
  const UploadTripleDocuments({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Column(
          children: const [
            UploadDocImage(),
            SizedBox(height: 5,),
            Text('Month 1')
          ],
        )),
        SizedBox(width: 15,),
        Expanded(child: Column(
          children: const [
            UploadDocImage(),
            SizedBox(height: 5,),
            Text('Month 2'),
          ],
        )),
        const SizedBox(width: 15,),
        Expanded(child: Column(
          children: const [
            UploadDocImage(),
            SizedBox(height: 5,),
            Text('Month 3')
          ],
        )),
      ],
    );
  }
}


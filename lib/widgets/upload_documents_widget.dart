import 'package:flutter/material.dart';

import '../utilities/settings.dart';

class UploadDocuments extends StatelessWidget {
  const UploadDocuments({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet<void>(
            builder: (BuildContext context) {
              return SizedBox(
                height: 300,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              ListTile(
                                leading: const Icon(Icons.camera_alt_outlined),
                                title: const Text('Camera'),
                                onTap: (){
                                  Navigator.pop(context);
                                },
                              ),
                              const Divider(thickness: 0.5,),
                              ListTile(
                                leading: const Icon(Icons.image_outlined),
                                title: const Text('Photo Library'),
                                onTap: () {
                                  Navigator.pop(context);
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 10,),
                      GestureDetector(
                        onTap: (){
                          Navigator.pop(context);
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)
                            ),
                            child: const Center(
                              child: Padding(
                                padding: EdgeInsets.all(20.0),
                                child: Text('Cancel'),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
            context: context);
      },
      child: Center(
        child: Container(
          child: const Icon(Icons.camera_alt_outlined, color: kSecondaryColour, size: 35,),
          height: 100,
          width: 100,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                  color: kBackgroundColour,
                  width: 1
              )
              , shape: BoxShape.rectangle
          ),

        ),
      ),
    );
  }
}
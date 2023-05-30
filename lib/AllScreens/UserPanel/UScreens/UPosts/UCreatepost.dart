import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:greymatter/Apis/UserAPis/user_posts_api/add_post_api.dart';
import 'package:greymatter/constants/colors.dart';
import 'package:greymatter/constants/decorations.dart';
import 'package:greymatter/constants/fonts.dart';
import 'package:greymatter/constants/globals.dart';
import 'package:greymatter/widgets/app_bar/app_bar.dart';
import 'package:greymatter/widgets/buttons.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UCreatePost extends StatefulWidget {
  const UCreatePost({
    Key? key,
  }) : super(key: key);

  @override
  State<UCreatePost> createState() => _UCreatePostState();
}

class _UCreatePostState extends State<UCreatePost> {
  File _pickedImage = File("");
  final ImagePicker _imgPicker = ImagePicker();
  List<File> _pickedImages = [];
  final TextEditingController controller = TextEditingController();

  String userName = '';
  String image = '';
  _setPrefs() async {
    var prefs = await SharedPreferences.getInstance();
    String a = prefs.getString(Keys().userName)!;
    String b = prefs.getString(Keys().userImage)!;
    setState(() {
      userName = a;
      image = b;
    });
  }

  bool _btnLoading = false;
  @override
  void initState() {
    _setPrefs();
    super.initState();
  }

  bool _showDelete = false;
  File _draggedFile = File("");
  int imgIndex = 0;

  CroppedFile? croppedFile;
  _imageCropper(File file, int index) async {
    croppedFile = await ImageCropper().cropImage(
        sourcePath: file.path,
        aspectRatio: CropAspectRatio(ratioX: 3, ratioY: 2),
        aspectRatioPresets: [
          CropAspectRatioPreset.ratio3x2
        ],
        uiSettings: [
          AndroidUiSettings(
            toolbarColor: k006D77,
            toolbarWidgetColor: Colors.white,
          ),
        ]);
    if (croppedFile == null) {
      return;
    } else {
      setState(() {
        _pickedImages.removeAt(index);
        _pickedImages.insert(index, File(croppedFile!.path));
      });
    }
  }

  PageController page = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kEDF6F9,
      appBar: CustomWhiteAppBar(
        hasThreeDots: false,
        appBarText: 'Create post',
        imgPath: 'assets/images/iconbackappbarlarge.png',
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 24.w, right: 24.w, top: 40.h),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 45,
                width: 1.sw,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          height: 45.h,
                          width: 45.w,
                          decoration: const BoxDecoration(
                              color: Colors.grey, shape: BoxShape.circle),
                          clipBehavior: Clip.hardEdge,
                          child: Image.network(
                            image,
                            errorBuilder: (q, w, e) =>
                                Image.asset('assets/images/userP.png'),
                            fit: BoxFit.fill,
                          ),
                        ),
                        SizedBox(
                          width: 8.w,
                        ),
                        Text(
                          userName,
                          style: kManRope_500_16_001314,
                        ),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InkWell(
                          onTap: () async {
                            XFile? v = await _imgPicker.pickImage(
                                source: ImageSource.camera);
                            if (v != null) {
                              if (_pickedImages.length > 4) {
                                Fluttertoast.showToast(
                                    msg: "Maximum 4 images are allowed.");
                              } else {
                                setState(() {
                                  _pickedImage = File(v.path);
                                  _pickedImages.add(_pickedImage);
                                });
                              }
                            }
                          },
                          child: SizedBox(
                            height: 24,
                            width: 24,
                            // color: Colors.red,
                            child: Image.asset(
                              'assets/images/iconcamera.png',
                              height: 24,
                              width: 24,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 14.w,
                        ),
                        InkWell(
                          onTap: () async {
                            List<XFile> images =
                                await _imgPicker.pickMultiImage();
                            setState(() {
                              if (images.length > 4) {
                                Fluttertoast.showToast(
                                    msg: "Maximum 4 images are allowed.");
                              } else {
                                if (_pickedImages.length > 4) {
                                  Fluttertoast.showToast(
                                      msg: "Maximum 4 images are allowed.");
                                } else {
                                  for (var v in images) {
                                    _pickedImages.add(File(v.path));
                                    // _imageCropper(File(v.path));
                                  }
                                }
                              }
                            });
                            if (_pickedImages.isNotEmpty) {
                              log(_pickedImages.toString());
                            }
                          },
                          child: SizedBox(
                            height: 24,
                            width: 24,
                            // color: Colors.red,
                            child: Image.asset(
                              'assets/images/iconpost.png',
                              height: 24.h,
                              width: 24.w,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 16.h,
              ),
              TextField(
                controller: controller,
                minLines: 1,
                maxLines: 10,
                textInputAction: TextInputAction.done,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'What do you want to share?...',
                  hintStyle: kManRope_400_14_626A6A,
                ),
              ),
              SizedBox(
                height: 24.h,
              ),
              if (_pickedImages.isNotEmpty)
                Stack(
                  children: [
                    Container(
                        height: 285.h,
                        width: 380.w,
                        clipBehavior: Clip.hardEdge,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          //color: Colors.white,
                        ),
                        child: PageView.builder(
                            itemCount: _pickedImages.length,
                            controller: page,
                            onPageChanged: (val) {
                              setState(() {
                                imgIndex = val;
                              });
                            },
                            scrollDirection: Axis.horizontal,
                            pageSnapping: true,
                            itemBuilder: (BuildContext context, ind) {
                              return LongPressDraggable<File>(
                                onDragStarted: () {
                                  log("Started");
                                  setState(() {
                                    _showDelete = true;
                                  });
                                },
                                onDragCompleted: () {
                                  log("Completed");
                                  setState(() {
                                    _showDelete = false;
                                  });
                                },
                                onDragEnd: (details) {
                                  log("Ended");
                                  setState(() {
                                    _showDelete = false;
                                  });
                                },
                                onDragUpdate: (updateDetails) {
                                  _draggedFile = _pickedImages[ind];
                                  //log(_draggedFile.path);
                                },
                                //axis: Axis.vertical,
                                data: _pickedImages[ind],
                                feedback: Container(
                                  clipBehavior: Clip.hardEdge,
                                  decoration: BoxDecoration(
                                      color: Colors.black38,
                                      borderRadius: BorderRadius.circular(10)),
                                  width: 250,
                                  height: 200,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.file(
                                      _pickedImages[ind],
                                      //fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                child: InkWell(
                                  onTap: () {
                                    _imageCropper(_pickedImages[ind], ind);
                                  },
                                  child: Image.file(
                                    _pickedImages[ind],
                                    // fit: BoxFit.cover,
                                  ),
                                ),
                              );
                            })),
                    Positioned(
                        right: 10,
                        top: 10,
                        child: Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                          decoration: BoxDecoration(
                              color: Colors.black45,
                              borderRadius: BorderRadius.circular(50)),
                          child: Text(
                            "${imgIndex + 1}/${_pickedImages.length}",
                            style: kManRope_400_14_white,
                          ),
                        ))
                  ],
                ),
              SizedBox(
                height: 10,
              ),
              if (_pickedImages.isNotEmpty)
                Center(
                    child: Text(
                  "(Tap an image to crop)",
                  style: kManRope_400_14_006D77,
                )),
              SizedBox(
                height: 50,
              ),
              _showDelete
                  ? Center(
                      child: DragTarget<File>(onWillAccept: (file) {
                        return file!.path == _draggedFile.path;
                      }, onAccept: (file) {
                        setState(() {
                          _pickedImages.remove(file);
                        });
                      }, builder: (ctx, q, w) {
                        return IconButton(
                          icon: Image.asset(
                            "assets/icons/delete.png",
                            width: 24,
                            height: 24,
                          ),
                          onPressed: () {},
                        );
                      }),
                    )
                  : SizedBox.shrink(),
              // Container(
              //   height: 250,
              //   //padding: EdgeInsets.only(left: 16),
              //   child: ListView.separated(
              //       shrinkWrap: true,
              //       scrollDirection: Axis.horizontal,
              //       itemBuilder: (ctx, index) {
              //         return LongPressDraggable<File>(
              //           onDragStarted: () {
              //             log("Started");
              //             setState(() {
              //               _showDelete = true;
              //             });
              //           },
              //           onDragCompleted: () {
              //             log("Completed");
              //             setState(() {
              //               _showDelete = false;
              //             });
              //           },
              //           onDragEnd: (details) {
              //             log("Ended");
              //             setState(() {
              //               _showDelete = false;
              //             });
              //           },
              //           onDragUpdate: (updateDetails) {
              //             _draggedFile = _pickedImages[index];
              //             //log(_draggedFile.path);
              //           },
              //           //axis: Axis.vertical,
              //           data: _pickedImages[index],
              //           feedback: Container(
              //             clipBehavior: Clip.hardEdge,
              //             decoration: BoxDecoration(
              //                 color: Colors.black38,
              //                 borderRadius: BorderRadius.circular(10)),
              //             width: 250,
              //             height: 200,
              //             child: ClipRRect(
              //               borderRadius: BorderRadius.circular(10),
              //               child: Image.file(
              //                 _pickedImages[index],
              //                 //fit: BoxFit.cover,
              //               ),
              //             ),
              //           ),
              //           child: Container(
              //             clipBehavior: Clip.hardEdge,
              //             decoration: BoxDecoration(
              //                 color: Colors.black38,
              //                 borderRadius: BorderRadius.circular(10)),
              //             width: 1.sw - 50,
              //             height: 300,
              //             child: ClipRRect(
              //               borderRadius: BorderRadius.circular(10),
              //               child: Image.file(
              //                 _pickedImages[index],
              //                 //fit: BoxFit.cover,
              //               ),
              //             ),
              //           ),
              //         );
              //       },
              //       separatorBuilder: (ctx, ind) => SizedBox(
              //             width: 10,
              //           ),
              //       itemCount: _pickedImages.length),
              // ),
              // SizedBox(
              //   height: 50,
              // ),
              // _showDelete
              //     ? Center(
              //         child: DragTarget<File>(onWillAccept: (file) {
              //           return file!.path == _draggedFile.path;
              //         }, onAccept: (file) {
              //           setState(() {
              //             _pickedImages.remove(file);
              //           });
              //         }, builder: (ctx, q, w) {
              //           return IconButton(
              //             icon: Image.asset(
              //               "assets/icons/delete.png",
              //               width: 24,
              //               height: 24,
              //             ),
              //             onPressed: () {},
              //           );
              //         }),
              //       )
              //     : SizedBox.shrink(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(bottom: 30.h),
          child: Center(
            child: SizedBox(
              height: 56.h,
              child: _btnLoading
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : MainButton(
                      onPressed: () {
                        if (_pickedImages.isNotEmpty) {
                          setState(() {
                            _btnLoading = true;
                          });
                          final resp = AddPost().get(
                              captions: controller.text,
                              pickedImg: _pickedImages);
                          resp.then((value) {
                            if (value['status'] == true) {
                              setState(() {
                                Fluttertoast.showToast(
                                    msg: "Posted successfully.");
                                setState(() {
                                  _btnLoading = false;
                                });
                                Navigator.of(context).pop();
                              });
                            } else {
                              setState(() {
                                _btnLoading = false;
                              });
                              Fluttertoast.showToast(
                                  msg: "Something went wrong");
                            }
                          });
                        } else {
                          Fluttertoast.showToast(
                              msg: "Please select an image first.");
                        }
                      },
                      child: Padding(
                        padding: EdgeInsets.only(left: 74.w, right: 74.w),
                        child: Text(
                          "Post",
                          style: kManRope_400_16_white,
                        ),
                      ),
                      color: k006D77,
                      shape: CustomDecoration().smallButton10Decoration()),
            ),
          ),
        ),
      ),
    );
  }
}

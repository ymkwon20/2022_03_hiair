import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:frontend/src/auth/presentation/viewmodels/auth_chage_notifier.dart';
import 'package:frontend/src/core/dependency_injection.dart';
import 'package:frontend/src/core/presentation/layout_constant.dart';
import 'package:frontend/src/core/presentation/widgets/flash_bar.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:package_info_plus/package_info_plus.dart';

class BadControlPopup extends ConsumerStatefulWidget {
  const BadControlPopup({Key? key}) : super(key: key);

  @override
  ConsumerState<BadControlPopup> createState() => _BadControlPopupState();
}

class _BadControlPopupState extends ConsumerState<BadControlPopup> {
  TextEditingController yardController = TextEditingController();
  TextEditingController hullNoController = TextEditingController();
  TextEditingController sysNoController = TextEditingController();
  TextEditingController itemNoController = TextEditingController();
  TextEditingController rmkController = TextEditingController();

  String curVersion = "";
  String newVersion = "";
  List<String> _workCodeCDList = [];
  List<String> _workCodeCDNMList = [];
  List<String> _badCodeCDList = [];
  List<String> _badCodeCDNMList = [];

  int _workCodeCDIndex = 0;
  String _workCodeCDNMValue = "";
  int _badCodeCDIndex = 0;
  String _badCodeCDNMValue = "";

  File? _image;
  String _imagePath = "";
  String _imageFileName = "";
  final picker = ImagePicker();

  @override
  void initState() {
    super.initState();

    getComboList();
  }

  // 비동기 처리를 통해 카메라와 갤러리에서 이미지를 가져온다.
  Future getImage(ImageSource imageSource) async {
    final image = await picker.pickImage(source: imageSource);

    setState(() {
      _image = File(image!.path); // 가져온 이미지를 _image에 저장
      _imagePath = image.path;
      _imageFileName = image.name;
    });
  }

  // 이미지를 보여주는 위젯
  Widget showImage() {
    return Container(
        color: const Color(0xffd0cece),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.width / 2.5,
        child: Center(
            child: _image == null
                ? const Text('이미지를 선택해주세요.')
                : Image.file(File(_image!.path))));
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Stack(
        fit: StackFit.expand,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Container(
              width: double.infinity,
              height: double.infinity,
              color: Colors.transparent,
            ),
          ),
          Positioned(
            top: 0,
            bottom: 0,
            right: 0,
            child: SafeArea(
              child: GestureDetector(
                onTap: () {
                  FocusScope.of(context).unfocus();
                },
                child: Container(
                  width: MediaQuery.of(context).size.width / 2,
                  height: double.infinity,
                  decoration: BoxDecoration(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(LayoutConstant.radiusM),
                      bottomLeft: Radius.circular(LayoutConstant.radiusM),
                    ),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: LayoutConstant.paddingS,
                          horizontal: LayoutConstant.paddingL,
                        ),
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: ElevatedButton(
                            onPressed: () {
                              saveBadControl();
                              if (yardController.text == "" ||
                                  hullNoController.text == "" ||
                                  sysNoController.text == "") {
                                showFlashBar(
                                  context,
                                  title: "오류",
                                  content: "입력을 완료하지 않았습니다.",
                                  backgroundColor: Theme.of(context).errorColor,
                                );
                                Future.delayed(
                                  const Duration(seconds: 2),
                                );
                              } else {
                                showFlashBar(
                                  context,
                                  title: "저장완료",
                                  content: "저장이 완료되었습니다.",
                                  backgroundColor:
                                      Theme.of(context).primaryColorLight,
                                );
                                Future.delayed(
                                  const Duration(seconds: 2),
                                );
                                Navigator.of(context).pop();
                              }
                            },
                            child: const Text(
                              "저장",
                            ),
                          ),
                        ),
                      ),
                      Column(
                        children: [
                          const Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: LayoutConstant.spaceM,
                              horizontal: LayoutConstant.spaceL,
                            ),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "업체별 불량 관리",
                                style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          Center(
                            child: SizedBox(
                              height: 450, // or any other height you want
                              child: SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    const SizedBox(
                                        height: LayoutConstant.spaceL),
                                    Row(
                                      children: const [
                                        Expanded(
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(
                                              vertical: LayoutConstant.spaceM,
                                              horizontal: LayoutConstant.spaceL,
                                            ),
                                            child: Align(
                                              alignment: Alignment.centerLeft,
                                              child: Text(
                                                "Yard",
                                                style: TextStyle(
                                                  fontSize: 24,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(
                                              vertical: LayoutConstant.spaceM,
                                              horizontal: LayoutConstant.spaceL,
                                            ),
                                            child: Align(
                                              alignment: Alignment.centerLeft,
                                              child: Text(
                                                "HullNo",
                                                style: TextStyle(
                                                  fontSize: 24,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                              vertical: LayoutConstant.spaceM,
                                              horizontal: LayoutConstant.spaceL,
                                            ),
                                            child: Align(
                                              alignment: Alignment.centerLeft,
                                              child: TextField(
                                                controller: yardController,
                                                decoration:
                                                    const InputDecoration(
                                                  border: OutlineInputBorder(),
                                                  labelText: 'Yard',
                                                ),
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyText1,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                              vertical: LayoutConstant.spaceM,
                                              horizontal: LayoutConstant.spaceL,
                                            ),
                                            child: Align(
                                              alignment: Alignment.centerLeft,
                                              child: TextField(
                                                controller: hullNoController,
                                                decoration:
                                                    const InputDecoration(
                                                  border: OutlineInputBorder(),
                                                  labelText: 'Hull No',
                                                ),
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyText1,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                        height: LayoutConstant.spaceL),
                                    Row(
                                      children: const [
                                        Expanded(
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(
                                              vertical: LayoutConstant.spaceM,
                                              horizontal: LayoutConstant.spaceL,
                                            ),
                                            child: Align(
                                              alignment: Alignment.centerLeft,
                                              child: Text(
                                                "SysNo",
                                                style: TextStyle(
                                                  fontSize: 24,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(
                                              vertical: LayoutConstant.spaceM,
                                              horizontal: LayoutConstant.spaceL,
                                            ),
                                            child: Align(
                                              alignment: Alignment.centerLeft,
                                              child: Text(
                                                "품번",
                                                style: TextStyle(
                                                  fontSize: 24,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                              vertical: LayoutConstant.spaceM,
                                              horizontal: LayoutConstant.spaceL,
                                            ),
                                            child: Align(
                                              alignment: Alignment.centerLeft,
                                              child: TextField(
                                                controller: sysNoController,
                                                decoration:
                                                    const InputDecoration(
                                                  border: OutlineInputBorder(),
                                                  labelText: 'Sys No',
                                                ),
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyText1,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                              vertical: LayoutConstant.spaceM,
                                              horizontal: LayoutConstant.spaceL,
                                            ),
                                            child: Align(
                                              alignment: Alignment.centerLeft,
                                              child: TextField(
                                                controller: itemNoController,
                                                decoration:
                                                    const InputDecoration(
                                                  border: OutlineInputBorder(),
                                                  labelText: 'Item No',
                                                ),
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyText1,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                        height: LayoutConstant.spaceM),
                                    const SizedBox(
                                        height: LayoutConstant.spaceM),
                                    const Padding(
                                      padding: EdgeInsets.symmetric(
                                        vertical: LayoutConstant.spaceM,
                                        horizontal: LayoutConstant.spaceL,
                                      ),
                                      child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          "업체명",
                                          style: TextStyle(
                                            fontSize: 24,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: LayoutConstant.spaceM,
                                        horizontal: LayoutConstant.spaceL,
                                      ),
                                      child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: DropdownButton<String>(
                                          value: _workCodeCDNMValue,
                                          icon:
                                              const Icon(Icons.arrow_downward),
                                          elevation: 16,
                                          style: const TextStyle(
                                              fontSize: 16,
                                              color: Colors.deepPurple),
                                          underline: Container(
                                            height: 2,
                                            color: Colors.deepPurpleAccent,
                                          ),
                                          onChanged: (String? value) {
                                            // This is called when the user selects an item.
                                            setState(() {
                                              _workCodeCDNMValue = value!;
                                              _workCodeCDIndex =
                                                  _workCodeCDNMList
                                                      .indexOf(value);
                                            });
                                          },
                                          items: _workCodeCDNMList
                                              .map<DropdownMenuItem<String>>(
                                                  (String value) {
                                            return DropdownMenuItem<String>(
                                              value: value,
                                              child: Text(value),
                                            );
                                          }).toList(),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                        height: LayoutConstant.spaceM),
                                    const Padding(
                                      padding: EdgeInsets.symmetric(
                                        vertical: LayoutConstant.spaceM,
                                        horizontal: LayoutConstant.spaceL,
                                      ),
                                      child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          "불량코드",
                                          style: TextStyle(
                                            fontSize: 24,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: LayoutConstant.spaceM,
                                        horizontal: LayoutConstant.spaceL,
                                      ),
                                      child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: DropdownButton<String>(
                                          value: _badCodeCDNMValue,
                                          icon:
                                              const Icon(Icons.arrow_downward),
                                          elevation: 16,
                                          style: const TextStyle(
                                              fontSize: 16,
                                              color: Colors.deepPurple),
                                          underline: Container(
                                            height: 2,
                                            color: Colors.deepPurpleAccent,
                                          ),
                                          onChanged: (String? value) {
                                            // This is called when the user selects an item.
                                            setState(() {
                                              _badCodeCDNMValue = value!;
                                              _badCodeCDIndex = _badCodeCDNMList
                                                  .indexOf(value);
                                            });
                                          },
                                          items: _badCodeCDNMList
                                              .map<DropdownMenuItem<String>>(
                                                  (String value) {
                                            return DropdownMenuItem<String>(
                                              value: value,
                                              child: Text(value),
                                            );
                                          }).toList(),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                        height: LayoutConstant.spaceM),
                                    const Padding(
                                      padding: EdgeInsets.symmetric(
                                        vertical: LayoutConstant.spaceM,
                                        horizontal: LayoutConstant.spaceL,
                                      ),
                                      child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          "비고",
                                          style: TextStyle(
                                            fontSize: 24,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: LayoutConstant.spaceM,
                                        horizontal: LayoutConstant.spaceL,
                                      ),
                                      child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: TextField(
                                          controller: rmkController,
                                          decoration: const InputDecoration(
                                            border: OutlineInputBorder(),
                                            labelText: 'rmk',
                                          ),
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText1,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                        height: LayoutConstant.spaceL),
                                    const Padding(
                                      padding: EdgeInsets.symmetric(
                                        vertical: LayoutConstant.spaceM,
                                        horizontal: LayoutConstant.spaceL,
                                      ),
                                      child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          "사진",
                                          style: TextStyle(
                                            fontSize: 24,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: LayoutConstant.spaceM,
                                        horizontal: LayoutConstant.spaceL,
                                      ),
                                      child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              showImage(),
                                              const SizedBox(height: 20.0),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: <Widget>[
                                                  // 카메라 촬영 버튼
                                                  FloatingActionButton(
                                                    child: const Icon(
                                                        Icons.add_a_photo),
                                                    tooltip: '이미지 선택',
                                                    onPressed: () {
                                                      getImage(
                                                          ImageSource.camera);
                                                    },
                                                  ),

                                                  // 갤러리에서 이미지를 가져오는 버튼
                                                  FloatingActionButton(
                                                    child: const Icon(
                                                        Icons.wallpaper),
                                                    tooltip: '이미지 선택',
                                                    onPressed: () {
                                                      getImage(
                                                          ImageSource.gallery);
                                                    },
                                                  ),
                                                ],
                                              )
                                            ],
                                          )),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> getComboList() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();

    final response = await ref
        .watch(dioProvider)
        .get("/unit", queryParameters: {"code": "MONI_WC"});

    final response2 = await ref
        .watch(dioProvider)
        .get("/unit", queryParameters: {"code": "U2002084"});

    List<String> workCodeCDList = [];
    List<String> workCodeCDNMList = [];
    List<String> badCodeCDList = [];
    List<String> badCodeCDNMList = [];

    for (int i = 0; i < response.data.length; i++) {
      workCodeCDList.add(response.data[i]['CD']);
    }
    for (int i = 0; i < response.data.length; i++) {
      workCodeCDNMList.add(response.data[i]['CD_NM']);
    }
    for (int i = 0; i < response2.data.length; i++) {
      badCodeCDList.add(response2.data[i]['CD']);
    }
    for (int i = 0; i < response2.data.length; i++) {
      badCodeCDNMList.add(response2.data[i]['CD_NM']);
    }
    setState(
      () {
        _workCodeCDList = workCodeCDList;
        _workCodeCDNMList = workCodeCDNMList;
        _badCodeCDList = badCodeCDList;
        _badCodeCDNMList = badCodeCDNMList;

        _workCodeCDNMValue = workCodeCDNMList.first;
        _badCodeCDNMValue = badCodeCDNMList.first;
      },
    );
  }

  Future<void> saveBadControl() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();

    final response = await ref.watch(dioProvider).post(
      "/badcontrol",
      queryParameters: {
        "yard": yardController.text,
        "hullNo": hullNoController.text,
        "sysNo": sysNoController.text,
        "itemNo": itemNoController.text,
        "wccd": _workCodeCDList[_workCodeCDIndex],
        "wcnm": _workCodeCDNMValue,
        "badcd": _badCodeCDList[_badCodeCDIndex],
        "badnm": _badCodeCDNMValue,
        "rmk": rmkController.text,
        "work-id": ref.watch(authChangeNotifierProvider).user!.id,
        "org1fn": _imageFileName,
      },
    );

    if (_imagePath != "") {
      final formData = FormData();
      final imageParams = <MapEntry<String, MultipartFile>>[];
      final img = MultipartFile.fromFileSync(_imagePath, filename: _imagePath);
      imageParams.add(MapEntry("file", img));

      formData.files.addAll(imageParams);

      await ref.watch(dioProvider).post(
        "/imagesByPath",
        data: formData,
        queryParameters: {"dirName": "D:\\FILE_UP_DOWN\\IMAGE\\PIC\\WC"},
      );
    }
  }
}

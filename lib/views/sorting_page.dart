import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:sorting_app/core/sorting_algorithms.dart';
import 'package:sorting_app/utils/colors.dart';


class SortingPage extends StatefulWidget {
  final String sortTitle;
  final String sortType;
  const SortingPage({super.key, required this.sortTitle, required this.sortType});

  @override
  State<SortingPage> createState() => _SortingPageState();
}

class _SortingPageState extends State<SortingPage> {
  final TextEditingController _textController = TextEditingController();
  List<dynamic> unsortedList = [];
  List<dynamic> sortedList = [];
  bool isSorting = false;

  Future<void> _storeNumbers() async{
    final navigate = Navigator.of(context);
    String inputText = _textController.text;
    List<String> tokens = inputText.split(",");
    List<dynamic> parsedList = [];

    for (String token in tokens) {
      token = token.trim();
      try {
        int? number = int.tryParse(token);
        if (number != null) {
          parsedList.add(number);
        } else {
          parsedList.add(token);
        }
      } catch (e) {
       rethrow;
      }
    }

    setState(() {
      unsortedList = parsedList;
      isSorting = true;
    });

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return SimpleDialog(
          children: [
            Center(
              child: Lottie.asset(
                'animations/sorting.json',
                height: 220.h,
                reverse: true,
                repeat: true,
                fit: BoxFit.contain,
              ),
            )
          ],
        );
      },
    );

    await Future.delayed(const Duration(seconds: 3));

     final newList = await sortAlgorithm(parsedList, widget.sortType);

    setState(() {
      sortedList = newList;
      isSorting = false;
    });
    navigate.pop();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: kGreenishColor,
        appBar: AppBar(
          automaticallyImplyLeading: true,
          backgroundColor: kGreenishColor,
          title: Text(widget.sortTitle),
          centerTitle: true,
          titleTextStyle: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 24.sp,
          ),
          iconTheme: const IconThemeData(color: Colors.white),
        ),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 40.h,),
                  TextField(
                    controller: _textController,
                    decoration: const InputDecoration(
                      hintText: 'Enter values separated by commas',
                      filled: true,
                      fillColor: Colors.white,
                    ),
                    onSubmitted: (value) {
                      _storeNumbers();
                      _textController.clear();
                    },
                  ),
                  SizedBox(height: 20.h),
                  Text('Before Sorting', style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w500),),
                  Wrap(
                    spacing: 4.w,
                    children: List.generate(
                      unsortedList.length,
                          (index) {
                        return Container(
                          margin: const EdgeInsets.all(5.0),
                          padding: const EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.blue, width: 2.0),
                            borderRadius: BorderRadius.circular(8.r)
                          ),
                          child: Text(
                            unsortedList[index].toString(),
                            style: TextStyle(fontSize: 20.sp),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 20.h),
                   const Divider(color: Colors.white, thickness: 2,),
                  SizedBox(height: 20.h),
                  Text('After Sorting', style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w500),),
                  isSorting ? Container() : Wrap(
                    spacing: 4.w,
                    children: List.generate(
                      sortedList.length,
                          (index) {
                        return Container(
                          margin: const EdgeInsets.all(5.0),
                          padding: const EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.blue, width: 2.0),
                              borderRadius: BorderRadius.circular(8.r)
                          ),
                          child: Text(
                            sortedList[index].toString(),
                            style: TextStyle(fontSize: 20.sp),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 90.h),
                  ElevatedButton(
                    onPressed: () {
                      _storeNumbers();
                      _textController.clear();
                      FocusScope.of(context).unfocus();
                    },
                    child: Text('Sort This', style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w600),),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<List<dynamic>> sortAlgorithm(List<dynamic> list, String sortType) async {
    switch (sortType) {
      case 'bubble':
        return await Sorting.bubbleSort(list);
      case 'selection':
        return await Sorting.selectionSort(list);
      case 'insertion':
        return await Sorting.insertionSort(list);
      default:
        throw ArgumentError("Invalid sort type");
    }
  }
}

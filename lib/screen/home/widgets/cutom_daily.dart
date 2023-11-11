import 'package:flutter/material.dart';
import 'package:weatherapp/utils/constants/design_constants.dart';
import 'package:weatherapp/utils/device/device_utils.dart';
import 'package:weatherapp/widgets/custom_text.dart';

class CustomDaily extends StatefulWidget {
  const CustomDaily({super.key});

  @override
  State<CustomDaily> createState() => _CustomDailyState();
}

class _CustomDailyState extends State<CustomDaily> {
  Future<List<String>> fetchData() async {
    return [
      'Monday',
      'Tuesday',
      'Wednesday',
      'Thursday',
      'Friday',
      'Saturday',
      'Friday',
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        height: 450,
        width: DeviceUtils.getWidth(context),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: kWhiteColor,
        ),
        child: Column(
          children: [
            const CustomText(
              text: 'tect',
              textAlign: TextAlign.left,
            ),
            FutureBuilder<List<String>>(
              future: fetchData(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator(); // Veri beklenirken gösterilecek widget.
                } else if (snapshot.hasError) {
                  return Text('Hata: ${snapshot.error}');
                } else {
                  return SizedBox(
                    height: 400,
                    child: ListView.builder(
                      itemCount: 7,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(snapshot.data![index]),
                        );
                      },
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

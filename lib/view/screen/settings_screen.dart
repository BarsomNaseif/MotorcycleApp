import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:motorcycle_app/controller/settings_controller.dart';
import 'package:motorcycle_app/view/widget/CustomText.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SettingController);
    return Scaffold(
      body: GetBuilder<SettingController>(
        init: SettingController(),
        builder: (controller) => ListView(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: Align(
                  alignment: Alignment.bottomRight, child: Icon(Icons.sunny)),
            ),
            Column(
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 25),
                  child: CircleAvatar(
                    radius: 55,
                    backgroundColor: Colors.blueAccent,
                  ),
                ),
                CustomText(
                  text: 'NicolasAdams',
                  alignment: Alignment.center,
                  color: Colors.black,
                  fontSize: 20,
                ),
                CustomText(
                  text: 'barsomsafwat@gmail.com',
                  alignment: Alignment.center,
                  color: Colors.black,
                  fontSize: 16,
                ),
                //MaterialBanner(content: content, actions: actions)
                const SizedBox(
                  height: 15,
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        elevation: 7.0,
                        textStyle: const TextStyle(color: Colors.white)),
                    // shape: RoundedRectangleBorder(
                    //     borderRadius: BorderRadius.circular(20)),
                    onPressed: () {},
                    // color: Colors.grey,
                    child: Text('Upgrade to PRO'))
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: double.infinity,
                child: ListView.separated(
                  scrollDirection: Axis.vertical,
                  physics: const BouncingScrollPhysics(),
                  itemCount: controller.map.length,
                  shrinkWrap: true,
                  itemBuilder: ((context, index) {
                    return Container(
                      height: 50,
                      // alignment: Alignment.center,
                      margin: EdgeInsets.all(6),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: Colors.grey),
                      child:  ListTile(
                        leading: Icon(controller.map[index]["iconData"],),
                        title: Text(controller.map[index]["titiel"]),
                        //   subtitle: Text('Icream is good for health'),
                        trailing: Icon(Icons.arrow_forward_ios),
                      ),
                    );
                  }),
                  separatorBuilder: (BuildContext context, int index) =>
                      SizedBox(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

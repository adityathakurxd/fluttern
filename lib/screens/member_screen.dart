import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttern/constants/constants.dart';
import 'package:fluttern/providers/member_provider.dart';
import 'package:url_launcher/url_launcher.dart';

class MemberScreen extends StatelessWidget {
  const MemberScreen({Key? key}) : super(key: key);

  final _url = "https://docs.google.com/forms/d/e/1FAIpQLSf9qqYxIoZTyLH6X4c9X2iKfh89N4KGhqSMOLlyr7kcTiQbRQ/viewform?usp=sf_link";

  void _launchURL() async =>
      await canLaunch(_url) ? await launch(_url) : throw 'Could not launch $_url';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer(
        builder: (context, watch, child) {
          final reponseValue = watch(memberProvider);
          return reponseValue.when(
            loading: () => Center(child: const CircularProgressIndicator()),
            error: (err, stack) => Text('Error: $err'),
            data: (value) {
              return GridView.count(
                crossAxisCount: MediaQuery.of(context).size.width > 800 ? 4 : (MediaQuery.of(context).size.width > 400 ? 2:1),
                children: List.generate(value.length, (index) {
                  return Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        elevation: 6,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                  value[index].name,
                                  style: kTitleText.copyWith(color: kAccentColor)
                              ),
                              Text(
                                  value[index].discordId,
                                  style: kSubTitleText.copyWith(color: kBlackColor)
                              ),
                              const SizedBox(height: 20,),
                              Text(
                                  value[index].domain,
                                  style: kSubTitleText.copyWith(color: kBlackColor)
                              ),
                              Text(
                                  value[index].framework + ', ' + value[index].language,
                                  overflow: TextOverflow.fade,
                                  style: kSubTitleText.copyWith(color: kBlackColor,fontSize: 8)
                              ),
                              const SizedBox(height: 20,),
                              Visibility(
                                visible: value[index].isOpen == 'Yes'? true : false,
                                child: Container(
                                  height: 45,
                                  width: 120,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: kPrimaryColor),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Icon(Icons.email),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Text('Contact', style: kSubTitleText.copyWith(color: kBlackColor),),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                }),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _launchURL,
        tooltip: 'Become a member!',
        child: Icon(Icons.add, color: kPrimaryColor,),
      ),
    );
  }
}

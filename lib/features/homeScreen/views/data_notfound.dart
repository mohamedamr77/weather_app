import 'package:flutter/material.dart';
import '../../../core/image.dart';
import '../../../core/text.dart';


class DataNotFoundScreen extends StatelessWidget {
  const DataNotFoundScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration:const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(ImageApp.backGroundImage,),
            fit:BoxFit.cover,
          )
      ),
      child:  Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: RichText(
              textAlign: TextAlign.center,
              text: const TextSpan(
                children: <TextSpan>[
                  TextSpan(
                      text: "there is no weather ",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                      )
                  ),
                  TextSpan(
                    // used this website ("https://emojidb.org/search-emojis?utm_source=user_search")
                    text: ' 😔  ', // emoji characters
                    style: TextStyle(
                      fontSize: 20,
                    )
                  ),
                  TextSpan(
                    text: 'Please search for a city ',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                      )
                  ),
                  TextSpan(
                    text: '🔍', // emoji characters
                    style: TextStyle(
                      fontSize: 20,
                    )
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

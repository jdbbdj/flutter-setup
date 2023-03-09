import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'test.dart';

String baconParagraphs =
    "Bacon ipsum dolor amet andouille tail pastrami sausage rump short loin meatloaf, pork filet mignon corned beef swine strip steak t-bone hamburger chuck. Kevin turkey salami swine. Pancetta picanha landjaeger cow turducken. Jowl alcatra doner turkey tenderloin ground round. Tenderloin sirloin ground round, cupim capicola buffalo cow. Pork belly jowl sausage alcatra, hamburger burgdoggen doner leberkas. Bresaola cow swine turducken, sirloin beef pancetta flank chislic filet mignon brisket venison ham hock hamburger. Frankfurter doner t-bone, boudin shoulder pork loin andouille. Filet mignon pastrami turducken porchetta, turkey shank beef ribs. Pancetta chicken brisket shankle tongue jerky alcatra corned beef. Ground round pork belly rump pork ball tip. Doner buffalo pancetta meatloaf frankfurter leberkas filet mignon hamburger. Tenderloin venison brisket swine pork sirloin. Rump venison pork loin pork belly boudin pig corned beef tail jowl buffalo sausage. Pork loin jerky andouille shankle t-bone pancetta pork chop. Biltong andouille corned beef landjaeger, jerky pancetta turducken kielbasa drumstick venison bacon prosciutto meatloaf pork. Pork loin landjaeger buffalo pork, sirloin ham hock boudin meatloaf kevin cow swine. Kevin ribeye jowl pig, ham chislic sirloin. Capicola bresaola turducken hamburger chuck, burgdoggen strip steak shoulder.";

class Blog extends StatelessWidget {
  const Blog({
    super.key,
    required this.title,
    required this.imagePath,
  });

  final String title;
  final String imagePath;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(title)),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 0,
              horizontal: 25,
            ),
            child: Column(
              children: [
                SvgPicture.asset(
                  imagePath,
                  width: 360,
                ),
                Text(title,
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    )),
                const SizedBox(height: 20),
                Text(
                  baconParagraphs,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.black87,
                    fontWeight: FontWeight.w400,
                  ),
                  textAlign: TextAlign.justify,
                ),
                ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (BuildContext context) {
                            return CityPage(imagePath, title);
                          },
                        ),
                      );
                    },
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Color(0xFF6C63FF)),
                      minimumSize:
                          MaterialStateProperty.all(Size(double.infinity, 40)),
                    ),
                    child: const Text("Navigate to test")),
              ],
            ),
          ),
        ));
  }
}

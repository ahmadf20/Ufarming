import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/style.dart';
import 'package:intl/intl.dart';
import 'package:ufarming/utils/my_colors.dart';
import 'package:ufarming/widgets/load_image.dart';
import 'package:ufarming/widgets/my_app_bar.dart';

class ArticleDetailScreen extends StatelessWidget {
  const ArticleDetailScreen({Key key}) : super(key: key);

  final String body = '''</div>
  <p>Attend a food conference today and in all likelihood there will be a tract on urban farming. There will be participants and speakers referring to themselves as urban farmers. Google “urban agriculture” and you will find thousand of sites. Urban farming is clearly in the minds eye of many individuals, community groups, food justice advocates, environmentalists, city planners and gardeners. That’s great, but what does it all mean, what is urban agriculture and why all the interest now? After all, growing food in cities is not a new concept.</p>
  <p>As with most things, ask two different people and you will get two different answers. So we’ll speak for ourselves and for what we’ve learned as urban farmers.</p>
  <h3>Simply put, urban farming is growing or producing food in a city or heavily populated town or municipality.</h3>
  <p>Urban agriculture is often confused with community gardening, homesteading or subsistence farming. We’re happy to be thought of in such fine company but the fact is that they are very different animals. What distinguishes us is that urban agriculture assumes a level of commerce, the growing of product to be sold as opposed to being grown for personal consumption or sharing. In community gardening, there is no such commercial activity.</p>
  <p>You don’t have to be a corporation to be an urban farm or have a large tract of land. An individual, a couple of friends, a nonprofit entity, or neighborhood group can start and run an urban farm. There is no one correct sales outlet for an urban farm. Food can be the sold to restaurants or at a farmers market, given to a local soup kitchen or church, but the food is raised primarily to be moved (through some form of commerce) from the grower to the user.</p>
  <p>As more of us begin to understand our food system, more of us seek to have more input into how food is grown, how it is treated after being harvested and how it moves from one place along the food route to another. People have begun to understand how far food travels, and that they, as the consumer, have had no say in what is grown or how it is grown. Urban agriculture can change that and in doing so it can take a rightful place is the larger food system.</p>
  <p>Urban agriculture has become a means to increase access to locally grown food and a way of reintroducing the public to the many aspects of food that we have lost as a culture. How food grows, what grows regionally and seasonally are all important lessons and make a better informed urban consumer. Urban farms can be the front line of the food system.</p>
  <p>For some the term urban implies inner city, like where Greensgrow is. For others, urban has come to mean areas that are on the perimeter of cities (what some refer to as peri-urban). There is no single characterization of size or placement; some are on rooftops, on landfills, brownfields, or areas where housing or industry may have been demolished. Some cities are giving up part of their park systems to allow urban farmers to plant their seeds. Every urban farm is different just as every rural farm is different.</p>
  <p>Zoning plays a big role in urban agriculture. It can dictate what kind of growing may be allowed, whether animals, retail sales, and even education can be part of the operation. Many cities have multiple restrictions on raising animals with the result that most urban farms don’t keep animals for production purposes. Farming, big or small, is almost always a regulated activity. The production and selling of a food is potentially rife with safety and liability issues, as well as commerce, zoning and cultural issues. Producing food for people to eat is a big responsibility and not to be entered into without a great deal of thought and planning.</p>
  <p>Some urban farms are built exclusively for education, training or re-entry programs. Many are built to improve food access in a specific community or to continue traditional culinary cultures. Some are built as for-profit concerns, recognizing that the savings on food transportation can make urban farming financially viable as well as more environmentally responsible. For others food justice is the reason to develop urban farms in their communities, which means improving the access to fresh food for economically disadvantaged communities.</p>''';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: MyAppBar(
          title: 'What is Urban farming',
        ),
      ),
      body: ListView(
        children: <Widget>[
          loadImage(
            'https://i2.wp.com/www.dara.co.id/wp-content/uploads/2019/07/URBAN..jpg?fit=900%2C489&ssl=1',
            isShowLoading: false,
            height: 250,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 25, 15, 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                    margin: EdgeInsets.all(8),
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Text(
                      'Hydroponics',
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 12,
                        color: MyColors.darkGrey,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 8, 0, 0),
                  child: Text(
                    'What is Urban farming',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 15, 0, 0),
                  child: Text(
                    'beautifulhomes • ${DateFormat('d MMMM yyyy').format(DateTime.now())}',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w500,
                      color: MyColors.grey,
                      fontSize: 14,
                    ),
                  ),
                ),
                SizedBox(height: 25),
                Divider(
                  height: 15,
                  indent: 10,
                  endIndent: 10,
                ),
                Html(
                  data: '''$body''',
                  style: {
                    "p": Style(
                      fontFamily: 'OpenSans',
                      fontSize: FontSize.medium,
                      color: MyColors.darkGrey,
                    ),
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
  //   return Scaffold(
  //     appBar: PreferredSize(
  //       preferredSize: Size.fromHeight(60),
  //       child: MyAppBar(),
  //     ),
  //     body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: []),
  //   );
  // }
}

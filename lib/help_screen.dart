import 'package:flutter/material.dart';

class policy extends StatelessWidget {
  const policy({Key? key}) : super(key: key);
  static const routeName = '/about-us';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Policy"),
        backgroundColor: Color.fromRGBO(7, 41, 77, 1),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(13.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Faham Content Policy",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                    'Faham is a service for self-expression and communication. We believe Blogger increases the availability of information, encourages healthy debate, and makes possible new connections between people. It is our belief that censoring this content is contrary to a service that bases itself on freedom of expression. However, in order to uphold these values, we need to curb abuses that threaten our ability to provide this service and the freedom of expression it encourages. As a result, there are some boundaries on the type of content that can be hosted with Faham. The boundaries we ve defined are those that both comply with legal requirements and that serve to enhance the service as a whole. We rely on blog readers to report content that they find inconsistent with Bloggers Community Guidelines. If you encounter a post that you believe violates Community Guidelines, please report it using the Report link located in the navigation of most blogs. If you are unable to find the link on the blog.'),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Community Guidelines",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                    'Our community guidelines play an important role in keeping the open web a welcoming place to create. Please respect these guidelines. We may update our policies from time to time, so please check back here. Note that when applying the policies below, we may make exceptions based on artistic, educational, documentary, or scientific considerations or where there are other substantial benefits to the public from not taking action on the content.'),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Adult Content",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                    'We do allow adult content on Faham, including information or news that contain nudity or sexual activity. If your blog has a warning interstitial, please do not attempt to circumvent or disable the interstitial - it is for everyone’s protection.There are some exceptions to our adult content policy: Do not use Faham as a way to make money on adult content. For example, dont create blogs that contain ads for or links to commercial porn sites. We do not allow illegal sexual content, including image, video or textual content that depicts or encourages rape, incest, bestiality, or necrophilia. Do not post or distribute private nude, sexually explicit, or non-explicit intimate and sexual images or videos without the subject’s consent. If someone has posted a private nude, sexually explicit, or non-explicit intimate and sexual image or video of you'),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Dangerous and Illegal Activities",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                    'Do not use this product to engage in illegal activities or to promote activities, goods, services, or information that cause serious and immediate harm to people. While we permit general information for educational, documentary, scientific, or artistic purposes about this content, we draw the line when the content directly facilitates harm or encourages illegal activity. We will take appropriate action if we are notified of unlawful activities, which may include reporting you to the relevant authorities.'),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Hate Speech",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                    'Do not engage in hate speech. Hate speech is content that promotes or condones violence against or has the primary purpose of inciting hatred against an individual or group on the basis of their race or ethnic origin, religion, disability, age, nationality, veteran status, sexual orientation, gender, gender identity, or any other characteristic that is associated with systemic discrimination or marginalization.'),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Spam",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                    'Do not spam. This may include unwanted promotional or commercial content, unwanted content that is created by an automated program, unwanted repetitive content, nonsensical content, or anything that appears to be a mass solicitation.'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

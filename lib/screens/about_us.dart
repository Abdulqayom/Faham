import 'package:flutter/material.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({Key? key}) : super(key: key);
  static const routeName = '/about-us';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("About Us"),
        backgroundColor: Color.fromRGBO(7, 41, 77, 1),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Welcome to Faham",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                    "We are publishing about health, lifestyle, Self-improvement, Daily-Inspiration, and Motivation to live a happier life. Our mission is to grow positive energy in the heart and mind of everyone."),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Why Choose us",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                    "We’re certainly not the only content making company out there, but we strive to be the best. One of our core principles is to only provide a quality of service that is proven and that we believe in. We’re the well known company that offers a fully-managed blog content service with an uncompromising level of quality and decades of experience, without the any price tag"),

                SizedBox(
                  height: 10,
                ),
                Text(
                  "Our Mission",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                    "To spread the power of optimism and create a better everyday life for the many people"),

                SizedBox(
                  height: 10,
                ),
                Text(
                  "Our Vision",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                    "Our vision is to create a better everyday life for many people.” That’s aspirational, short and to the point. More than that, it sets the tone for the company and makes it clear that they’re in the market to offer good information that suit everyone’s lifestyle."),

                SizedBox(
                  height: 10,
                ),
                Text(
                  "Group Members:",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    // color: Colors.cyan
                  ),
                ),
                Text(
                  "Abdul Qayom Siab",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Mujeeb Khan",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Sabawoon Khan",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                Text(
                  "Rafiullah Zaheen",
                  textAlign: TextAlign.left,
                  textDirection: TextDirection.ltr,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                SafeArea(
                  child: Container(
                    padding: EdgeInsets.only(left: 5, right: 2),
                    // margin: const EdgeInsets.all(2.0),
                    width: MediaQuery.of(context).size.width * .95,
                    // height: 140,
                    height: MediaQuery.of(context).size.height * .26,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black54,
                          // offset: Offset(0, 5),
                          blurRadius: 8.0,
                        ),
                      ],
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                              "https://faham.org/images/posts/1673597684.jpeg")
                          // 'https://faham.org/images/posts/' +
                          //     snapshot.data!
                          //         .data[position].image!
                          //         .toString()),
                          ),
                      //   AssetImage(
                      //       snapshot.data!.data[position].image.toString()),
                      //   fit: BoxFit.cover,
                      // ),
                    ),
                  ),
                ),
                // ElevatedButton(
                //   style: ElevatedButton.styleFrom(
                //     shape: const StadiumBorder(),
                //     primary: Isswitch ? Colors.purple : Colors.pink,
                //   ),
                //   onPressed: () {},
                //   child: Text("Test Button"),
                // ),
                // Switch(
                //     value: Isswitch,
                //     onChanged: (bool newbool) {
                //       setState(() {
                //         Isswitch = newbool;
                //       });
                //     }),
                SizedBox(
                  height: 10,
                ),
                // Image.asset("assets/image/gourp.jpg"),
                // SizedBox(height: 10),
                // Image.asset("assets/image/group2.jpg"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

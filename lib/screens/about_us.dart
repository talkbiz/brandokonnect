import 'package:flutter/material.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("About us"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 16, right: 16, top: 12),
          child: Column(
            children: [
              Text(
                """Bridging the digital device and empower individuals with access to the internet.\n\nBrandoKonnect's mission is to bridge the digital device and empower individuals with seamless access to the internet, regardless of their geographical location. With the successful satellite launch, the brand is one step closer to fulfilling this vision and revolutionizing the way people connect and communicate.\n\nAt the heart of BrandoKonnect innovation lies its cutting-edge virtual SIM technology, which is compatible with any 4G-enabled mobile device.\n\nThis technology ensures instant and hassle-free connectivity, allowing users to enjoy seamless browsing and unlimited data upload and download at remarkable speeds. By introducing this groundbreaking approach, BrandoKonnect aims to transform the internet experience for its users, providing them with unprecedented freedom and convenience.\n\nBrandoKonnect is a leading telecommunications brand dedicated to making affordable and fast internet data accessible to Africans and users across the globe. With cutting-edge virtual SIM technology and a vision for a digitally connected future, BrandoKonnect is poised to transform the internet experience for millions of users, providing seamless browsing and unlimited data at remarkable speeds.\n\nBenefits Of Brandokonnect:\n\n\t\t\t\t√ Browse without sim\n\t\t\t\t√ Browse with Unlimited data\n\t\t\t\t√ Browse with high speed like 3 to 5 times what we're using now\n\t\t\t\t√ Browse where there's no network coverage\n\t\t\t\t√ Browse with low rate or affordable price\n\nBrandoconnect as a telecommunication company provides its communities with progressive high quality communication technology services that enhance the value of life and economic development in the areas it serves within Nigeria and the wider world. Its goal is to provide efficiencies in communication technology consistent with the urban areas while even living in a rural area.\n\nIt takes pride in excellent service, integrity, and community involvement. Its peculiar trademark items include, high-speed internet service, data, API services, fintech, enterprise, and wireless telecommunication services with global coverage.\n\nThe company recognizes that its employees are vital to the organization and the achievement of her mission. It's committed to maintaining the progressive growth and success of the organization.\n\nThe CEO of the company vowed to provide solutions. This is to determine the need of every customer and deliver the best solution available.\n\nValues with our Members and Partners;\nOur team:\n\n\t\t\t\t•	Listens, understands and is responsive to needs and concerns\n\t\t\t\t•	Supports businesses with innovative solutions and consultation\n\t\t\t\t•	Builds trust through accountability, loyalty, fairness and integrity\n\t\t\t\t•	Communicates clearly, openly and on a timely basis.\n\nValues Among Ourselves;\n\nWe are Ambassadors for Brandoconnect Telecom. We demonstrate professionalism in all we do. We engage in critical thinking and deliberative discussion, and then, act with a sense of urgency to accomplish our goals, while remaining accountable for our actions.""",
                textAlign: TextAlign.justify,
              ),
              SizedBox(
                height: 50,
              )
            ],
          ),
        ),
      ),
    );
  }
}

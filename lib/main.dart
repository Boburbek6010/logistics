import 'package:logistics_company/setup.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'admin/pages/super_admin_page.dart';

void main() {
  setup().then((value) {
    return runApp(LayoutBuilder(
      builder: (context, constrains) {
        if(constrains.maxWidth >= 1200&&constrains.maxHeight >=635) {
          return const _MyAppWeb();
        }else{
          return const _MyAppOther();
        }
      }
    ));
  });
}

class _MyAppWeb extends StatelessWidget {
  const _MyAppWeb();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Logistics Company',
      home: kIsWeb ? const SuperAdminPage() :const Scaffold(body: Center(child: Text("This app in only available for web"),),),
      routes: {
        SuperAdminPage.id: (context) => const SuperAdminPage(),
      },
    );
  }
}

class _MyAppOther extends StatelessWidget {
  const _MyAppOther();

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Logistics Company',
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("App runs only in WEB", style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),),
              SizedBox(height: 30),
              Text("Please make sure you have a screen larger than 1200", style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),),
            ],
          ),
        ),
      )
    );
  }
}





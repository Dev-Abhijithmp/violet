import 'package:flutter/material.dart';
import 'package:paginated_search_bar/paginated_search_bar.dart';
import 'package:provider/provider.dart';
import 'package:violet/provider/homeprovider.dart';
import 'package:violet/utils/colors.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          topBar(),
          navbar(),
          Expanded(
            flex: 1,
            child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [MainColors.bShade700, MainColors.grey])),
                child: Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 60,
                      color: MainColors.maincolor,
                    ),
                    searchBar(context),
                  ],
                )),
          ),
        ],
      ),
    );
  }
}

Widget searchBar(BuildContext context) {
  return Consumer<HomeProvider>(builder: (context, pro, child) {
    return SizedBox(
      width: 400,
      height: pro.res.isEmpty ? 85 : (pro.controller.text == "" ? 85 : 350),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: PaginatedSearchBar(
            minSearchLength: 1,
            emptyBuilder: (context) {
              return const Text("0 Records Found");
            },
            spacerBuilder: (context) {
              return const SizedBox(
                height: 20,
              );
            },
            maxHeight: 200,
            hintText: "search city,hotels..",
            inputController: pro.controller,
            inputStyle: const TextStyle(color: Colors.black, fontSize: 15),
            itemBuilder: (context, {required index, required item}) {
              return SizedBox(
                height: 40,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Divider(),
                    Text(
                      item.displayName.toString(),
                      style: const TextStyle(fontSize: 15, color: Colors.black),
                    ),
                  ],
                ),
              );
            },
            onSubmit: ({item, required searchQuery}) {},
            onSearch: (
                {required pageIndex,
                required pageSize,
                required searchQuery}) async {
              return await pro.getSearchresults(searchQuery, context);
            },
          ),
        ),
      ),
    );
  });
}

Widget navbar() {
  return Container(
    color: Colors.white70,
    height: 50,
    width: double.infinity,
    child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.end,
        children: const [
          Padding(
            padding: EdgeInsets.all(8),
            child: TextButton(
              onPressed: null,
              child: Text(
                "Home",
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8),
            child: TextButton(
              onPressed: null,
              child: Text(
                "Packages",
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8),
            child: TextButton(
              onPressed: null,
              child: Text(
                "Hotels",
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8),
            child: TextButton(
              onPressed: null,
              child: Text(
                "Profile",
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8),
            child: TextButton(
              onPressed: null,
              child: Text(
                "Contact Us",
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
              ),
            ),
          ),
          SizedBox(
            width: 100,
          )
        ]),
  );
}

Widget topBar() {
  return Container(
    color: Colors.black38,
    height: 25,
    width: double.infinity,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.resolveWith(
                  (states) => MainColors.kred),
            ),
            onPressed: () {},
            child: const Text(
              'sign in',
              style: TextStyle(color: Colors.white),
            )),
        ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.resolveWith(
                (states) => Colors.teal.shade900,
              ),
            ),
            onPressed: () {},
            child: const Text(
              'Sign up',
              style: TextStyle(color: Colors.white),
            )),
        const SizedBox(
          width: 100,
        )
      ],
    ),
  );
}

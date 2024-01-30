import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_fe/entities/travel_entity.dart';
import 'package:http/http.dart' as http;

class HomeModule extends StatefulWidget {
  const HomeModule({super.key});

  @override
  State<HomeModule> createState() => _HomeModuleState();
}

class _HomeModuleState extends State<HomeModule> {
  @override
  Future<List<Travel>> fetchData() async {
    String url = "https://localhost:8080/travel/get-all";
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body) as List;
        return data.map((e) => Travel.valueFromJson(e)).toList();
      }
    } catch (e) {
      print(e);
    }
    return [];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      margin: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.all(10),
            child: Row(
              children: [
                Expanded(
                    flex: 1,
                    child: Column(
                      children: [
                        Container(
                          width: double.infinity,
                          height: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.pinkAccent,
                          ),
                          child: Center(
                            child: Image.asset("images/ico_hotel.png"),
                          ),
                        ),
                        const Text(
                          "Hotels",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w300),
                        )
                      ],
                    )),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    children: [
                      Container(
                        width: double.infinity,
                        height: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.pinkAccent,
                        ),
                        child: Center(
                          child: Image.asset("images/ico_plane.png"),
                        ),
                      ),
                      const Text(
                        "Flights",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w300),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                    flex: 1,
                    child: Column(
                      children: [
                        Container(
                          width: double.infinity,
                          height: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.pinkAccent,
                          ),
                          child: Center(
                            child: Image.asset("images/ico_hotel_plane.png"),
                          ),
                        ),
                        const Text(
                          "All",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w300),
                        )
                      ],
                    )),
              ],
            ),
          ),
          const Text(
            "Popular Destinations",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          FutureBuilder<List<Travel>>(
            future: fetchData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.hasError) {
                return const Text("Error loading data");
              } else if (snapshot.hasData) {
                List<Travel> places = snapshot.data!;
                return GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 20,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  children: places.map(
                    (Travel item) {
                      return Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(item.image ?? ""),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Stack(
                          children: [
                            Positioned(
                              bottom: 10,
                              left: 10,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    item.name ?? "",
                                    style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.star,
                                        color: Colors.white,
                                      ),
                                      const SizedBox(width: 4),
                                      Text(
                                        "${item.star}",
                                        style: const TextStyle(
                                            fontSize: 14, color: Colors.white),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      );
                    },
                  ).toList(),
                );
              } else {
                return const Text("No data");
              }
            },
          )
        ],
      ),
    );
  }
}

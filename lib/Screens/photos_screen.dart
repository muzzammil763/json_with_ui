import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:json_with_ui/Models/photos_model.dart';

class PhotosScreen extends StatefulWidget {
  const PhotosScreen({super.key});

  @override
  State<PhotosScreen> createState() => _PhotosScreenState();
}

class _PhotosScreenState extends State<PhotosScreen> {
  List<PhotosModel> photosModel = [];
  Future<List<PhotosModel>> getPhotos() async {
    final response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      for (Map<String, dynamic> i in data) {
        photosModel.add(PhotosModel.fromJson(i));
      }
      return photosModel = photosModel;
    } else {
      return photosModel = [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.blueAccent[700],
        title: const Text(
          'Photos Screen',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: FutureBuilder(
        future: getPhotos(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return RefreshIndicator(
            onRefresh: () async {
              getPhotos();
            },
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: photosModel.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.only(top: 8, left: 8, right: 8),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.blueAccent.withOpacity(0.2),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 16,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PhotosScreen(),
                              ),
                            );
                          },
                          child: CircleAvatar(
                            radius: 35,
                            backgroundImage: NetworkImage(
                              photosModel[index].url,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Row(
                          children: [
                            const SizedBox(
                              width: 4,
                            ),
                            RichText(
                              text: TextSpan(
                                text: 'Album ID: ',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blueAccent[700],
                                ),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: '${photosModel[index].albumId}',
                                    style: const TextStyle(
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              width: 12,
                            ),
                            RichText(
                              text: TextSpan(
                                text: 'ID: ',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: Colors.blueAccent[700],
                                ),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: '${photosModel[index].id}',
                                    style: const TextStyle(
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 4,
                          ),
                          child: RichText(
                            text: TextSpan(
                              text: 'Title: ',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Colors.blueAccent[700],
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                  text: photosModel[index].title,
                                  style: const TextStyle(
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class PhotoViewScreen extends StatelessWidget {
  const PhotoViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.blueAccent[700],
        title: const Text(
          'Photos Screen',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_osm/badapat_detail.dart';
import 'package:latlong2/latlong.dart';

class Tempat {
  final String name;
  final String imgUrl;
  final String address;
  final LatLng? location;
  final IconData icon;

  Tempat(
      {required this.name,
      required this.imgUrl,
      required this.address,
      required this.location,
      required this.icon});
}

final List<Tempat> cafes = [
  Tempat(
      name: 'Janji Jiwa BJB',
      address: 'Banjarbaru',
      location: LatLng(-6.21462, 106.82372),
      icon: Icons.local_cafe,
      imgUrl: ''),
  Tempat(
      name: 'Coffee Shop B',
      address: 'Banjarbaru',
      location: LatLng(-6.22169, 106.80494),
      icon: Icons.local_cafe,
      imgUrl: ''),
  Tempat(
      name: 'Coffee Shop C',
      address: 'Banjarbaru',
      location: LatLng(-6.22929, 106.84226),
      icon: Icons.local_cafe,
      imgUrl: ''),
];

final List<Tempat> hotels = [
  Tempat(
      name: 'Villa Bungas',
      address: 'Banjarbaru',
      location: LatLng(-3.4514050839932557, 114.78528323684355),
      icon: Icons.hotel,
      imgUrl: ''),
  Tempat(
      name: 'Penginapan Baiti Jannati',
      address: 'Banjarbaru',
      location: LatLng(-3.436492160641025, 106.82358),
      icon: Icons.hotel,
      imgUrl:
          'https://s-light.tiket.photos/t/01E25EBZS3W0FY9GTG6C42E1SE/t_htl-dskt/tix-hotel/images-web/2021/03/18/20d3a1cf-2007-405a-89c4-a8a9bf0065a4-1616071558222-e5086f23bfd048b52f5e9c837d65b9fd.jpg'),
  Tempat(
      name: 'Lerina Inn Hotel',
      address: 'Banjarbaru',
      location: LatLng(-3.4464145015441563, 114.83371496200562),
      icon: Icons.hotel,
      imgUrl:
          'https://imgcy.trivago.com/c_limit,d_dummy.jpeg,f_auto,h_600,q_auto,w_600//itemimages/38/27/3827918_v1.jpeg'),
  Tempat(
      name: 'Hotel Rodhita Banjarbaru',
      address: 'Banjarbaru',
      location: LatLng(3.442500375787276, 114.84575222687164),
      icon: Icons.hotel,
      imgUrl: ''),
  Tempat(
      name: 'Ana Guest House',
      address: 'Banjarbaru',
      location: LatLng(-3.4559140939484094, 114.8064315654378),
      icon: Icons.hotel,
      imgUrl: ''),
];

final List<Tempat> wisata = [
  Tempat(
      name: "Teman Van Der Pijl",
      address: "Kota Banjar Baru, Kalimantan Selatan",
      location: LatLng(-3.4417618255762794, 114.83116513902539),
      icon: Icons.location_pin,
      imgUrl: ''),
  Tempat(
      name: 'Soto Ratu Sari 2',
      address: 'Banjarbaru',
      location: LatLng(-6.19754, 106.81052),
      icon: Icons.location_pin,
      imgUrl: ''),
  Tempat(
      name: 'Mess L',
      address: 'Loktabat Utara, Kec. Banjarbaru Utara,',
      location: LatLng(-3.4413290585760747, 114.83799701153208),
      icon: Icons.location_pin,
      imgUrl: ''),
  Tempat(
      name: 'Kampung Purun',
      address: 'Banjarbaru',
      location: LatLng(-3.5033313032015925, 114.7851197520042),
      icon: Icons.location_pin,
      imgUrl: ''),
  Tempat(
      name: 'Kampung Iwak',
      address: 'Banjarbaru',
      location: LatLng(-3.483907483247795, 114.81953144073486),
      icon: Icons.location_pin,
      imgUrl: ''),
  Tempat(
      name: 'Hutan Pinus Mentaos',
      address: 'Banjarbaru',
      location: LatLng(-3.483907483247795, 114.81953144073486),
      icon: Icons.location_pin,
      imgUrl: ''),
  Tempat(
    name: 'Embung Sidodadi',
    address: 'Banjarbaru',
    location: LatLng(-3.483907483247795, 114.81953144073486),
    icon: Icons.location_pin,
    imgUrl: '',
  ),
  Tempat(
      name: 'Danau Seran',
      address: 'Banjarbaru',
      location: LatLng(-3.483907483247795, 114.81953144073486),
      icon: Icons.location_pin,
      imgUrl: ''),
  Tempat(
      name: 'AZ Express Food',
      address: 'Banjarbaru',
      location: LatLng(-3.483907483247795, 114.81953144073486),
      icon: Icons.location_pin,
      imgUrl: ''),
];

class BadapatYao extends StatefulWidget {
  const BadapatYao({super.key});

  @override
  State<BadapatYao> createState() => _BadapatYaoState();
}

class _BadapatYaoState extends State<BadapatYao> {
  List<Tempat> tempat = [];
  List<Marker> markers = [];
  late LatLng tappedLocation;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();

  final MapController mapController = MapController();
  String? selectedCategory;
  bool drawerOpened = false;

  final GlobalKey _one = GlobalKey();
  final GlobalKey _two = GlobalKey();
  final GlobalKey _three = GlobalKey();

  void _onKlik(LatLng latLng) {
    setState(() {
      tappedLocation = latLng;
    });
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Tambahkan Data'),
            content: Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextFormField(
                      controller: _nameController,
                      decoration: const InputDecoration(
                        labelText: "Nama Tempat",
                        hintText: "masukkan nama lokasi",
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Masukkan Nama Tempat";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    TextFormField(
                      controller: _addressController,
                      decoration: const InputDecoration(
                        labelText: "Nama jalan",
                        hintText: "masukkan nama jalan",
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Masukkan Alamat Tempat";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: "Lattitude & Longitude",
                      ),
                      readOnly: true,
                      // ignore: unnecessary_null_comparison
                      initialValue: tappedLocation != null
                          ? "${tappedLocation.latitude},${tappedLocation.longitude}"
                          : "",
                    ),
                  ],
                ),
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('Cancel'),
              ),
              TextButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      final newMarker = Tempat(
                          name: _nameController.text,
                          address: _addressController.text,
                          location: tappedLocation,
                          icon: Icons.location_history,
                          imgUrl: '');
                      setState(
                        () {
                          tempat.add(newMarker);
                          markers.add(
                            Marker(
                              point: newMarker.location!,
                              builder: (ctx) => Icon(
                                newMarker.icon,
                                color: Colors.red,
                                size: 50,
                              ),
                            ),
                          );
                          Navigator.of(context).pop();
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                            backgroundColor: Colors.red,
                            content: Text('Data berhasil ditambahkan'),
                            duration: Duration(seconds: 2),
                          ));
                          _formKey.currentState!.reset();
                        },
                      );
                    }
                  },
                  child: const Text('Save'))
            ],
          );
        });
  }

  @override
  void initState() {
    super.initState();
    tempat.addAll(cafes);
    tempat.addAll(hotels);
    tempat.addAll(wisata);
    tempat = [...cafes, ...hotels, ...wisata];
    markers = tempat.map((tempat) {
      return Marker(
          width: 80,
          height: 80,
          point: tempat.location!,
          builder: (ctx) => Icon(
                tempat.icon,
                color: Colors.redAccent,
                size: 50.0,
              ));
    }).toList();
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void _moveToLocation(LatLng location) {
    mapController.move(location, 18.0);
  }

  void _tapKategori(Tempat tempat) {
    setState(() {
      markers.clear();
      markers.add(
        Marker(
          width: 40,
          height: 40,
          point: tempat.location!,
          builder: (context) => Icon(tempat.icon),
        ),
      );
    });
    _moveToLocation(tempat.location!);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: Drawer(
        child: SafeArea(
          child: ListView(
            padding: const EdgeInsets.only(top: 20.0),
            children: [
              const Center(child: Text('Pilih Kategori')),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  ListTile(
                    title: const Text("Perbankan"),
                    leading: const CircleAvatar(
                      backgroundColor: Colors.grey,
                      backgroundImage: AssetImage('assets/images/bankaja.png'),
                    ),
                    selected: selectedCategory == "Wisata",
                    onTap: () {
                      setState(() {
                        mapController.move(wisata[0].location!, 13);
                        markers = wisata
                            .map((tempat) => Marker(
                                width: 100,
                                height: 100,
                                point: tempat.location!,
                                builder: (context) => Icon(
                                      tempat.icon,
                                      color: Colors.red,
                                      size: 40,
                                    )))
                            .toList();
                      });
                      Navigator.of(context).pop();
                    },
                  ),
                  SizedBox(
                    height: 130,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        children: [
                          _buildColItem('assets/images/atm.png', 'Atm'),
                          _buildColItem('assets/images/bankaja.png', 'Bank'),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              const Divider(),
              Column(
                children: [
                  ListTile(
                    title: const Text("Kafe"),
                    leading: const CircleAvatar(
                      backgroundColor: Colors.grey,
                      backgroundImage: AssetImage('assets/images/cafe.png'),
                    ),
                    selected: selectedCategory == "Cafes",
                    onTap: () {
                      setState(() {
                        mapController.move(cafes[0].location!, 13);
                        markers = cafes
                            .map((tempat) => Marker(
                                width: 60,
                                height: 60,
                                point: tempat.location!,
                                builder: (context) => Icon(tempat.icon)))
                            .toList();
                      });
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
              const Divider(),
              Column(
                children: [
                  ListTile(
                    title: const Text("Bengkel"),
                    leading: const CircleAvatar(
                      backgroundColor: Colors.grey,
                      backgroundImage: AssetImage('assets/images/bengkel.png'),
                    ),
                    selected: selectedCategory == "Cafes",
                    onTap: () {
                      setState(() {
                        mapController.move(cafes[0].location!, 13);
                        markers = cafes
                            .map((tempat) => Marker(
                                width: 60,
                                height: 60,
                                point: tempat.location!,
                                builder: (context) => Icon(tempat.icon)))
                            .toList();
                      });
                      Navigator.of(context).pop();
                    },
                  ),
                  SizedBox(
                    height: 130,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        children: [
                          InkWell(
                            onTap: () {
                              setState(() {
                                mapController.move(wisata[0].location!, 13);
                                markers = wisata
                                    .map((tempat) => Marker(
                                        width: 60,
                                        height: 60,
                                        point: tempat.location!,
                                        builder: (context) =>
                                            Icon(tempat.icon)))
                                    .toList();
                              });
                              Navigator.of(context).pop();
                            },
                            child: _buildColItem(
                                'assets/images/bengkel motor.png',
                                'Bengkel Motor'),
                          ),
                          _buildColItem('assets/images/bengkel mobil.png',
                              'Bengkel Mobil'),
                          _buildColItem(
                              'assets/images/tambal ban.png', 'Tambal Ban'),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              const Divider(),
              Column(
                children: [
                  ListTile(
                    title: const Text("Perkantoran"),
                    leading: const CircleAvatar(
                      backgroundColor: Colors.grey,
                      backgroundImage:
                          AssetImage('assets/images/perkantoran.png'),
                    ),
                    selected: selectedCategory == "Cafes",
                    onTap: () {
                      setState(() {
                        mapController.move(cafes[0].location!, 13);
                        markers = cafes
                            .map((tempat) => Marker(
                                width: 60,
                                height: 60,
                                point: tempat.location!,
                                builder: (context) => Icon(tempat.icon)))
                            .toList();
                      });
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
              const Divider(),
              Column(
                children: [
                  ListTile(
                    title: const Text("Wisata"),
                    leading: const CircleAvatar(
                      backgroundColor: Colors.grey,
                      backgroundImage: AssetImage('assets/images/wisata.png'),
                    ),
                    selected: selectedCategory == "wisata",
                    onTap: () {
                      setState(() {
                        mapController.move(wisata[0].location!, 13);
                        markers = wisata
                            .map((tempat) => Marker(
                                width: 100,
                                height: 100,
                                point: tempat.location!,
                                builder: (context) => Icon(
                                      tempat.icon,
                                      color: Colors.red,
                                      size: 40,
                                    )))
                            .toList();
                      });
                      Navigator.of(context).pop();
                    },
                  ),
                  SizedBox(
                    height: 130,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        children: [
                          InkWell(
                              onTap: () {
                                setState(() {
                                  mapController.move(wisata[0].location!, 13);
                                  markers = wisata
                                      .map((tempat) => Marker(
                                          width: 60,
                                          height: 60,
                                          point: tempat.location!,
                                          builder: (context) =>
                                              Icon(tempat.icon)))
                                      .toList();
                                });
                                Navigator.of(context).pop();
                              },
                              child: _buildColItem(
                                  'assets/images/kuliner.png', 'Kuliner')),
                          _buildColItem('assets/images/gereja.png', 'Gereja'),
                          _buildColItem('assets/images/vihara.png', 'Vihara')
                        ],
                      ),
                    ),
                  )
                ],
              ),
              const Divider(),
              Column(
                children: [
                  ListTile(
                    title: const Text("Ruang Publik"),
                    leading: const CircleAvatar(
                      backgroundColor: Colors.grey,
                      backgroundImage:
                          AssetImage('assets/images/free wifi.png'),
                    ),
                    selected: selectedCategory == "Cafes",
                    onTap: () {
                      setState(() {
                        mapController.move(cafes[0].location!, 13);
                        markers = cafes
                            .map((tempat) => Marker(
                                width: 100,
                                height: 100,
                                point: tempat.location!,
                                builder: (context) => Icon(
                                      tempat.icon,
                                      color: Colors.red,
                                      size: 40,
                                    )))
                            .toList();
                      });
                      Navigator.of(context).pop();
                    },
                  ),
                  SizedBox(
                    height: 130,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        children: [
                          _buildColItem(
                              'assets/images/free wifi.png', 'Wifi Gratis'),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              const Divider(),
              Column(
                children: [
                  ListTile(
                    title: const Text("Peternakan"),
                    leading: const CircleAvatar(
                      backgroundColor: Colors.grey,
                      backgroundImage:
                          AssetImage('assets/images/peternakan.png'),
                    ),
                    selected: selectedCategory == "Wisata",
                    onTap: () {
                      setState(() {
                        mapController.move(wisata[0].location!, 13);
                        markers = wisata
                            .map((tempat) => Marker(
                                width: 100,
                                height: 100,
                                point: tempat.location!,
                                builder: (context) => Icon(
                                      tempat.icon,
                                      color: Colors.red,
                                      size: 40,
                                    )))
                            .toList();
                      });
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
              const Divider(),
              Column(
                children: [
                  ListTile(
                    title: const Text("Perikanan"),
                    leading: const CircleAvatar(
                      backgroundColor: Colors.grey,
                      backgroundImage:
                          AssetImage('assets/images/perikanan.png'),
                    ),
                    selected: selectedCategory == "Cafes",
                    onTap: () {
                      setState(() {
                        mapController.move(cafes[0].location!, 13);
                        markers = cafes
                            .map((tempat) => Marker(
                                width: 60,
                                height: 60,
                                point: tempat.location!,
                                builder: (context) => Icon(tempat.icon)))
                            .toList();
                      });
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
              const Divider(),
              Column(
                children: [
                  ListTile(
                    title: const Text("Posko Bencana"),
                    leading: const CircleAvatar(
                      backgroundColor: Colors.grey,
                      backgroundImage:
                          AssetImage('assets/images/posko bencana.png'),
                    ),
                    selected: selectedCategory == "Cafes",
                    onTap: () {
                      setState(() {
                        mapController.move(cafes[0].location!, 13);
                        markers = cafes
                            .map((tempat) => Marker(
                                width: 60,
                                height: 60,
                                point: tempat.location!,
                                builder: (context) => Icon(tempat.icon)))
                            .toList();
                      });
                      Navigator.of(context).pop();
                    },
                  ),
                  SizedBox(
                    height: 130,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        children: [
                          _buildColItem(
                              'assets/images/dapur umum.png', 'Dapur Umum'),
                          _buildColItem(
                              'assets/images/pengungsian.png', 'Pengungsian'),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              const Divider(),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    setState(() {
                      _scaffoldKey.currentState?.openDrawer();
                    });
                  },
                  icon: const Icon(
                    Icons.menu,
                    size: 24.0,
                  ),
                ),
                const SizedBox(
                  width: 8.0,
                ),
                Expanded(
                  child: TextFormField(
                    decoration: const InputDecoration.collapsed(
                      filled: true,
                      fillColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      hintText: "Search",
                    ),
                    onFieldSubmitted: (value) {},
                  ),
                ),
              ],
            ),
            Expanded(
              child: FlutterMap(
                mapController: mapController,
                options: MapOptions(
                  center: LatLng(
                    -3.4565765861932363,
                    114.80708460537778,
                  ),
                  zoom: 14.0,
                  onTap: _onKlik,
                ),
                layers: [
                  TileLayerOptions(
                    urlTemplate:
                        'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                    subdomains: ['a', 'b', 'c'],
                  ),
                  MarkerLayerOptions(markers: markers),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 16.0, top: 10.0),
              child: Text(
                "Recommended Place",
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 8.0,
            ),
            CarouselSlider(
              items: tempat.map((marker) {
                return Container(
                    margin: const EdgeInsets.only(top: 20.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0)),
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      child: ListTile(
                        onTap: () {
                          Navigator.push(
                              context,
                              (MaterialPageRoute(
                                builder: (context) => BadapatDetail(
                                  judul: marker.name,
                                  alamat: marker.address,
                                  img: marker.imgUrl,
                                ),
                              )));
                        },
                        title: Text(marker.name),
                        subtitle: Text(
                          marker.address,
                          style: const TextStyle(
                              fontSize: 12.0, color: Colors.grey),
                        ),
                        leading: Icon(
                          marker.icon,
                          color: Colors.red,
                          size: 30,
                        ),
                      ),
                    ));
              }).toList(),
              options: CarouselOptions(
                height: 120.0,
                enlargeCenterPage: true,
                aspectRatio: 16 / 9,
                autoPlay: true,
                autoPlayCurve: Curves.fastOutSlowIn,
                enableInfiniteScroll: true,
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                viewportFraction: 0.8,
              ),
            ),
            const SizedBox(
              height: 20.0,
            )
          ],
        ),
      ),
    );
  }

  Widget _buildColItem(String? imgUrl, String? jdl) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            imgUrl!,
            width: 40.0,
            height: 40.0,
            fit: BoxFit.fill,
          ),
          Text(jdl!)
        ],
      ),
    );
  }
}

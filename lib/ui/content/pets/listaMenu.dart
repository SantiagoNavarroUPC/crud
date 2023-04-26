import 'package:crud_http/domain/controller/controllerPets.dart';
import 'package:crud_http/domain/controller/controllerUser.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListMenu extends StatefulWidget {
  const ListMenu({Key? key});

  @override
  _ListMenuState createState() => _ListMenuState();
}

class _ListMenuState extends State<ListMenu> {
  @override
  Widget build(BuildContext context) {
    ControlPets controlp = Get.find();
    ControlUser controlu = Get.find();
    int petId;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Mascotas'),
        backgroundColor: Colors.blue.shade800,
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.pushNamed(context, '/agregarPets');
            },
          ),
          IconButton(
            icon: Icon(Icons.list),
            onPressed: () {
              int iduser = controlu.listaUserLogin![0].id;
              controlp
                  .listarU(iduser)
                  .then((value) => Get.toNamed("/listaPets"));
            },
          ),
        ],
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemCount: controlp.listaPetsFinal!.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(2),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.05,
                height: MediaQuery.of(context).size.height * 0.05,
                color: Color.fromARGB(255, 35, 149, 201),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: MediaQuery.of(context).size.width * 0.09,
                      backgroundImage:
                          NetworkImage(controlp.listaPetsFinal![index].foto),
                    ),
                    SizedBox(height: 5),
                    Text(
                      controlp.listaPetsFinal![index].nombre,
                      style: const TextStyle(color: Colors.white, fontSize: 20),
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      controlp.listaPetsFinal![index].raza,
                      style: const TextStyle(color: Colors.white, fontSize: 15),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      "Id del Usuario: " +
                          controlp.listaPetsFinal![index].iduser.toString(),
                      style: const TextStyle(color: Colors.white, fontSize: 15),
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

import 'package:crud_http/domain/controller/controllerPets.dart';
import 'package:crud_http/domain/controller/controllerUser.dart';
import 'package:crud_http/ui/content/pets/modificarPets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListPets extends StatefulWidget {
  const ListPets({Key? key});

  @override
  _ListPetsState createState() => _ListPetsState();
}

class _ListPetsState extends State<ListPets> {
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
                      radius: MediaQuery.of(context).size.width * 0.06,
                      backgroundImage:
                          NetworkImage(controlp.listaPetsFinal![index].foto),
                    ),
                    SizedBox(height: 5),
                    Text(
                      controlp.listaPetsFinal![index].nombre,
                      style: const TextStyle(color: Colors.white, fontSize: 18),
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      controlp.listaPetsFinal![index].raza,
                      style: const TextStyle(color: Colors.white, fontSize: 14),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 3),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              petId = controlp.listaPetsFinal![index].id;
                              print(petId);
                              Navigator.pushNamed(context, '/modificarPets',
                                  arguments: petId);
                              controlp.listaPetsFinal!.removeAt(index);
                            },
                            style: ElevatedButton.styleFrom(
                              primary: Colors.blue.shade800,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 2),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(Icons.edit, size: 18),
                                const SizedBox(width: 5),
                                const Text('Modificar',
                                    style: TextStyle(fontSize: 14)),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 3),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/agregarPets');
                              controlp
                                  .eliminar(controlp.listaPetsFinal![index].id);
                              Get.snackbar('Mascota',
                                  controlp.listaMensajes1![0].mensaje,
                                  duration: const Duration(seconds: 2),
                                  icon: const Icon(Icons.info),
                                  shouldIconPulse: true,
                                  backgroundColor:
                                      Color.fromARGB(255, 21, 101, 192));
                              controlp.listaPetsFinal!.removeAt(index);
                            },
                            style: ElevatedButton.styleFrom(
                              primary: Colors.blue.shade800,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 2),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(Icons.delete, size: 18),
                                const SizedBox(width: 5),
                                const Text('Eliminar',
                                    style: TextStyle(fontSize: 14)),
                              ],
                            ),
                          ),
                        ),
                      ],
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

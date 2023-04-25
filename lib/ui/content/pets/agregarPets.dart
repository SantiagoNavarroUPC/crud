import 'package:crud_http/domain/controller/controllerPets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class RegisterPets extends StatelessWidget {
  const RegisterPets({Key? key});

  @override
  Widget build(BuildContext context) {
    ControlPets controlp = Get.find();
    final nombre = TextEditingController();
    final raza = TextEditingController();
    final foto = TextEditingController();

    Future<String?> getImage() async {
      final picker = ImagePicker();
      final pickedFile = await picker.getImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        foto.text = pickedFile.path;
        return foto.text;
      }
      return foto.text;
    }

    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/images/login.png'), fit: BoxFit.cover),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(children: [
          Container(
            padding: const EdgeInsets.only(left: 35, top: 80),
            child: const Text(
              "",
              style: TextStyle(
                  color: Color.fromARGB(255, 21, 101, 192), fontSize: 43),
            ),
          ),
          SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.only(
                  right: 35,
                  left: 35,
                  top: MediaQuery.of(context).size.height * 0.45),
              child: Column(children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Registrar Mascota',
                        style: TextStyle(
                          color: Color.fromARGB(255, 21, 101, 192),
                          fontSize: 27,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      CircleAvatar(
                        radius: 20,
                        backgroundColor: Color.fromARGB(255, 233, 153, 3),
                        child: IconButton(
                          color: Colors.white,
                          onPressed: () {
                            controlp
                                .crearPets(foto.text, nombre.text, raza.text)
                                .then((value) {
                              Get.snackbar(
                                  'Mascota', controlp.listaMensajes![0].mensaje,
                                  duration: const Duration(seconds: 3),
                                  icon: const Icon(Icons.info),
                                  shouldIconPulse: true,
                                  backgroundColor:
                                      Color.fromARGB(255, 21, 101, 192));
                              controlp
                                  .listar()
                                  .then((value) => Get.toNamed("/listaPets"));
                            });
                          },
                          icon: const Icon(Icons.arrow_forward),
                        ),
                      ),
                    ]),
                const SizedBox(
                  height: 30,
                ),
                TextField(
                  controller: nombre,
                  autofocus: true,
                  decoration: InputDecoration(
                    fillColor: Colors.grey.shade100,
                    filled: true,
                    hintText: 'Nombre',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextField(
                  controller: raza,
                  decoration: InputDecoration(
                    fillColor: Colors.grey.shade100,
                    filled: true,
                    hintText: 'Raza',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                  onPressed: () {
                    getImage();
                  },
                  child: Text('Seleccionar imagen'),
                ),
                TextField(
                  controller: foto,
                  decoration: InputDecoration(
                    fillColor: Colors.grey.shade100,
                    filled: true,
                    hintText: 'Foto',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: () {
                          controlp
                              .listar()
                              .then((value) => Get.toNamed("/listaPets"));
                        },
                        child: const Text(
                          'Ver lista',
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            fontSize: 18,
                            color: Color.fromARGB(255, 21, 101, 192),
                          ),
                        ),
                      ),
                    ]),
              ]),
            ),
          ),
        ]),
      ),
    );
  }
}

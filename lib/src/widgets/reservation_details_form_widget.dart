import 'dart:io';
import 'package:ecuaventure/src/models/foto_model.dart';
import 'package:ecuaventure/src/services/fotos_service.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ecuaventure/src/utils/colors_constants.dart' as color_const;
import 'package:cloud_firestore/cloud_firestore.dart';

class ReservationDetailsFormWidget extends StatefulWidget {
  const ReservationDetailsFormWidget({Key? key, required this.id})
      : super(key: key);
  final String id;

  @override
  State<ReservationDetailsFormWidget> createState() =>
      _ReservationDetailsFormWidgetState();
}

class _ReservationDetailsFormWidgetState
    extends State<ReservationDetailsFormWidget> {
  final _formKey = GlobalKey<FormState>();
  late Foto _foto;
  File? _imagen;
  final ImagePicker _picker = ImagePicker();
  bool _onSaving = false;
  final FotosService _fotosService = FotosService();
  CollectionReference collection =
      FirebaseFirestore.instance.collection('bikes');
  bool reservar = false;
  final int valor = 2;

  @override
  void initState() {
    _foto = Foto.created(widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SingleChildScrollView(
        child: Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 14.0),
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          width: size.width * .80,
          decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
              borderRadius: BorderRadius.circular(10.0),
              border: Border.all(
                  width: 2.0, color: Theme.of(context).primaryColorDark)),
          child: Form(
              key: _formKey,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 14.0, horizontal: 7.0),
                child: Column(
                  children: [
                    TextFormField(
                        keyboardType: TextInputType.text,
                        initialValue: _foto.observacion,
                        onSaved: (value) {
                          //Este evento se ejecuta cuando se cumple la validación y cambia el estado del Form
                          _foto.observacion = value.toString();
                        },
                        validator: (value) {
                          return _validateObservacion(value!);
                        },
                        decoration: const InputDecoration(
                            labelText: "Observación inicial"),
                        maxLength: 255,
                        maxLines: 3),
                    Padding(
                      padding: const EdgeInsets.only(top: 7.0),
                      child: Text("Ingresar la fecha",
                          style: Theme.of(context).textTheme.subtitle1),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 7.0),
                      child: Text("Subir imagen",
                          style: Theme.of(context).textTheme.subtitle1),
                    ),
                    SizedBox(
                      height: 100.h,
                      width: 150.h,
                      child: Padding(
                        padding: const EdgeInsets.all(7.0),
                        child: _imagen == null
                            ? Image.asset('assets/bikes.png')
                            : Image.file(_imagen!),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton.icon(
                          onPressed: () => _selectImage(ImageSource.camera),
                          icon: const Icon(Icons.camera),
                          label: const Text("Cámara"),
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  color_const.blueC)),
                        ),
                        ElevatedButton.icon(
                          onPressed: () => _selectImage(ImageSource.gallery),
                          icon: const Icon(Icons.image),
                          label: const Text("Galería"),
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  color_const.blueC)),
                        ),
                      ],
                    ),
                    _onSaving
                        ? const Padding(
                            padding: EdgeInsets.symmetric(vertical: 20.0),
                            child: CircularProgressIndicator())
                        : Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20.0),
                            child: Tooltip(
                              message: "Registrar inicio de mantenimiento",
                              child: ElevatedButton.icon(
                                onPressed: () {
                                  _sendForm();
                                },
                                label: const Text("Guardar"),
                                icon: const Icon(Icons.save),
                                style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            color_const.blueC)),
                              ),
                            ),
                          )
                  ],
                ),
              )),
        )
      ],
    ));
  }

  Future _selectImage(ImageSource source) async {
    XFile? pickedFile = await _picker.pickImage(source: source);
    if (pickedFile != null) {
      _imagen = File(pickedFile.path);
    } else {
      _imagen = null;
      //print('No image selected.');
    }
    setState(() {});
  }

  _sendForm() async {
    if (!_formKey.currentState!.validate()) return;
    _onSaving = true;
    setState(() {});

    //Vincula el valor de las controles del formulario a los atributos del modelo
    _formKey.currentState!.save();

    if (_imagen != null) {
      _foto.url = await _fotosService.uploadImage(_imagen!);
    }

    //Invoca al servicio POST para enviar la Foto
    int estado = await _fotosService.postFoto(_foto);
    if (estado == 201) {
      _formKey.currentState!.reset();
      _onSaving = false;
      _formKey.currentState!.setState(() {});
      setState(() {});
    }
  }

  String? _validateObservacion(String value) {
    return (value.length < 25)
        ? "Debe ingresar un mensaje con al menos 25 caracteres"
        : null; //Validación se cumple al retorna null
  }
}

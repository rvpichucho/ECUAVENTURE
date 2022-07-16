import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecuaventure/src/models/foto_model.dart';
import 'package:ecuaventure/src/pages/data_foto_page.dart';
import 'package:ecuaventure/src/services/fotos_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ecuaventure/src/utils/colors_constants.dart' as color_const;
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
  //consulta para el documento de identificacion
  User? user = FirebaseAuth.instance.currentUser;
  Foto _data = Foto();
  String imageUpload = '';

  @override
  void initState() {
    _foto = Foto.created(widget.id);
    super.initState();

    //consultas para saber si ya tiene registrada el documento de identificacion
    //bikes
    CollectionReference collectionBike =
        FirebaseFirestore.instance.collection('photos');
    collectionBike
        .where('iduser', isEqualTo: user!.uid)
        .get()
        .then((querySnapshot) {
      for (var doc in querySnapshot.docs) {
        // doc.data() is never undefined for query doc snapshots
        _data = Foto.fromJson(doc.data() as Map<String, dynamic>);
        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    //variales bool para activar o desactivar la visibilidad
    bool isVisible = false;
    bool isVisibleBotonNo = true;
    //condiciones para mostrar el check
    if (_data.url == null) {
      isVisible = true;
      isVisibleBotonNo = false;
      imageUpload = 'Subir su documento de identificación';
    } else {
      isVisible = false;
      isVisibleBotonNo = true;
      imageUpload =
          '¡Se va a utilizar su documento de identificación registrado!';
    }
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
                        initialValue: _foto.observation,
                        onSaved: (value) {
                          //Este evento se ejecuta cuando se cumple la validación y cambia el estado del Form
                          _foto.observation = value.toString();
                        },
                        validator: (value) {
                          return _validateObservacion(value!);
                        },
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                            labelText:
                                AppLocalizations.of(context)!.observation),
                        maxLength: 255,
                        maxLines: 3),

                    //codigo si estado de visibilidad
                    /*Padding(
                      padding: const EdgeInsets.symmetric(vertical: 7.0),
                      child: Text(AppLocalizations.of(context)!.image_upload,
                          style: Theme.of(context).textTheme.subtitle1),
                    ),
                    SizedBox(
                      height: 100.h,
                      width: 150.h,
                      child: Padding(
                        padding: const EdgeInsets.all(7.0),
                        child: _imagen == null
                            ? Image.asset('assets/CI.png')
                            : Image.file(_imagen!),
                      ),
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ElevatedButton.icon(
                            onPressed: () => _selectImage(ImageSource.camera),
                            icon: const Icon(Icons.camera),
                            label: Text(AppLocalizations.of(context)!.camera),
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        color_const.blueC)),
                          ),
                          ElevatedButton.icon(
                            onPressed: () => _selectImage(ImageSource.gallery),
                            icon: const Icon(Icons.image),
                            label: Text(AppLocalizations.of(context)!.image),
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        color_const.blueC)),
                          ),
                        ],
                      ),*/
                    //codigo con estado de visibilidad
                    //codigo para mostrar si tiene el documento de identificacion registrado
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 7.0),
                      child: Text(imageUpload,
                          style: Theme.of(context).textTheme.subtitle1),
                    ),
                    Visibility(
                      visible: isVisibleBotonNo,
                      child: ElevatedButton.icon(
                        onPressed: () {
                          setState(() {
                            isVisibleBotonNo = !isVisibleBotonNo;
                            isVisible = true;
                            _data.url = null;
                          });
                        },
                        icon: const Icon(Icons.not_interested_outlined),
                        label: const Text("No"),
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                color_const.blueC)),
                      ),
                    ),

                    //mostrar el documento de identificacion tomado por a camara o galeria
                    Visibility(
                      visible: isVisible,
                      child: SizedBox(
                        height: 100.h,
                        width: 150.h,
                        child: Padding(
                          padding: const EdgeInsets.all(7.0),
                          child: _imagen == null
                              ? Image.asset('assets/CI.png')
                              : Image.file(_imagen!),
                        ),
                      ),
                    ),
                    //mostrar los botones de camara y galeria
                    Visibility(
                      visible: isVisible,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ElevatedButton.icon(
                            onPressed: () => _selectImage(ImageSource.camera),
                            icon: const Icon(Icons.camera),
                            label: Text(AppLocalizations.of(context)!.camera),
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        color_const.blueC)),
                          ),
                          ElevatedButton.icon(
                            onPressed: () => _selectImage(ImageSource.gallery),
                            icon: const Icon(Icons.image),
                            label: Text(AppLocalizations.of(context)!.image),
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        color_const.blueC)),
                          ),
                        ],
                      ),
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
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const FotoPage()));
                                },
                                label: Text(AppLocalizations.of(context)!.save),
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
    } else {
      _foto.url = _data.url;
    }

    //guardar el valor del id usuario
    _foto.iduser = user!.uid;

    //Invoca al servicio POST para enviar la Foto
    int estado = await _fotosService.postDetailsPhoto(_foto);
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

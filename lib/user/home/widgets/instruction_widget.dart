import 'package:flutter/material.dart';

class InstructionWidget extends StatelessWidget {
  const InstructionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 400),
      color: Colors.white,
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      child: const Text("Qonun qoidalarga amal qilgan holda Bismillah deb taskni boshlang..."
          "Start a survay tugmasini bosib siz taskni bajarishni boshlagan bo'lasiz. Sizda"
          "Jami hisobda 5 ta masala hamda uni yechish uchun 2 soat vaqt bor. Vaqtingizdan unumli"
          "foydalaning va cheating qilmang. Har qanday turdagi ortiqcha hatti-harakatlar sizni "
          "imtixondan chetlatishga sabab bo'lishi mumkin (Kimdandur ko'chirishga urunish, "
          "Internetdan foydalanish, Telegram va shunga o'xshash boshqa ijtimoiy tarmoqlardan "
          "foydalanish, ChatGPT dan foydalanish va hokazo. Yuqoridagi Tugmani bosing va Task ni boshlang", style: TextStyle(
        fontSize: 20,
        // letterSpacing: 1.5,
        wordSpacing: 3,
        fontStyle: FontStyle.italic
      ),),
    );
  }
}

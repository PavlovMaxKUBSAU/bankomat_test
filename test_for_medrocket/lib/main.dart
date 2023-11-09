// class ATM {
//   ATM({
//     required this.banknote_100,
//     required this.banknote_500,
//     required this.banknote_1000,
//     required this.banknote_5000
//   });
//
//   static ATM Clone(ATM allMoney) {
//     return ATM(
//       banknote_100:   allMoney.banknote_100,
//       banknote_500:   allMoney.banknote_500,
//       banknote_1000:  allMoney.banknote_1000,
//       banknote_5000:  allMoney.banknote_5000
//     );
//   }
//
//   late int banknote_100;
//   late int banknote_500;
//   late int banknote_1000;
//   late int banknote_5000;
// }



/// например такой набор купюр в банкомате
var allMoney = {
  5000: 2,
  1000: 3,
  500:  7,
  100:  1,
};

void main() {
  getMoneyFromATM(12600);
}

void getMoneyFromATM(int giveOut) {
  if (giveOut % 100 != 0) {
    print("Сумма должна быть кратна 100");
    return;
  }

  int banknote_need;
  var allMoney2 = allMoney.map((key, value) {
    banknote_need = giveOut~/key;
    if (banknote_need > 0 && value > 0) {
      if (banknote_need < value) {
        value -= banknote_need;
        giveOut -= banknote_need*key;
      }
      else {
        giveOut -= value*key;
        value = 0;
      }
    }

    return MapEntry(key, value);
  });

  if (giveOut > 0) {
    print("Невозможно выдать данную сумму");
  }
  else {
    print(
      "Сумма выдана.\n\n"
      "Количество оставшихся номиналов купюр:\n"
      "${allMoney2[100]} шт. номинала 100\n"
      "${allMoney2[500]} шт. номинала 500\n"
      "${allMoney2[1000]} шт. номинала 1000\n"
      "${allMoney2[5000]} шт. номинала 5000\n"
    );

    allMoney = allMoney2;
  }
}
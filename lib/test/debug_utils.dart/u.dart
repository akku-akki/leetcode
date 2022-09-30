// print("\033[31mThis is red font.\033[0m")
// print("\033[32mThis is green font.\033[0m")
// print("\033[33mThis is yellow font.\033[0m")
// print("\033[34mThis is blue font.\033[0m")
// print("\033[38mThis is the default font. \033[0m")  # More than 37 will display the default font.

enum C {
  red,
  green,
  yellow,
  blue,
  purple,
  cyan,
}

void cPrint({dynamic? output, C? c}) {
  switch (c) {
    case C.red:
      print("\u001b[1;31m ${output} \u001b[0m");
      break;
    case C.green:
      print("\u001b[1;32m ${output} \u001b[0m");
      break;
    case C.yellow:
      print("\u001b[1;33m ${output} \u001b[0m");
      break;
    case C.blue:
      print("\u001b[1;34m ${output} \u001b[0m");
      break;
    case C.purple:
      print("\u001b[1;35m ${output} \u001b[0m");
      break;
    case C.cyan:
      print("\u001b[1;36m ${output} \u001b[0m");
      break;
    default:
      print("\u001b[0m ${output} \u001b[0m");
  }
}

void cPrintBg({dynamic? output, C? c}) {
  switch (c) {
    case C.red:
      print("\u001b[1;41m ${output} \u001b[0m");
      break;
    case C.green:
      print("\u001b[1;42m ${output} \u001b[0m");
      break;
    case C.yellow:
      print("\u001b[1;43m ${output} \u001b[0m");
      break;
    case C.blue:
      print("\u001b[1;44m ${output} \u001b[0m");
      break;
    case C.purple:
      print("\u001b[1;45m ${output} \u001b[0m");
      break;
    case C.cyan:
      print("\u001b[1;46m ${output} \u001b[0m");
      break;
    default:
      print("\u001b[0m ${output} \u001b[0m");
  }
}

void cPrintReset() {
  print("\u001b[0m");
}

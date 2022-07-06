


class Sorting{

  static Future<List<dynamic>> bubbleSort(List<dynamic> list) async {
    List<dynamic> sortedList = List.from(list);

    for (int end = sortedList.length - 1; end > 0; end--) {
      bool isSwapped = false;
      for (int current = 0; current < end; current++) {
        if (sortedList[current].compareTo(sortedList[current + 1]) > 0) {
          swap(sortedList, current, current + 1);
          isSwapped = true;
        }
      }
      if (!isSwapped) return sortedList;
    }

    return sortedList;
  }


  static Future<List<dynamic>> selectionSort(List<dynamic> list) async {
    List<dynamic> sortedList = List.from(list);

    for (int start = 0; start < sortedList.length - 1; start++) {
      int lowest = start;
      for (int next = start + 1; next < sortedList.length; next++) {
        if (sortedList[next].compareTo(sortedList[lowest]) < 0) {
          lowest = next;
        }
      }
      if (lowest != start) {
        swap(sortedList, lowest, start);
      }
    }

    return sortedList;
  }

  static Future<List<dynamic>> insertionSort(List<dynamic> list) async {
    List<dynamic> sortedList = List.from(list);

    for (int current = 1; current < sortedList.length; current++) {
      dynamic key = sortedList[current];
      int shifting = current - 1;

      while (shifting >= 0 && sortedList[shifting].compareTo(key) > 0) {
        sortedList[shifting + 1] = sortedList[shifting];
        shifting--;
      }
      sortedList[shifting + 1] = key;
    }
    return sortedList;
  }


  static void swap<E>(List<E> list, int i, int j) {
    final temp = list[i];
    list[i] = list[j];
    list[j] = temp;
  }
}
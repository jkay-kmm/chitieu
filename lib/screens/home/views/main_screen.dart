import 'package:expense_repository/expense_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// Tệp này được tạo tự động khi bạn chạy lệnh flutterfire configure
import 'package:cloud_firestore/cloud_firestore.dart';

class MainScreen extends StatefulWidget {
  final List<Expense> expenses;


  MainScreen(this.expenses, {super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  double _calculateTotalAmount() {
    double total = 0.0;
    for (var expense in widget.expenses) {
      total += expense.amount;
    }
    return total;
  }

  TextEditingController amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: buildPadding(context),
    );
  }

  Padding buildPadding(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.yellow[700]
                        ),
                      ),
                      Icon(
                        CupertinoIcons.person_fill,
                        color: Colors.yellow[800],
                      )
                    ],
                  ),
                  const SizedBox(width: 8,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Chào!",
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: Theme.of(context).colorScheme.outline
                        ),
                      ),
                      Text(
                        " Trung",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.onBackground
                        ),
                      )
                    ],
                  ),
                ],
              ),
              IconButton(onPressed: () {}, icon: const Icon(CupertinoIcons.settings))
            ],
          ),
          const SizedBox(height: 20,),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.width / 2,
            decoration: BoxDecoration(
                color: const Color(0xFF00B2E7),
                borderRadius: BorderRadius.circular(25),
                boxShadow: [
                  BoxShadow(
                      blurRadius: 4,
                      color: Colors.grey.shade300,
                      offset: const Offset(5, 5)
                  )
                ]
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Total Balance',
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.w600
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  '\$${_calculateTotalAmount().toStringAsFixed(2)}',
                  style:const TextStyle(
                      fontSize: 40,
                      color: Colors.white,
                      fontWeight: FontWeight.bold
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 25,
                            height: 25,
                            decoration: const BoxDecoration(
                                color: Colors.white30,
                                shape: BoxShape.circle
                            ),
                            child: const Center(
                                child: Icon(
                                  CupertinoIcons.arrow_up,
                                  size: 12,
                                  color: Colors.greenAccent,
                                )
                            ),
                          ),
                          const SizedBox(width: 8),
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Income',
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400
                                ),
                              ),
                              Text(
                                '\$ 2500.00',
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            width: 25,
                            height: 25,
                            decoration: const BoxDecoration(
                                color: Colors.white30,
                                shape: BoxShape.circle
                            ),
                            child: const Center(
                                child: Icon(
                                  CupertinoIcons.arrow_down,
                                  size: 12,
                                  color: Colors.red,
                                )
                            ),
                          ),
                          const SizedBox(width: 8),
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Expense',
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400
                                ),
                              ),
                              Text(
                                '\$ 800.00',
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600
                                ),
                              ),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Transactions',
                style: TextStyle(
                    fontSize: 16,
                    color:Colors.black,
                    fontWeight: FontWeight.bold
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Text(
                  'View All',
                  style: TextStyle(
                      fontSize: 14,
                      color: Theme.of(context).colorScheme.outline,
                      fontWeight: FontWeight.w400
                  ),
                ),
              )
            ],
          ),
          const SizedBox(height: 20),
          Expanded(
            child: ListView.builder(
                itemCount: widget.expenses.length,
                itemBuilder: (context, int i) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: Dismissible(
                      key: Key(widget.expenses[i].toString()),
                      background: Container(
                        color: Colors.red,
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.only(left: 20.0),
                        child: const Icon(Icons.delete, color: Colors.white),
                      ),
                      secondaryBackground: Container(
                        color: Colors.blue,
                        alignment: Alignment.centerRight,
                        padding: const EdgeInsets.only(right: 20.0),
                        child: const Icon(Icons.edit, color: Colors.white),
                      ),
                      confirmDismiss: (direction) async {
                        if (direction == DismissDirection.startToEnd) {
                          // Hiển thị dialog khi vuốt sang phải
                          return await showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: const Text('Xóa mục'),
                                content: Text('Bạn có chắc muốn xóa ${widget.expenses[i].category.name}?'),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop(false); // Đóng dialog khi nhấn "Hủy"
                                    },
                                    child: const Text('Hủy'),
                                  ),
                                  TextButton(
                                    onPressed: () async {
                                      // Thực hiện hành động xóa từ Firebase
                                      await FirebaseFirestore.instance
                                          .collection('expenses')
                                          .doc(widget.expenses[i].expenseId) // Giả sử mỗi expense có một ID duy nhất
                                          .delete()
                                          .then((_) {
                                        // Hiển thị thông báo thành công
                                        ScaffoldMessenger.of(context).showSnackBar(
                                          SnackBar(content: Text('${widget.expenses[i].category.name} đã bị xóa')),
                                        );
                                      }).catchError((error) {
                                        // Hiển thị thông báo lỗi
                                        ScaffoldMessenger.of(context).showSnackBar(
                                          SnackBar(content: Text('Xóa thất bại: $error')),
                                        );
                                      });

                                      Navigator.of(context).pop(true); // Đóng dialog sau khi thực hiện xóa
                                    },
                                    child: const Text('Xóa'),
                                  ),
                                ],
                              );
                            },
                          );

                        } else {
                          return await  showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: const Text('Chỉnh sửa mục'),
                                content: Text('Bạn muốn chỉnh sửa ${widget.expenses[i].category.name}?'),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop(false ); // Đóng dialog khi nhấn "Hủy"
                                    },
                                    child: const Text('Hủy'),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      print('okk');
                                      // Mở Bottom Sheet để chỉnh sửa
                                      showModalBottomSheet(
                                        context: context,
                                        isScrollControlled: true,
                                        builder: (BuildContext context) {
                                          return Padding(
                                            padding: EdgeInsets.only(
                                              bottom: MediaQuery.of(context).viewInsets.bottom,
                                            ),
                                            child: Container(
                                              padding: const EdgeInsets.all(16.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Chỉnh sửa ${widget.expenses[i].category.name}',
                                                    style: const TextStyle(
                                                      fontSize: 18,
                                                      fontWeight: FontWeight.bold,
                                                    ),
                                                  ),
                                                  const SizedBox(height: 16),
                                                  TextField(
                                                    controller: TextEditingController(text: widget.expenses[i].amount.toString()),
                                                    decoration: const InputDecoration(
                                                      labelText: 'Số tiền',
                                                      border: OutlineInputBorder(),
                                                    ),
                                                    keyboardType: TextInputType.number,
                                                    onChanged: (value) {
                                                      // Cập nhật số tiền khi người dùng nhập
                                                      amountController.text = value;
                                                      // Có thể lưu giá trị vào biến để sử dụng khi lưu thay đổi
                                                    },
                                                  ),

                                                  const SizedBox(height: 16),
                                                  ElevatedButton(
                                                    onPressed: () async {
                                                      // Cập nhật dữ liệu lên Firebase
                                                      try {
                                                        await FirebaseFirestore.instance
                                                            .collection('expenses')
                                                            .doc(widget.expenses[i].expenseId)
                                                            .update({
                                                          'amount': int.parse(amountController.text), // Sử dụng giá trị mới
                                                          // Thêm các trường khác nếu cần
                                                        });

                                                        ScaffoldMessenger.of(context).showSnackBar(
                                                          SnackBar(content: Text('${widget.expenses[i].category.name} đã được cập nhật')),
                                                        );
                                                      } catch (error) {
                                                        print('Error updating document: $error');
                                                        ScaffoldMessenger.of(context).showSnackBar(
                                                          SnackBar(content: Text('Cập nhật thất bại: $error')),
                                                        );
                                                      }

                                                      Navigator.of(context).pop(false); // Đóng Bottom Sheet sau khi cập nhật
                                                    },
                                                    child: const Text('Lưu thay đổi'),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          );
                                        },
                                      );
                                      Navigator.of(context).pop(false); // Đóng dialog sau khi nhấn "Chỉnh sửa"
                                    },
                                    child: const Text('Chỉnh sửa'),
                                  ),
                                ],
                              );
                            },
                          );
                        }
                      },
                      onDismissed: (direction) {
                        // This part is reached only if confirmDismiss returns true
                        setState(() {
                          widget.expenses.removeAt(i);
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12)
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      Container(
                                        width: 50,
                                        height: 50,
                                        decoration: BoxDecoration(
                                            color: Color(widget.expenses[i].category.color),
                                            shape: BoxShape.circle
                                        ),
                                      ),
                                      Image.asset(
                                        'assets/${widget.expenses[i].category.icon}.png',
                                        scale: 2,
                                        color: Colors.white,
                                      )
                                    ],
                                  ),
                                  const SizedBox(width: 12),
                                  Text(
                                    widget.expenses[i].category.name,
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Theme.of(context).colorScheme.onBackground,
                                        fontWeight: FontWeight.w500
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    "\$${widget.expenses[i].amount}.00",
                                    style: const TextStyle(
                                        fontSize: 14,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w400
                                    ),
                                  ),
                                  Text(
                                    DateFormat('dd/MM/yyyy').format(widget.expenses[i].date),
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Theme.of(context).colorScheme.outline,
                                        fontWeight: FontWeight.w400
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                }
            ),
          )
        ],
      ),
    );
  }
}


import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';
class TransactionSelectionItem extends StatelessWidget {
  const TransactionSelectionItem({
    Key key,
    @required this.transactions,
    @required this.deleteTransactions,
  }) : super(key: key);

  final Transaction transactions;
  final Function deleteTransactions;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape:StadiumBorder(
        side: BorderSide(
          color: Theme.of(context).primaryColor,
          width: 2.0,
        ),
      ),
      elevation: 5,
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
      child: ListTile(
        leading: CircleAvatar(
          radius: 30.0,
          child: Padding(
            padding: EdgeInsets.all(6),
            child: FittedBox(
              child: Text('\$ ${transactions.amount}'),
            ),
          ),
        ),
        title: Text(
          transactions.title,
          style: Theme.of(context).textTheme.title,
        ),
        subtitle: Text(
            DateFormat.yMMMMEEEEd().format(transactions.date)),
        trailing: MediaQuery.of(context).size.width > 365
            ? FlatButton.icon(
            textColor: Theme.of(context).errorColor,
            onPressed: () =>
                deleteTransactions(transactions.id),
            icon: Icon(Icons.delete),
            label: Text('Delete'))
            : IconButton(
          icon: Icon(
            Icons.delete,
            color: Theme.of(context).accentColor,
          ),
          onPressed: () =>
              deleteTransactions(transactions.id),
          color: Theme.of(context).errorColor,
        ),
      ),
    );
  }
}

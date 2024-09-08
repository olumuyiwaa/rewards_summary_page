# rewards_summary_page
![Screenshot 2024-09-08 at 2 52 45 AM](https://github.com/user-attachments/assets/2536e320-fe1c-4d65-9a00-20992e52dfa4)

# Handling of Cashback History

I created the CashbackTile class which has four properties:

cashBackAmount: a double value representing the cashback amount
transactionDate: a String value representing the transaction date
transactionTitle: a String value representing the transaction title
transactionID: a String value representing the transaction ID

Use of Formatter

Created NumberFormat object called formatter to format the cashback amount with commas and two decimal places (e.g., 1,000.00).

Created the tile for the cashback history instead of using listTile for the purpose of flexibility and total controll of the tile

this tile gets passed into a list builder whenever a transation data is added to cashbackHistory "**dummy data**" (a list of transations which help to generate the cashback values)

The container's child is a Row widget with two Column children. The first column displays the transaction information, and the second column displays the cashback amount and a calculated value (more on this later).

Transaction Information Column

The first column has two Text widgets:

The first Text widget displays the transaction title and ID, separated by a space and "(ID: )".
The second Text widget displays the transaction date with a smaller font size, bold font weight, and gray color.
Cashback Amount Column

The second column has two Text widgets:

The first Text widget displays the cashback amount formatted with the formatter object, with a font size of 16.
The second Text widget displays a calculated value, which is the cashback amount multiplied by 1.5% (i.e., cashBackAmount * (1.5 / 100)). This value is also formatted with the formatter object, with a smaller font size.

# Created a Cashout history to track withdrawn cashsback and help in calculating the Current Balance with is the value remaining from Total Cashback Earned after any Cashout is made

# Created 2 distinct buttons to handle Direct Cashout and convertion of cashout to promo codes which the method to handle this 2 senerios can be added into the code seamlessly

# rewards_summary_page
